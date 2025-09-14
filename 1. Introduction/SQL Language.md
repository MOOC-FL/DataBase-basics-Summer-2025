#### SQL Language
- SQL ( Structured Query Language ) is an established way to manipulate database content.
- The language contains commands that allow a database user (such as a database programmer) to `insert`, `retrieve`, `modify`, and `delete` data.
> SQL commands consist of keywords (such as `SELECT`and `WHERE`), table and column names, and other values. For example, the command
```sql
SELECT hinta FROM Tuotteet WHERE nimi = 'retiisi';
```
- retrieves the price of radish from the database of products. The command ends with a semicolon ;and we can use spaces and line breaks as we wish.
- We could also write the command on multiple lines, for example as follows:
```sql
SELECT hinta
FROM Tuotteet
WHERE nimi = 'retiisi';

SELECT
  hinta
FROM
  Tuotteet
WHERE
  nimi = 'retiisi';
```
> SQL was created in the 1970s and has many features reminiscent of old-fashioned programming , such as:
* [ ] Keywords are complete English words, and commands resemble English sentences.
* [ ] Keywords are not case sensitive. For example `SELECT`, , `select` and `Select` mean the same thing. Keywords are often written entirely in uppercase.
* [ ] The symbol `=` means both a setting and an equality comparison (in programming today, equality comparison is usually `==`.
> There are standards for the SQL language that aim to provide a common foundation for the language. In practice, however, each database's implementation of the SQL language works in a slightly different way. In this course, we will focus on the features of SQL that are commonly used across different databases.




