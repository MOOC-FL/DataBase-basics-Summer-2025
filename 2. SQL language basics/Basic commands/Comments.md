#### Comments 
- The entry --starts a comment that ends at the end of the line:
```sql
CREATE TABLE Products (
  id INTEGER PRIMARY KEY,
  name TEXT,
  price INTEGER -- price in euros
)
```
- Another way is to start a comment /*and end with */:
```sql
CREATE TABLE Products (
  id INTEGER PRIMARY KEY,
  name TEXT,
  price INTEGER /* price in euros */
)
```
