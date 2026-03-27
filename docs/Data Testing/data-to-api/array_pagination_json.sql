-- ================================================
-- TEST CASE: /scf/api/v1/get-interest-loan
-- STREAM   : API
-- PLATFORM : Trino
-- MODE     : 3 - SOURCE_ONLY
-- SOURCE   : alloydb.dto_scf.scf_loan_accrued_interest
-- BUSINESS KEY: account_number
-- RULE REF: US03.46.+SCF+-+Get+Interest+Loan.doc
-- ================================================
WITH
-- 1) Tham số request (điền theo sample)
params AS (
    SELECT
        CAST('LD2521330078' AS VARCHAR)                         AS account_number,
        CAST(1 AS INTEGER)                                      AS page,
        CAST(5 AS INTEGER)                                      AS page_size
),
-- 2) Dữ liệu nguồn (điều chỉnh tên cột cho đúng thực tế)
source_raw AS (
    SELECT
        s.account_number,        -- VARCHAR
        s.principal_amount,      -- NUMBER
        s.date_from,             -- DATE/TIMESTAMP
        s.date_to,               -- DATE/TIMESTAMP
        s.days,                  -- NUMBER
        s.rate,                  -- NUMBER
        s.interest_amount,       -- NUMBER
        s.system_date            -- DATE/TIMESTAMP
    FROM alloydb.dto_scf.scf_loan_accrued_interest s
    JOIN params p ON s.account_number = p.account_number
),
-- 3) Chuẩn hoá (format ngày thành yyyy-MM-dd; các số để nguyên, sẽ CAST sang VARCHAR ở bước JSON)
normalized AS (
    SELECT
        s.account_number,
        s.principal_amount,
        DATE_FORMAT(CAST(s.date_from   AS DATE), '%Y-%m-%d')    AS date_from,
        DATE_FORMAT(CAST(s.date_to     AS DATE), '%Y-%m-%d')    AS date_to,
        s.days,
        s.rate,
        s.interest_amount,
        DATE_FORMAT(CAST(s.system_date AS DATE), '%Y-%m-%d')    AS system_date
    FROM source_raw s
),
-- 4) Đánh số thứ tự & phân trang
numbered AS (
    SELECT
        n.*,
        ROW_NUMBER() OVER (
            ORDER BY CAST(n.date_from AS DATE),
                     CAST(n.date_to   AS DATE),
                     n.account_number
        )                                                       AS rn
    FROM normalized n
),
-- 5) Thông tin đếm (tổng số dòng của tập hiện tại)
counts AS (
    SELECT COUNT(*)                                             AS total_count
    FROM numbered
),
-- 6) page_info: tổng trang, v.v.
page_info AS (
    SELECT
        p.page,
        p.page_size,
        c.total_count,
        CAST(CEIL(c.total_count * 1.0 / p.page_size) 
            AS INTEGER)                                         AS total_pages
    FROM counts c
    CROSS JOIN params p
),
-- 7) Lấy trang hiện tại
paged AS (
    SELECT
        n.account_number,
        n.principal_amount,
        n.date_from,
        n.date_to,
        n.days,
        n.rate,
        n.interest_amount,
        n.system_date
    FROM numbered n
    CROSS JOIN params p
    WHERE n.rn BETWEEN ((p.page - 1) * p.page_size + 1) AND (p.page * p.page_size)
),
-- 8) Tạo mảng MAP<varchar, varchar> cho data
data_maps AS (
    SELECT
        MAP(
            ARRAY['account_number','principal_amount','date_from','date_to','days','rate','interest_amount','system_date'],
            ARRAY[
                COALESCE(account_number, ''),
                COALESCE(CAST(principal_amount  AS VARCHAR), ''),
                COALESCE(date_from, ''),
                COALESCE(date_to, ''),
                COALESCE(CAST(days              AS VARCHAR), ''),
                COALESCE(CAST(rate              AS VARCHAR), ''),
                COALESCE(CAST(interest_amount   AS VARCHAR), ''),
                COALESCE(system_date, '')
            ]
        )                                                       AS m
    FROM paged
),
-- 9) data JSON (mảng các object)
data_json AS (
    SELECT
        CAST(COALESCE(array_agg(m), 
            ARRAY[MAP(ARRAY[], ARRAY[])]) AS JSON)              AS data
    FROM data_maps
),
-- 10) pagination JSON (tất cả dưới dạng string theo sample)
pagination_json AS (
    SELECT CAST(
        MAP(
            ARRAY['page','page_size','total_count','total_pages','has_next','has_previous'],
            ARRAY[
                CAST(pi.page         AS VARCHAR),
                CAST(pi.page_size    AS VARCHAR),
                CAST(pi.total_count  AS VARCHAR),
                CAST(pi.total_pages  AS VARCHAR),
                CASE WHEN pi.page < pi.total_pages  THEN 'true' ELSE 'false' END,
                CASE WHEN pi.page > 1               THEN 'true' ELSE 'false' END
            ]
        )                                                       AS JSON
    )                                                           AS pagination
    FROM page_info pi
),
-- 11) Response JSON (xây VARCHAR bằng format + json_format)
api_json AS (
    SELECT
        format(
            '{"status":"%s","code":"%s","message":"%s","messageKey":"%s","data":%s,"pagination":%s}',
            '200',
            'DT.005.0.200',
            'success',
            '',
            json_format(dj.data),
            json_format(pj.pagination)
        )                                                       AS api_response
    FROM data_json dj
    CROSS JOIN pagination_json pj
)
-- ================== Lựa chọn OUTPUT ==================
-- A) Output bảng (test):
-- SELECT * FROM paged;
-- SELECT * FROM page_info;
-- B) Output JSON 1 dòng (VARCHAR):
SELECT api_response
FROM api_json;
