## 🧠 **What Is Trino?**

**Trino** is an **open-source distributed SQL query engine** designed for **fast, interactive analytics** on large datasets. It was originally developed at Facebook as **PrestoSQL**, and later rebranded as Trino.

### 🔹 Key Features:

- **Federated Queries**: Query multiple data sources (e.g., MySQL, PostgreSQL, S3, Hive, Kafka) in a single SQL statement.
- **Massively Parallel Processing (MPP)**: Executes queries across a cluster of nodes for high performance.
- **ANSI SQL Support**: Compatible with standard SQL, making it easy to integrate with BI tools like Tableau, Power BI, and Superset.
- **Connector-Based Architecture**: Connects to relational databases, NoSQL stores, data lakes, and cloud storage.
- **No Data Movement Required**: Queries data in-place without needing ETL or duplication. [[trino.io]](https://trino.io/), [[en.wikipedia.org]](https://en.wikipedia.org/wiki/Trino_%28SQL_query_engine%29), [[celerdata.com]](https://celerdata.com/glossary/understanding-trino-and-presto)

---

## 🚀 **Why DTP Uses Trino**

In the context of the **Digital Transformation Project (DTP)**, Trino is used as a **central query engine** for the **Data Platform (DP)**. Here's why:

### ✅ **Reasons for Adoption**

1. **Unified Access to Diverse Data Sources**  
    DTP integrates data from core banking (T24), customer systems, APIs, and external services. Trino allows querying all of these without moving the data.
    
2. **Real-Time Analytics for SuperApp**  
    Trino powers dashboards, reports, and decision engines that support features like AIP mortgage workflows, unsecured loans, and SpendSave Plus.
    
3. **Scalability for Big Data**  
    DTP handles large volumes of transactional and behavioral data. Trino’s distributed architecture ensures fast performance even at scale.
    
4. **Cost Efficiency**  
    Avoids the need for expensive data warehousing solutions by querying data directly from existing systems.
    
5. **Developer & Analyst Friendly**  
    Analysts can use familiar SQL to explore data, build models, and generate insights without needing specialized tools.
    