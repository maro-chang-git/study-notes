https://docs.cloud.google.com/bigquery/docs/reference/standard-sql/data-types

This is **RECORD / STRUCT data type in Bigquery**. Used when a field has multiple values (objects). 

```sql
currency            --Struct array Type: Value – Multi – Sub Multi 
        _VALUE      --Value of multi and sub multi
        _m          --multi
        _s          --sub multi     
```
**NOTE**: `if value = NULL` (`default value = 1`)  
		if value.length is too long THEN:
        - add new record row with _m = 2  
		- `join` OR `concat` to extract full data.  
		
--> **Check Unnest**

```json
"data": [
    {
      "feeCode": "FEE001",      //recid
      "feeFullName": "Monthly Maintenance Fee",
      "feeShortName": "Maint Fee",
      "accountCategory": "Savings",
      "currency": [             // _value
        "VND",                  //_m 1 = NULL, 
        "USD"
      ]
    }
  ]
```

**Example:**
```sql
select * from 
(SELECT 
    recid,
    currency 
FROM `ncb-dp-uat-ency.ncb_dp_dev_landing.FT_COMMISSION_TYPE` 
qualify row_number() over (partition by recid order by op_ts desc, current_ts  desc) = 1 
)
where recid = 'TTQT02005'
```

**Result:**
```json
[{
  "recid": "TTQT02005",
  "currency": [{
    "_VALUE": "USD",
    "_m": null,
    "_s": null
  }, {
    "_VALUE": "EUR",
    "_m": "2",
    "_s": null
  }]
}]
```



