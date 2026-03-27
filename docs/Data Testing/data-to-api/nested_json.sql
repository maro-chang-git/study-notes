select * from alloydb.dto_adjustment.adj_dto_crm_sales;
SELECT * FROM alloydb.streaming.t24_company;

-- ================================================
-- TEST CASE: /superapp/api/v1/get-sale-code-info
-- STREAM   : NRT
-- PLATFORM : AlloyDB
-- SERVICE  : SuperApp - CRM
-- SOURCE   : alloydb.dto_adjustment.adj_dto_crm_sales
--			  alloydb.streaming.t24_company
-- BUSINESS KEY: so_cif
-- RULE REF	: https://confluence.ncb-bank.vn/display/DTP/4.+Cards
-- DATE     : 2026-03-20
-- ================================================
WITH
-- 1) Tham số request (điền theo sample)
--params AS (
--    SELECT
--        CAST('LD2521330078' AS VARCHAR)                         AS account_number,
--        CAST(1 AS INTEGER)                                      AS page,
--        CAST(5 AS INTEGER)                                      AS page_size
--),
src_crm_sales_raw AS (
	SELECT 
		TYPE, 
		trang_thai,
		email_ncb,
		gioi_tinh,
		dao,
		phong_ho_phong_giao_dich_kpp,
		ho_va_ten,
		so_cif,
		t24_company_code,
		shipping_dao_code,
		shipping_branch_code,
		tt_ho_chi_nhanh
	FROM alloydb.dto_adjustment.adj_dto_crm_sales s
),
src_company_raw AS (
  SELECT
    recid,
    company_name,
    name_address
  FROM alloydb.streaming.t24_company
),
src_company_normalized AS (
  SELECT
    recid,
    company_name,
    name_address,
    -- Lấy giá trị cuối cùng sau !@
     element_at(
        split(company_name, '!@'),
        cardinality(split(company_name, '!@'))
     ) AS company_last_part,
     -- Lấy giá trị cuối cùng sau !@
     element_at(
        split(name_address, '!@'),
        cardinality(split(name_address, '!@'))
     ) AS name_address_last_part
    FROM src_company_raw
), 
src_company AS (
	SELECT 
		recid,
		-- 
		trim(
	      CASE
	        -- Có dấu '-' và có phần sau '-'
	        WHEN split_part(company_last_part, '-', 2) <> '' THEN
	          split_part(company_last_part, '-', 2)
	        -- Không có phần sau '-'
	        ELSE company_last_part
	      END
	    ) AS company_name_extract,
		name_address_last_part
    FROM src_company_normalized
),
src_normalized AS (
	SELECT 
		email_ncb							AS email,
		dao									AS daoCode,
		ho_va_ten							AS fullName,
		so_cif								AS saleCode,
		t24_company_code					AS companyCode,
		TYPE,
		gioi_tinh							AS gender,
		trang_thai							AS status,
		shipping_dao_code					AS shippingDaoCode,
		shipping_branch_code				AS shippingCompanyCode,
		phong_ho_phong_giao_dich_kpp		AS daoName,
		phong_ho_phong_giao_dich_kpp		AS branchName,
		c.company_name_extract				AS branch_name,
		c.name_address_last_part			AS branchAddress,
		c.company_name_extract				AS shippingBranchName,
		c.name_address_last_part			AS shippingBranchAddress
	FROM src_crm_sales_raw s
	JOIN src_company c ON s.shipping_branch_code = c.recid
),
-- 8) Create MAP<varchar, varchar> 
data_maps AS (
	SELECT 
		MAP(
            ARRAY[
                    'email',
                    'daoCode',
                    'fullName',
                    'saleCode',
                    'companyCode',
                    'type',
                    'gender',
                    'status',
                    'shippingDaoCode',
                    'shippingCompanyCode',
					'branchName',
					'branchAddress',
                    'shippingBranchName',
					'shippingBranchAddress'
                    ],
             ARRAY[
                CAST(email AS varchar),
                CAST(daoCode AS varchar),
                CAST(fullName AS varchar),
                CAST(saleCode AS varchar),
                CAST(companyCode AS varchar),
                CAST(type AS varchar),
                CAST(gender AS varchar),
                CAST(status AS varchar),
                CAST(shippingDaoCode AS varchar),
                CAST(shippingCompanyCode AS varchar),
				CAST(branchName AS varchar),
                CAST(branchAddress AS varchar),
                CAST(shippingBranchName AS varchar),
                CAST(shippingBranchAddress AS varchar) 
                    ]
                ) AS m
    FROM src_normalized
),
-- 9) data JSON (mảng các object)
data_json AS (
    SELECT 
		CAST(m AS json) AS data
    FROM data_maps
),
-- 11) Response JSON (Build VARCHAR bằng format + json_format)
api_json AS (
    SELECT
        format(
            '{"code":"%s","message":"%s","messageKey":"%s","data":%s}',
            '',
            'Successful',
            '',
            json_format(dj.data)
            --json_format(pj.pagination)
        )                                                       AS api_response
    FROM data_json dj
    --CROSS JOIN pagination_json pj
)
-- ================== Lựa chọn OUTPUT ==================
-- A) Output bảng (test):
SELECT * FROM src_normalized;
-- SELECT * FROM page_info;
-- B) Output JSON 1 dòng (VARCHAR):
--SELECT api_response
--FROM api_json;
