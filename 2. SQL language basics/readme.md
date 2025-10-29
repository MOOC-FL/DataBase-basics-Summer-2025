### What is SQL?

**SQL (Structured Query Language)** is the standard language for managing and manipulating relational databases. You use it to communicate with a database to perform tasks like retrieving data, updating records, and creating new database structures.

---

### 1. Core Concepts: Tables

A relational database is made up of **tables**. Think of a table like a spreadsheet.

*   **Rows:** Represent individual records (e.g., a single customer).
*   **Columns:** Represent the attributes of the records (e.g., customer ID, name, email).
*   **Fields:** The intersection of a row and a column, containing a specific piece of data.

**Example Table: `Customers`**

| CustomerID | CustomerName | ContactName | Country |
| :--------- | :----------- | :---------- | :------ |
| 1          | Alfreds      | Maria Anders | Germany |
| 2          | Ana Trujillo | Ana Trujillo | Mexico  |
| 3          | Antonio Moreno | Antonio Moreno | Mexico  |

---

### 2. Fundamental SQL Commands (The CRUD Operations)

The most common operations are summarized by the acronym **CRUD**: Create, Read, Update, Delete.

#### **R**EAD: The `SELECT` Statement
This is the most frequently used command. It retrieves data from one or more tables.

*   **Select all columns from a table:**
    ```sql
    SELECT * FROM Customers;
    ```

*   **Select specific columns:**
    ```sql
    SELECT CustomerName, Country FROM Customers;
    ```

*   **Filter results with `WHERE`:**
    ```sql
    SELECT * FROM Customers
    WHERE Country = 'Mexico';
    ```

#### **C**REATE: The `INSERT` Statement
This adds new records to a table.

*   **Insert a complete record:**
    ```sql
    INSERT INTO Customers (CustomerName, ContactName, Country)
    VALUES ('Cardinal', 'Tom B. Erichsen', 'Norway');
    ```

#### **U**PDATE: The `UPDATE` Statement
This modifies existing records in a table.

*   **Update a specific record:**
    ```sql
    UPDATE Customers
    SET ContactName = 'Alfred Schmidt'
    WHERE CustomerID = 1;
    ```
    > **⚠️ Important:** Always use a `WHERE` clause with `UPDATE` and `DELETE`. If you omit it, you will update *every* record in the table.

#### **D**ELETE: The `DELETE` Statement
This removes records from a table.

*   **Delete a specific record:**
    ```sql
    DELETE FROM Customers
    WHERE CustomerID = 2;
    ```
    > **⚠️ Important:** Again, always use a `WHERE` clause unless you intend to empty the entire table.

---

### 3. Refining Your Queries

#### Filtering with `WHERE` (More Operators)
The `WHERE` clause can use more than just `=`.

*   **Comparison Operators:** `>`, `<`, `>=`, `<=`, `<>` (not equal)
    ```sql
    SELECT * FROM Products
    WHERE Price > 20;
    ```
*   `AND` & `OR`:
    ```sql
    SELECT * FROM Customers
    WHERE Country = 'Germany' AND City = 'Berlin';
    ```
*   `IN`:
    ```sql
    SELECT * FROM Customers
    WHERE Country IN ('Germany', 'France', 'UK');
    ```
*   `LIKE` (for pattern matching with wildcards):
    *   `%` represents zero, one, or multiple characters.
    *   `_` represents a single character.
    ```sql
    -- Finds customers whose name starts with 'a'
    SELECT * FROM Customers
    WHERE CustomerName LIKE 'a%';
    ```

#### Sorting with `ORDER BY`
Sorts the result set by one or more columns.

*   **Ascending (default):**
    ```sql
    SELECT * FROM Customers
    ORDER BY CustomerName;
    ```
*   **Descending:**
    ```sql
    SELECT * FROM Customers
    ORDER BY CustomerName DESC;
    ```

---

### 4. Key Clauses Summary

| Clause     | Purpose                                                       | Example                                                  |
| :--------- | :------------------------------------------------------------ | :------------------------------------------------------- |
| `SELECT`   | Specifies the columns to be returned.                         | `SELECT CustomerName, Phone`                             |
| `FROM`     | Specifies the table to query.                                 | `FROM Customers`                                         |
| `WHERE`    | Filters rows based on a condition.                            | `WHERE Country = 'USA'`                                  |
| `ORDER BY` | Sorts the result set.                                         | `ORDER BY CustomerName DESC`                             |
| `INSERT INTO` | Inserts new rows into a table.                              | `INSERT INTO Table (Col1, Col2) VALUES (Val1, Val2)`    |
| `UPDATE`   | Modifies existing rows in a table.                            | `UPDATE Table SET Col1 = Val1 WHERE condition`           |
| `DELETE`   | Deletes existing rows from a table.                           | `DELETE FROM Table WHERE condition`                      |

This is the absolute foundation of SQL. Once you are comfortable with these, you can move on to more advanced topics like **JOINS** (combining data from multiple tables), **aggregate functions** (`COUNT`, `SUM`, `AVG`), and **GROUP BY**.
