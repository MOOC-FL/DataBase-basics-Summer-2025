#### Basic commands
- In this chapter, we will learn about the most common SQL commands that can be used to insert, retrieve, modify, and delete database content. These commands form the basis for using a database.
##### Creating a board
- The command `CREATE TABLE` creates a table with the desired columns. For example, the following command `creates a table Tuotteet` with `three` columns:
  ```sql
  CREATE TABLE Production(
    id INTEGER PRIMARY KEY,
    name TEXT,
    price INTEGER
  );
  ```
- We can name the table and columns however we want. In this course, the convention is to write the table name with a capital letter and in the plural. We write the column names with a lowercase letter.
- Each column is given a name and a type.
- In this table, columns `id` and `price` are `integers (INTEGER)` and column `name` is a `string (TEXT)`.
-  The column `id` is also the `primary key (PRIMARY KEY)`, which means that it uniquely identifies each row in the table and we can use it to easily refer to any row.






