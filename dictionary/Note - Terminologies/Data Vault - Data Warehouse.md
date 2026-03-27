### Data Vault Architecture

![Data Vault](/NCB/0.%20images/Pasted%20image%2020251120142102.png)

CDC: Change Data Capture

- Data from source systems such as transactional, supply chain, and CRM applications is either batch loaded or streamed real-time using CDC.
- It’s important for your data integration system to have robust catalog, search, and data governance capabilities to support this entire process.
- This semi-structured data is placed in a landing zone such as a [data lake](https://www.qlik.com/us/data-lake).
- It is then extracted, transformed, and loaded (ETL) as Inmon’s relational 3rd normal form data into a staging zone (or “Raw Data Vault”) repository such as a [data warehouse](https://www.qlik.com/us/data-warehouse).
- ETL is performed again to bring denormalized data into the Data Vault model.
- ETL processes are performed on an as-needed basis to load this data into star schema formatted (dimensional model) [data marts](https://www.qlik.com/us/data-warehouse/data-mart).
- Data consumers can then access relevant, structured data for use cases such as analytics, visualizations, data science, and APIs to trigger alerts and actions in other systems.

👀️ H
