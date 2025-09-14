### @set variables
```sql
@set cid = 1234
@set status = 'active'

SELECT * FROM table_name tn WHERE tn.cid = ${cid} AND tn.status = ${status};  
```

### Create ERD diagram
File -> Name -> Select Tables want to see the ER relation diagram. 
The Diagram will be save under project. 

### Use value panel to see the foreign key's value


### AI Assistant 
SQL Editor -> AI Assistant -> Add API Token

Get token: https://platform.openai.com/docs/pricing (Not free)

### Visual Query Builder (in DBeaver Pro)
Build a query by UI, no written SQL needed

### Automation with Tasks 
- Export / Import data
- SQL script
- Compare data
Very limited type of tasks in community version
