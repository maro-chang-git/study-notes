
-- ============================================
-- This script is the guideline to COMPARES source tables with target tables post-ETL
-- It includes steps for filtering, flattening, normalizing, and field-level comparison
-- Author: Charis Dang (Dang Quynh Trang)
-- Date: 2025-12-10
-- Get latest records from SOURCE TABLES based on conditions (date window, status)
-- ============================================
WITH
-- 1) Get latest records from source tables
src1_raw AS (
    SELECT *
    FROM source_db.table1 s1
    QUALIFY ROW_NUMBER() OVER (PARTITION BY s1.business_key ORDER BY s1.updated_at DESC) = 1
    -- For BigQuery: use QUALIFY; for PostgreSQL: use subquery with ROW_NUMBER filter
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
),
-- ============================================
-- Compare SOURCE & TARGET
-- ============================================
-- 6) TARGET_ONLY: 
-- Returns rows from the 1st query that do not appear in the 2nd query, removing duplicates.
    select * from trg_data
    except distinct
    select * from src_data
-- 7) SOURCE_ONLY: 
    -- select * from src_data
    -- except distinct
    -- select * from trg_data
-- 8) Field-level comparison for specific business_key to identify differing columns
   select 'TARGET' as TB, * from trg_data where cif = '10089003' and token_id = '90068'
   union all
   select 'SOURCE' as TB, * from src_data where cif = '10089003' and token_id = '90068'