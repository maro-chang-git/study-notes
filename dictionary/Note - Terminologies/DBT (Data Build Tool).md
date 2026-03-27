**DBT is the T in ELT.** It doesn't extract or load data, but it's extremely good at transforming data that's already loaded into your warehouse. This "transform after load" architecture is becoming known as [ELT](https://docs.getdbt.com/terms/elt "ELT") (extract, load, transform).

Read 15mins:
[dbt Developer Hub](https://docs.getdbt.com/)

### Install
[Install with pip | dbt Developer Hub](https://docs.getdbt.com/docs/core/pip-install)


DBT is a **command-line tool and development framework** that enables data teams to:

- Write **modular SQL code**
- Apply **software engineering best practices** (like version control, testing, and documentation)
- Build **data models** that transform raw data into structured formats

It focuses exclusively on the **“T” in ELT** (Extract, Load, Transform), meaning it assumes data is already loaded into the warehouse and handles the transformation part efficiently. [[getdbt.com]](https://www.getdbt.com/blog/what-exactly-is-dbt), [[analytics8.com]](https://www.analytics8.com/blog/dbt-overview-what-is-dbt-and-what-can-it-do-for-my-data-pipeline/), [[analyticse...eering.com]](https://analyticsengineering.com/resource/what-is-dbt-data-build-tool-a-simple-explanation/)

---

## 🔧 **Key Features of DBT**

- **SQL-Based Modeling**: Write transformations using SQL SELECT statements.
- **Version Control**: Integrate with Git for tracking changes.
- **Testing**: Automatically test data quality and logic.
- **Documentation**: Auto-generate data lineage and model documentation.
- **Modularity**: Reuse code across models using `ref()` and macros.
- **Scheduler Integration**: Works with Airflow, Dagster, dbt Cloud, etc.

---

## 🚀 **Why DTP Uses DBT**

In the **Digital Transformation Project (DTP)**, DBT is likely used to:

1. **Standardize Data Transformation**  
    Ensure consistent logic across teams and projects.
    
2. **Enable Analytics Engineering**  
    Empower data analysts to build production-grade pipelines without needing full data engineering support.
    
3. **Improve Data Quality**  
    Built-in testing and documentation reduce errors and improve trust in data.
    
4. **Speed Up Development**  
    Modular SQL and version control make it faster to iterate and deploy changes.
    
5. **Integrate with Trino & Data Lake**  
    DBT can work with Trino and other query engines to transform data across distributed sources.