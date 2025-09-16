-  By default, the order of the rows in the scoreboard can be any. However, we can specify the desired order ORDER BYusing the -part.
For example, the following query will retrieve products alphabetically by name:
```SQL
SELECT * FROM Products ORDER BY name;
```
> The order is from smallest to largest by default. However, if we want the order to be from largest to smallest, we can add the word DESCafter the column name:
```SQL
SELECT * FROM Products ORDER BY name DESC;
```
- In a database language , the order is either ascending ( from smallest to largest ) or descending ( from largest to smallest ). By default, the order is ascending, and the keyword therefore means descending order.DESC
- There is also a keyword in SQL ASCthat means ascending order. So the following queries work the same way:
```SQL
SELECT * FROM Products ORDER BY name;
SELECT * FROM products ORDER BY name ASC;
```
> In practice, however, the word ASCis rarely used.
- We can also sort rows based on multiple criteria. For example, the following query sorts rows primarily by price, from most expensive to least expensive, and secondarily by alphabetical order by name:
```SQL
SELECT * FROM Products ORDER BY price DESC, name;
```
- In this case, the products turnip and celery are arranged alphabetically by name because they are equally expensive.


