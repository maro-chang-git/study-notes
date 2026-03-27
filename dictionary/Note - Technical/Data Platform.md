The **Data Platform in NCB uses five main layers**. Here’s a clear explanation of each:

✅ These layers form a **pipeline**:  
**Landing → Staging → Ontology → Data Mart → Serving**, ensuring data flows from raw ingestion to actionable insights.
### **1. Landing Layer**

- **Role:** Entry point for all raw data.
- **Details:**
    - Collects data from multiple sources: Core Banking (T24), CMS, Internet/Mobile Banking, external hubs (CIC, PCB, Telco).
    - Stores data in its original format for auditing and replay.
- **Purpose:** Ensure all incoming data is captured without loss.

---

### **2. Staging Layer**

- **Role:** Prepares raw data for processing.
- **Details:**
    - Performs cleaning, validation, and basic transformations.
    - Aligns schemas and handles duplicates.
- **Purpose:** Make data consistent and ready for semantic modeling.

---

### **3. Ontology Layer**

- **Role:** Adds semantic meaning and business logic.
- **Details:**
    - Organizes data into business entities (Customer, Account, Transaction).
    - Implements relationships and hierarchies for interoperability.
- **Purpose:** Enable unified understanding across systems and AI/ML models.

---

### **4. Data Mart Layer**

- **Role:** Provides curated, domain-specific datasets.
- **Details:**
    - Optimized for analytics and BI tools (e.g., PowerBI).
    - Includes aggregated views like **Customer 360 (C360)**.
- **Purpose:** Support reporting and advanced analytics.

---

### **5. Serving Layer**

- **Role:** Delivers data to applications and users.
- **Details:**
    - Exposes APIs (REST, GraphQL) for real-time and batch access.
    - Powers dashboards, ML models, and external services.
- **Purpose:** Enable fast, secure, and reliable data consumption.

---

