#### Handling empty data
- The behavior of aggregate functions can be surprising if the data you are processing does not contain any rows. For example, consider the following empty table:
> The function `COUNT` returns the number of rows as 0:
```sql
SELECT COUNT(price) FROM Products;
```
> Instead, the function `SUM` returns the sum NULL:
```sql
SELECT SUM(price) FROM Products;
```
> This may seem surprising, because the empty `sum` could be assumed to be`0` and not `NULL`. Similarly `MIN`, , `MAX`and also `AVG`
give the result `NULL` for the empty data.
- The function `IFNULL` can be used to prepare for a situation where an aggregate function may return the result `NULL`.
-  In the following query, `IFNULL(SUM(price), 0)`otherwise means the same as `SUM(price)`, but the result `NULL`is changed to` 0`.
```sql
SELECT IFNULL(SUM(price),0) FROM Products;
```
##### Handling NULL values
- The function `IFNULL(x, y)`returns the value `x`if `x`not `NULL`, and otherwise the value `y`.
-  This can be used to handle a situation where the value in the SQL query might be NULL.
-   For example, IFNULL(x, 0)changing the value x to zero if it is NULL.
> The function IFNULLis not part of the SQL standard and does not work in all databases.
> The SQL standard function is COALESCE, which can be used in the same way. For example, COALESCE(x, 0)means the same as IFNULL(x, 0).
We will return NULLto the discussion of values ​​in more detail later.



