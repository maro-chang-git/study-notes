T24 (Temenos Transact) is built around **modular components**, each responsible for a specific banking function. Below is a clear, structured list of the **core modules** commonly used in T24, along with what each module does.

# 📌 Summary Table

| Module    | Meaning                   | Function              |
| --------- | ------------------------- | --------------------- |
| **AA**    | Arrangement Architecture  | Product engine        |
| **AC**    | Accounts                  | Account management    |
| **FT**    | Funds Transfer            | Transfers & payments  |
| **TT**    | Treasury                  | FX, MM, derivatives   |
| **LD**    | Loans & Deposits          | Lending operations    |
| **MM**    | Money Market              | Interbank loans       |
| **ST**    | Securities                | Investments, trading  |
| **LC**    | Letters of Credit         | Trade finance         |
| **PM**    | Payments                  | Payment orchestration |
| **CB**    | Customer Base             | Customer data         |
| **IB/OB** | Internet/Office Banking   | Digital banking       |
| **SMS**   | Service Management System | Batch processing      |
| **OFS**   | Open Financial Services   | APIs & integration    |

# 🌐 **Core Modules in T24**

## **1. AA – Arrangement Architecture**

The product engine of T24.  
Used to define and manage banking products such as loans, deposits, mortgages, term deposits, etc.

***

## **2. AC – Accounts**

Handles customer account records, balances, account categories, dormancy, and account maintenance.

***

## **3. FT – Funds Transfer**

Manages all types of transfer transactions:

*   Internal transfers
*   Interbank transfers
*   Standing orders
*   Fees related to transfers

***

## **4. TT – Treasury**

Treasury & money-market operations:

*   FX deals (foreign exchange)
*   Money market loans/borrowings
*   Derivative products
*   FX revaluation

***

## **5. LD – Loans & Deposits**

Manages:

*   Loan disbursement
*   Repayment schedules
*   Accruals of interest
*   Deposits and term deposits (if not migrated to AA)

***

## **6. ST – Securities**

Supports wealth management & asset trading:

*   Bonds, funds, equities
*   Trading, settlement, custody

***

## **7. MM – Money Market**

Separate module for interbank lending/borrowing transactions.

***

## **8. FX – Foreign Exchange**

Handles spot, forward, swap transactions in FX markets.

***

## **9. AA-Loan / AA-Deposit (Submodules of AA)**

Specialized product definitions for loans or deposits inside the AA framework.

***

## **10. LC – Letters of Credit**

Trade finance module for issuing & managing:

*   Letters of credit
*   Guarantees
*   Import/export documentation

***

## **11. PM – Payments**

Payment orchestration engine:

*   Domestic payments
*   International (SWIFT) payments
*   SEPA/ACH depending on region

***

## **12. IB / OB – Internet / Office Banking**

Supports:

*   Online banking
*   Mobile banking
*   Corporate banking portals

***

## **13. CB – Customer Base**

Customer information file (CIF):

*   KYC data
*   Customer onboarding
*   Customer segmentation

***

## **14. SMS – Service Management System**

Scheduler / batch engine of T24:

*   End-of-day (EOD)
*   Start-of-day (SOD)
*   COB (Close of Business)
*   Batch jobs

***

## **15. ENQUIRY / VERSION / STANDARD.SELECTION**

Configuration modules:

*   Reporting queries
*   Data extraction
*   Input screens
*   Application versions

***

## **16. OFS – Open Financial Services**

T24 integration module:

*   API gateway
*   OFS messages
*   Real-time / batch interfaces

***


