#### GROUPING IN SQLite
- Note that SQLite allows the following query to retrieve a non-grouping column:
```sql
SELECT company,name
FROM Employees
GROUP BY company;
```
| company   | name    |
|-----------|---------|
| Amazon    | Uolevi  |
| Facebook  | Vihtori |
| Google    | Maija   |
> Since the column `name` is not part of the grouping,
it can have multiple values ​​in the group and one of them will be selected in the scoreboard using some logic. However,
this kind of query usually does not work in other databases.

