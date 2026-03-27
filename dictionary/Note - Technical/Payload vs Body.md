### **Difference Between Payload and Body**

- **Body**: The entire content of the HTTP request or response after the headers. It can include the payload plus other structural elements.
  
- **Payload**: The actual data you want to transmit — the meaningful content inside the body.  -> **Could be in body or header**


Example:
```js
POST /api/user HTTP/1.1  
Host: example.com  
Content-Type: application/json  

{  
"name": "Trang",  
"email": "trang@example.com"  
}  
```

- **Body**: `{ "name": "Trang", "email": "trang@example.com" }`
- **Payload**: Same as body in this case, because the body only contains the data.

But if you had multipart data (e.g., file + metadata), the body would include boundaries and encoding info, while the payload is just the file content and JSON data.