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

> Master key

> The primary key of a database table is a column (or combination of columns) that uniquely identifies each row in the table. No two rows in the table can have the same primary key value. In practice, a very common choice for a primary key is an integer ID number.

> We often also want the id number to have sequential numbering . This means that when rows are added to the table, the first row will automatically get id number 1, the second row will get id number 2, etc. The implementation of sequential numbering depends on the database. For example, in an `SQLite database`, `INTEGER PRIMARY KEY` a column of type will automatically get sequential numbering.






