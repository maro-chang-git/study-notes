# T24 Modules

- Customer - Khách hàng
- AC / Account - Tài khoản
- FT / Funds Transfer - Thanh toán
- TT / Treasury - Nguồn vốn
- AAAA / AA?
- LD / Loans & Deposits

### FT – Funds Transfer
Phân hệ chuyển tiền, xử lý các giao dịch chuyển khoản nội bộ và liên ngân hàng.

Gồm các giao dịch chuyển khoản, debit/credit tài khoản.
Trong trang của bạn còn có ví dụ: FT type ACNP, BCEB…


### TT – Treasury / Foreign Exchange
Phân hệ ngoại hối và kinh doanh vốn.

Quản lý giao dịch FX, giao dịch tiền tệ liên ngân hàng.
Dùng cho các nghiệp vụ dealing room.


### AC – Account
Phân hệ tài khoản.

Lưu thông tin tài khoản khách hàng.
Dùng để truy xuất số dư, trạng thái, loại tài khoản…


### AAAA – (Thường là phân hệ “Standing Order” hoặc “Arrangement Architecture”)
Trong T24, mã AAAA thường dùng cho các giao dịch cấu trúc hoặc điều khiển hệ thống (như các bản ghi chuẩn hóa).
Trong nhiều triển khai, AAAA biểu thị Arrangement Architecture (AA) – nền tảng tạo sản phẩm (loans, deposits, etc.).
→ Trong ngữ cảnh trang bạn gửi, AAAA là một loại phân hệ để tra cứu thông tin giao dịch liên quan (chính xác phụ thuộc cấu hình của ngân hàng bạn).

### LD – Loans & Deposits
Phân hệ tín dụng và tiền gửi.

Xử lý khoản vay, lịch trả nợ, dư nợ.
Dùng cho mortgage, personal loan, hạn mức…

--------------------------------------------

###  **1. Trường SYSTEM.ID**

Đây là **trường quan trọng nhất** để nhận biết giao dịch xuất phát từ phân hệ nào.

Trong trang bạn gửi, đã có rule ví dụ:

    Nếu objStmt/SYSTEM.ID = 'IC2' → gán typeId = 'IC2'
    Nếu objStmt/SYSTEM.ID = 'DC' → lấy narrative từ DATA.CAPTURE

Ý nghĩa phổ biến:

| SYSTEM.ID     | Phân hệ                  | Ví dụ                       |
| ------------- | ------------------------ | --------------------------- |
| **FT**        | Funds Transfer           | Chuyển khoản trong/ngoài    |
| **TT**        | Treasury                 | FX deal                     |
| **AC**        | Account                  | Ghi sổ tài khoản            |
| **LD**        | Loans & Deposits         | Giao dịch trả nợ, giải ngân |
| **AA / AAAA** | Arrangement Architecture | Giao dịch sản phẩm AA       |

➡️ **Nếu SYSTEM.ID = FT thì thuộc phân hệ FT.**  
➡️ **Nếu SYSTEM.ID = LD thì thuộc phân hệ LD.**

***

### ✅ **2. Trường TRANSACTION.CODE**

Mã giao dịch cũng cho biết thuộc phân hệ nào vì mỗi phân hệ có nhóm mã riêng.

Ví dụ:

| TRANSACTION.CODE | Ý nghĩa             | Phân hệ |
| ---------------- | ------------------- | ------- |
| 301, 302, 381…   | Chuyển khoản, phí   | FT      |
| 1001–1999        | Giao dịch tài khoản | AC      |
| 7000+            | FX, Money Market    | TT      |
| 2000–2999        | Thu gốc, thu lãi    | LD      |

Trong trang của bạn cũng có rule:

    Nếu độ dài value = 8 và TRANSACTION.CODE = 381 → typeId = 'PAY'

→ 381 là một mã thuộc phân hệ **FT**.

***

### ✅ **3. Trường TABLE.SOURCE hoặc RECORD.TYPE** (nếu có)

Trong một số bản ghi T24, trường này chỉ rõ nguồn dữ liệu:

| TABLE.SOURCE | Phân hệ |
| ------------ | ------- |
| FTTXN        | FT      |
| ICTT         | TT      |
| ACCT         | AC      |
| LNTXN        | LD      |

***

### ✅ **4. Nhận diện qua format của TRANS.REFERENCE**

Một số phân hệ có quy tắc reference riêng.

Ví dụ trong trang bạn đọc:

    String split objStmt/TRANS.REFERENCE bằng ‘ - ‘ và lấy item thứ 2.

FT thường có reference dạng:

    FT123456 - 20250201 - PAYMENT

AA/AAAA thường có cấu trúc theo arrangement ID:

    LOAN-ARR-000123456

***

### ✅ **5. Nhận diện bằng CATEGORY của ACCOUNT (ít dùng để phân hệ giao dịch)**

Trang bạn gửi có rule:

    CATEGORY BETWEEN 1001 AND 1099 OR CATEGORY = 1301

→ Đây là rule lọc loại tài khoản, **không phải** phân hệ giao dịch.

***

### 📌 **Tóm tắt – muốn biết giao dịch thuộc FT, TT, AC, AAAA, LD thì dựa vào:**

| Mức độ quan trọng | Trường               | Dùng để làm gì                  |
| ----------------- | -------------------- | ------------------------------- |
| ⭐⭐⭐⭐⭐             | **SYSTEM.ID**        | Xác định phân hệ chính xác nhất |
| ⭐⭐⭐⭐              | **TRANSACTION.CODE** | Nhận diện phân hệ qua nhóm mã   |
| ⭐⭐⭐               | **TRANS.REFERENCE**  | Suy đoán phân hệ qua cấu trúc   |
| ⭐⭐                | TABLE.SOURCE         | Nguồn bảng                      |
| ⭐                 | CATEGORY             | Chỉ lọc loại tài khoản          |

