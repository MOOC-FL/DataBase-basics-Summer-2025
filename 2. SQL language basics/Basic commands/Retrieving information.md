#### Retrieving information
- The command `SELECT` performs a query , or retrieves information from a table.
- The simplest way to perform a query is to retrieve all the information from a table:
In this case, the query result is as follows:

| id | nimi      | hinta |
|----|-----------|-------|
| 1  | retiisi   | 7     |
| 2  | porkkana  | 5     |
| 3  | nauris    | 4     |
| 4  | lanttu    | 8     |
| 5  | selleri   | 4     |
- In the query, the asterisk *indicates that we want to retrieve all columns. However, we can also retrieve only some of the columns by specifying the column names. For example, the following query retrieves only the product names:
```sql
SELECT nimi FROM Tuotteet;
```
The result of the survey is as follows:
| nimi      | 
|-----------|
| retiisi   |
| porkkana  |
| nauris    |
| lanttu    | 
| selleri   |
The following query, in turn, retrieves the names and prices of the products:

SELECT nimi, hinta FROM Tuotteet;
Now the query result changes like this:

| nimi      | hinta |
|-----------|-------|
| retiisi   | 7     |
| porkkana  | 5     |
| nauris    | 4     |
| lanttu    | 8     |
| selleri   | 4     |
> The rows resulting from a query form a table called a result table . Its columns and rows depend on the contents of the query. For example, the previous query created a result table with two columns and five rows.

> There are therefore two types of tables in database processing: tables that are permanently present in the database, in which the database content is stored, and temporary result tables formed by queries, whose data is compiled from fixed tables.




