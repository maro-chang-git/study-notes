-- ============================================
-- This script is the guideline to COMPARES source tables with target tables post-ETL
-- It includes steps for filtering, flattening, normalizing, and field-level comparison
-- Author: Charis Dang (Dang Quynh Trang)
-- Date: 2026-01-15
-- Get latest records from SOURCE TABLES based on conditions (date window, status)
-- ============================================
WITH
-- 1) Get latest records from source tables
src1_raw AS (
    --source table1 example
    SELECT * from (
        SELECT 
          recid,
          sector,
          op_type
        FROM `ncb-dp-uat-ency.ncb_dp_dev_landing.CUSTOMER`
        QUALIFY ROW_NUMBER() OVER (PARTITION BY RECID ORDER BY op_ts DESC,current_ts DESC) = 1 -- get latest record per business key
    )
    WHERE SECTOR LIKE '2%' and op_type!='D'   -- filter out deleted records
),
src2_raw AS (
    SELECT *
    FROM source_db.table2 s2
    QUALIFY ROW_NUMBER() OVER (PARTITION BY s2.business_key ORDER BY s2.updated_at DESC) = 1
),
-- 2) Filter source tables with conditions (date window, status, etc.)
src1_filtered AS (
    SELECT *
    FROM src1_raw
    WHERE status IN ('ACTIVE','COMPLETED')
      AND event_date BETWEEN DATE '2025-10-01' AND DATE '2025-10-31'
),
src2_filtered AS (
    SELECT *
    FROM src2_raw
    WHERE status IN ('ACTIVE','COMPLETED')
      AND event_date BETWEEN DATE '2025-10-01' AND DATE '2025-10-31'
),
-- 3) Flattened source tables (join/unnest arrays, expand nested structs)
-- Example: join src1 and src2 on a shared business key and unnest nested collections where needed
src_flat AS (
    SELECT
        s1.business_key,
        s1.order_id,
        s1.event_date,
        s1.currency_code,
        s1.amount,
        s2.tax_amount,
        s2.discount_amount,
        s1.country, s1.status,
        -- example of flattening: (adjust to your platform)
        -- f.item_id, f.item_qty
        -- FROM UNNEST(s1.items) AS f   -- BigQuery style if s1 has arrays
    FROM src1_filtered s1
    LEFT JOIN src2_filtered s2
      ON s1.business_key = s2.business_key
),
-- 4) Normalize source tables (trim/casefold, data type alignment, null handling, rounding)
src_data AS (
    SELECT
        business_key,
        order_id,
        DATE(event_date) AS order_date,                      -- normalize to DATE
        UPPER(TRIM(country)) AS country_norm,                -- text normalization
        UPPER(TRIM(currency_code)) AS currency_norm,
        ROUND(COALESCE(amount, 0.0), 2) AS amount_norm,      -- numeric normalization
        ROUND(COALESCE(tax_amount, 0.0), 2) AS tax_norm,
        ROUND(COALESCE(discount_amount, 0.0), 2) AS discount_norm,
        status
    FROM src_flat
),
-- ============================================
-- TARGET TABLE: Get latest data systm_dt + filter conditions
-- ============================================
-- 5) Target table
trg_data AS (
    SELECT
        business_key,
        order_id,
        DATE(order_date) AS order_date,
        UPPER(TRIM(country)) AS country_norm,
        UPPER(TRIM(currency_code)) AS currency_norm,
        ROUND(COALESCE(amount, 0.0), 2) AS amount_norm,
        ROUND(COALESCE(tax_amount, 0.0), 2) AS tax_norm,
        ROUND(COALESCE(discount_amount, 0.0), 2) AS discount_norm,
        status
    FROM analytics.orders_fact
    WHERE order_date BETWEEN DATE '2025-10-01' AND DATE '2025-10-31'
      AND status IN ('ACTIVE','COMPLETED')
)
-- ============================================
-- Compare SOURCE & TARGET
-- ============================================
-- 6) Count total records and differing records between SOURCE and TARGET
SELECT
    (SELECT COUNT(*) FROM src_data) AS total_src_records,
    (SELECT COUNT(*) FROM trg_data) AS total_trg_records,
    (
        SELECT COUNT(*)
        FROM (
            (SELECT * FROM src_data EXCEPT DISTINCT SELECT * FROM trg_data)
            UNION ALL
            (SELECT * FROM trg_data EXCEPT DISTINCT SELECT * FROM src_data)
        ) diff
    ) AS nums_diff_records;
-- ============================================
-- Debugging: Detailed comparison results
-- ============================================
-- 7)Field-level comparison between SOURCE and TARGET
-- ,
-- comparison_result AS (
--   -- Records only in source
--   (
--     SELECT 'SRC_ONLY' as diff_type, account_number as key_field, * FROM src_data
--     EXCEPT DISTINCT
--     SELECT 'SRC_ONLY' as diff_type, account_number as key_field, * FROM trg_data
--   )
--   UNION ALL
--   -- Records only in target
--   (
--     SELECT 'TRG_ONLY' as diff_type, account_number as key_field, * FROM trg_data
--     EXCEPT DISTINCT
--     SELECT 'TRG_ONLY' as diff_type, account_number as key_field, * FROM src_data
--   )
-- )
-- SELECT * FROM comparison_result ORDER BY key_field LIMIT 1000;
-- 8) TARGET_ONLY: Đoạn code này dùng dể tìm ra các bản ghi nguồn lệch so với đích
-- Returns rows from the 1st query that do not appear in the 2nd query, removing duplicates.
    -- select * from trg_data
    -- except distinct
    -- select * from src_data
-- 9) SOURCE_ONLY: Đoạn code này dùng dể tìm ra các bản ghi đích lệch so với nguồn
    -- select * from src_data
    -- except distinct
    -- select * from trg_data
