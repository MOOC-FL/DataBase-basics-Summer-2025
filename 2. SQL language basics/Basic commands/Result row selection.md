#### Result row selection
- When we add at the end of the query `LIMIT x`, the query returns only `x` the first row of results. For example `LIMIT 3`, means that the query returns the first three rows of results.
- A more common form is `LIMIT x OFFSET y`, which means we want `x` the `row y` starting at `(0-indexed)`. For example `LIMIT 3 OFFSET 1`, means the query will return the second, third, and fourth rows of results.
> As an example, let's look at a query that searches for products from cheapest to most expensive:
```sql
SELECT * FROM Products ORDER BY price;
```
- The result of the survey is the following scoreboard:

|id|  name     | price
|-- | --------  |-----
|3  | nauris |   2    
|5  | selleri |  4    
|2 |  porkkana | 5    
|1 |  retiisi  | 7    
|4|   lanttu   |8    
- We can find the three cheapest products as follows:
```sql
SELECT * FROM Production ORDER BY price LIMIT 3;
```
- The following query, in turn, retrieves the three cheapest products starting from the second cheapest product:
```SQL
SELECT * FROM Productions ORDER BY price LIMIT 3 OFFSET 1;
```
> Database differences

> Limiting result rows is an example of something that varies across databases. The syntax presented here `LIMIT x OFFSET y` works in `SQLite`, `MySQL`, and `PostgreSQL`.
> The SQL standard did not include delimiting result rows until 2008. The syntax according to the standard is `OFFSET y ROWS FETCH FIRST x ROWS ONLY`. This syntax works in `PostgreSQL`, for example, but not in `MySQL` or `SQLite`.




