Typical Flow in software development (specially in Banks):

***Dev -> Local -> SIT -> QA(optional) -> UAT -> Staging / Pre-Prod -> Prod***

1. _Dev/Local_ : Developers test code individually.
2. _SIT_ : Teams test integrations, ensure modules interact correctly.
3. QA (optional in some companies) : Broader regression/functional testing.
4. _UAT_ : Business validation, sign-off before deployment.
5. _Staging/Pre-Prod_ : Final rehearsal (sometimes merged with UAT).
6. _Prod_ : Live environment.

- In **enterprise setups (banks, telcos, gov)** → ***SIT***  and ***UAT*** are always present and critical. QA may be embedded inside SIT.
  SIT & UAT are mandatory because:
	- Multiple legacy + modern systems need to sync (***SIT***).
	- Regulatory/compliance requires business stakeholders to approve before go-live (***UAT***)
  
- In **product/Agile companies (startups, SaaS)** → You may hear more about _Dev, QA, Staging, Prod_, with SIT being implicit.

##### 1. Local
Where developers ***code & run unit tests*** (by dev). Use mock services or ***lightweight containers (Dockers)***. Has limited access to real banking data due to compliance. 

##### 2. Dev environment
Shared environment for developers to deploy new builds. May include early CI/CD pipelines.
-> To catch early bugs, verify modules compile & run

##### 3. SIT (System Integration Testing)
Critical in banks. *Tests integration between multiple systems:*
- Core Banking ↔ Payment Gateway ↔ SWIFT ↔ AML (Anti–Money Laundering) systems.

Run by QA engineers, sometimes with dev support. ***Uses test data or masked data.*** 
Verifies API, message formats

##### 4. QA / Functional Testing
Sometimes merged into SIT in banks. ***Dedicated for functional, regression, automation, and non-functional testing.*** Ensures features work according to specs. 
Often includes ***automation suites*** that run nightly. 

##### 5. UAT (User acceptance Testing)
*Mirrors production closely (same config, integrations)*. Business users (operations staff, product managers, compliance officers) test workflow:
- Opening an account, transferring funds, generating statements. 

This is a *sign-off environment*. Often involves masked real data for testing. 

##### 6. Stagging / Pre-pod
*Mirrors prod 1:1* (infrastructure, network, firewalls). Use for ***performance/load testing*** & final deployment validation. 
Also serves as *DR (Disaster Recovery)* failover simulation. 

##### 7. PROD (Production)
Live banking system with real customers. Highly secure, regulated, audited. 24/7 monitoring with strict SLAs.
Deployment strategies: blue/green, canary (?), or maintenance windows. 

| Environment | Purpose                         | Who Uses It                         | Data Used             |
| ----------- | ------------------------------- | ----------------------------------- | --------------------- |
| DEV         | Developer testing               | Developers                          | Mock/Test data        |
| SIT         | Integration between systems     | ***QA*** + Dev teams                | Synthetic/masked data |
| QA          | Functional & regression testing | ***QA*** team                       | Synthetic/masked data |
| UAT         | Business validation & sign-off  | Business users, BAs, product owners | Masked prod-like data |
| Pre-Prod    | Performance + final rehearsal   | Release teams, ***QA***, Ops        | Near-prod setup       |
| PROD        | Live system                     | Customers, Ops                      | Real customer data    |
