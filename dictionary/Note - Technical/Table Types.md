### 3 ways to define table type

These terms refer to different data modeling and table design strategies often used in data warehousing, analytics, and ETL/ELT processes. 


1. **Incremental Table**/ transactional
2. **Daily snapshot Table**: 
    For daily batch job tracking, daily snapshot table type. 
    C360 -> where system_date = system_date
    
3. **SCD2 (Slowly Changing Dimention Type 2)**: 
    Instead of updating or overwriting existing record. 
    -> Try to preserve historical data

    - Change status of old record -> inactive / disable

    - Use time range:
    Customer_ID | Name | Address     | Start_Date | End_Date
    123         | John | NY          | 2020-01-01 | 2021-06-30
    123         | John | LA          | 2021-07-01 | NULL

4. **UUID (Universally Unique Identifier)** 
    Instead of sequential ID (incremental ID) -> Use 128-bit ID 