#### More about the COUNT function
- If `COUNT` the function contains an asterisk `*`,
  * [ ] the query will count all rows.
  * [ ]  If the function contains a column name,
  * [ ]  the query will count rows where the column contains a value,
  * [ ]  i.e. the column value is not `NULL`.
- As an example, consider the following table, where row 3 does not have a price:
- The following query retrieves the total number of rows:
```sql
SELECT COUNT(*) FROM Products;
```
> THE Output is COUNT IS 4
```sql
SELECT COUNT(price) FROM Products;
```
> THE Output is COUNT IS 3
- We can also use the word DISTINCTto count how many different values ​​there are in a column:
```sql
SELECT COUNT (DISTINICT price) FROM Products;
```
> THE Output COUNT(Distinict price) is 2
- This query returns 2 because pricethere are two different values ​​in the column (4 and 7). This does not include NULLthe value.




