#### Adding information
- The command `INSERT` adds a new row to the table. For example, the following command adds a row to the table we just created Production:
```sql
INSERT INTO Production (name,price) VALUES ('redish', 7);
```
- Here we give values ​​to the columns `name` and of the row to be added `price`. When a column `id` has consecutive numbering,
- it automatically gets the value 1 when it is the first row of the table. So the following row appears in the table:

| id | nimi      | hinta |
|----|-----------|-------|
| 1  | retiisi   | 7     |
- If we don't provide a value for a column,
-  it will get a default value. For a regular column, the default value is `NULL`, which means there is no data. For example,
-  in the following command, we don't provide a value for the column hinta:
```sql
INSERT INTO Production (name,price) VALUES('retiisi');
```

| id | nimi      | hinta |
|----|-----------|-------|
| 1  | retiisi   | NULL     |
#### Example table
In the examples that follow in this section, we will assume that we have added Production following five rows to the table:
```sql
INSERT INTO Production (name,price) VALUES('retiisi',7);
INSERT INTO Production (name,price) VALUES('porkkana',5);
INSERT INTO Production (name,price) VALUES('nauris',4);
INSERT INTO Production (name,price) VALUES('lanttu',8);
INSERT INTO Production (name,price) VALUES('selleri',4);
```
| id | nimi      | hinta |
|----|-----------|-------|
| 1  | retiisi   | 7     |
| 2  | porkkana  | 5     |
| 3  | nauris    | 4     |
| 4  | lanttu    | 8     |
| 5  | selleri   | 4     |
   

