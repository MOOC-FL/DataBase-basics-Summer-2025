#### Deleting information
- The command DELETEremoves rows from the table that match the given condition. For example, the following command removes product 5 from the table:
```sql
DELETE FROM Products WHERE id = 5;
```
- As with changing, if there is no condition, the command affects all rows. So the following command removes all products from the table:
```sql
DELETE FROM Products;
```
The command `DROP TABLE` deletes a database table (and all its contents). For example, the following command deletes a table Products:
```sql
DROP TABLE;
```


