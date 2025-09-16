#### Search condition
- By appending the -part `SELECT` to the query `WHERE`, we can select only some of the rows based on the desired condition. For example, the following query retrieves data from the field:
```sql
SELECT * FROM products WHERE name ='lanttu';
```
- The result of the survey is as follow
  
|id  | name |price|
|--  |------|-----|
|4   | lanttu| 8  |
- You can use comparisons and words in conditions `AND` , `OR` just like in programming. For example, the following query finds products with a price between 4…6:
```sql
SELECT * FROM Products WHERE prics >=4 AND price <=6;
```
- The result of the survey is as follow

|id  | name |price|
|--  |------|-----|
|2   | porkana| 5  |
| 3  | nauris| 4  |
|5   | selleri| 4  |
- In SQL, the operator `<>`means a difference in magnitude. For example, the following query retrieves rows where the price is not 4:
```sql
SELECT * FROM products WHERE price <> 4;
```




