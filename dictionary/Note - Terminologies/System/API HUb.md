[Tổng hợp thông tin các API - Digital Transformation Project - Confluence](https://confluence.ncb-bank.vn/pages/viewpage.action?pageId=6860334)

### 🔹 **API HUB within DTP**

- A centralized platform or framework for managing **APIs (Application Programming Interfaces)** across different systems and services.
- It likely includes:
    - **Diagnostic tools** for API performance and health.
    - **Scope definition** for API integration.
    - **Vendor selection** for third-party API providers.
    - **Go-live documentation** for launching API-related features.

### 🔗 **SuperApp & API HUB Integration**

- The **API HUB** is built on **Apigee**, a Google-managed API management platform.
    
- It acts as a **central gateway** for managing and routing API calls between various systems, including:
    
    - **Mobile Banking (IBMB)**
    - **Core Banking (T24)**
    - **Digital Wealth**
    - **eKYC**
    - **Notification services**
    - **Payment gateways (VNPAY, Payoo, Napas, etc.)**
    - **AML (Anti-Money Laundering)**
    - **iCredit**
    - **CMS, CRM, and other internal services**
- The **SuperApp** interacts with these services via the API HUB, which:
    
    - Ensures **secure, scalable, and monitored API traffic**
    - Uses **Cloud NAT, VPN Gateway, and VPC Peering** for connectivity
    - Supports both **internal and external API calls** through **Apigee Runtime environments** (Dev, UAT, Prod)

---

### 🧩 Example Connections

- **IBMB services** connect to the API HUB to access customer data and banking functions.
- **Datapower** and **ESB** (Enterprise Service Bus) route requests from the SuperApp to backend services via the API HUB.
- **Notification services** (email, SMS, push) are triggered through APIs managed in the HUB.

---

### ✅ Summary

Yes, the **SuperApp is integrated with the API HUB**, and this hub serves as the **main API gateway** for all digital banking services under the DTP (Digital Transformation Project).