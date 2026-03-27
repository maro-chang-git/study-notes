
- **IBMB** stands for **Internet Banking & Mobile Banking**.
- It refers to the customer's **digital banking account status**.
- The system checks whether the customer has an **active IBMB account** linked to their CIF.

-> Check is the customer ETB (already has CIF and active) or NTB?

**Possible IBMB statuses:**
- `ACTIVE`
- `CLOSE`
- `CLOSED`
- `LOCK`
- `KLOSE`

**Purpose in the flow:**

- After verifying the LegalID and CIF, the system checks the **IBMB status** to determine if the customer can proceed with digital services or needs onboarding.