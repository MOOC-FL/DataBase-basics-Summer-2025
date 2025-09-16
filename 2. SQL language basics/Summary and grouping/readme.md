#### Summary and grouping
- A summary query returns a single value from the rows of a table, such as the number of rows in a table or the sum of all values ​​in a column. The result table for this type of query contains only one row.

- The basis of a summary query is an aggregate function , which calculates a summary value from the rows of a table. The most common aggregate functions are the following:
   - `COUNT()`: number of rows
   - `SUM()`: sum of values
   - `MIN()`: minimum value
   - `MAX()`: maximum value
   - `AVG()`: average of values
##### 1. `COUNT()`
- The following query retrieves the number of rows in a table:
```sql
SELECT COUNT(*) FROM Products;
```
- The following query retrieves the number of rows where the price is 4:
```SQL
SELECT COUNT(*) FROM Products WHERE price = 4;
```
##### 2. `SUM()`
- The following query retrieves the sum of the prices of products:
```sql
SELECT SUM(price) FROM products;
```
> In this case, the query results in 7 + 5 + 4 + 8 + 4 = 28.
##### 3. `MIN()` & `MAX()`
- The following query retrieves the lowest and highest price:
````SQL
SELECT MIN(price) ,MAX(price) FROM Products;

