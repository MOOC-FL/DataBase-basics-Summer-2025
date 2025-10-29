#### Table References

The central idea in databases is that a row in one table can refer to a row in another table. This allows queries to be created that collect information from multiple tables based on references. In practice, the reference is usually the ID number of a row in the other table.

#### Example

As an example, let's consider a situation where a database contains information about courses and their teachers. We assume that each course has one teacher and the same teacher can teach multiple courses.

We store information about teachers in a `Teachers` table. Each teacher has an ID number that we can use to refer to them.

```sql
CREATE TABLE Teachers (
  id INTEGER PRIMARY KEY,
  name TEXT
);
```
The content of the table could be, for example, the following:

| id  | name       |
|-----|------------|
| 1   | Kaila      |
| 2   | Luukkainen |
| 3   | Kivinen    |
| 4   | Laaksonen  |

The `Courses` table, in turn, contains information about the courses and a reference to the course teacher for each course.

```sql
CREATE TABLE Courses (
  id INTEGER PRIMARY KEY,
  name TEXT,
  teacher_id INTEGER REFERENCES Teachers
);
```

Here, the column `teacher_id` refers to the `id` number of the row in the `Teachers` table, which is indicated by the notation `REFERENCES Teachers`.

The content of the table could be, for example, the following:

| id  | name              | teacher_id |
|-----|-------------------|------------|
| 1   | Laskennan mallit  | 3          |
| 2   | Tietoverkot       | 1          |
| 3   | Graduseminaari    | 1          |
| 4   | PHP-ohjelmointi   | 4          |
| 5   | Neuroverkot       | 3          |

This means that, for example, the course Computational Models is taught by a teacher whose ID number is 3. The table `Teachers` shows that the teacher in question is Kivinen.

We can now retrieve the courses and their teachers with the following query, which retrieves information from the tables `Courses` and `Teachers` at the same time:

```sql
SELECT
  Courses.name, Teachers.name
FROM
  Courses, Teachers
WHERE
  Courses.teacher_id = Teachers.id;
```

Since there are many tables in the query, we declare the tables of columns. For example, `Courses.name` refers to the column `name` of table `Courses`.

The query gives the following result:

| name              | name      |
|-------------------|-----------|
| Laskennan mallit  | Kivinen   |
| Tietoverkot       | Kaila     |
| Graduseminaari    | Kaila     |
| PHP-ohjelmointi   | Laaksonen |
| Neuroverkot       | Kivinen   |
```
# What happened here?

The new thing about the query above is that the query applies to multiple tables (`FROM Courses, Teachers`), but what does this mean?

The idea is that when a query has multiple tables, the starting point for the result set is all the ways to select combinations of rows from the tables. Then, you can use the conditions in the `WHERE` part to determine which combinations of rows are of interest.

A good way to understand how a multi-table query works is to first look at a query that retrieves all columns and does not have a `WHERE` part. In the example situation above, such a query would be as follows:

```sql
SELECT * FROM Courses, Teachers;
```

Since there are 5 rows in the `Courses` table and 4 rows in the `Teachers` table, the query's result table has 5 * 4 = 20 rows. The result table contains all possible ways to first select a row from the table `Courses` and then select a row from the table `Teachers`:

| id  | name              | teacher_id | id  | name       |
|-----|-------------------|------------|-----|------------|
| 1   | Laskennan mallit  | 3          | 1   | Kaila      |
| 1   | Laskennan mallit  | 3          | 2   | Luukkainen |
| 1   | Laskennan mallit  | 3          | 3   | Kivinen    |
| 1   | Laskennan mallit  | 3          | 4   | Laaksonen  |
| 2   | Tietoverkot       | 1          | 1   | Kaila      |
| 2   | Tietoverkot       | 1          | 2   | Luukkainen |
| 2   | Tietoverkot       | 1          | 3   | Kivinen    |
| 2   | Tietoverkot       | 1          | 4   | Laaksonen  |
| 3   | Graduseminaari    | 1          | 1   | Kaila      |
| 3   | Graduseminaari    | 1          | 2   | Luukkainen |
| 3   | Graduseminaari    | 1          | 3   | Kivinen    |
| 3   | Graduseminaari    | 1          | 4   | Laaksonen  |
| 4   | PHP-ohjelmointi   | 4          | 1   | Kaila      |
| 4   | PHP-ohjelmointi   | 4          | 2   | Luukkainen |
| 4   | PHP-ohjelmointi   | 4          | 3   | Kivinen    |
| 4   | PHP-ohjelmointi   | 4          | 4   | Laaksonen  |
| 5   | Neuroverkot       | 3          | 1   | Kaila      |
| 5   | Neuroverkot       | 3          | 2   | Luukkainen |
| 5   | Neuroverkot       | 3          | 3   | Kivinen    |
| 5   | Neuroverkot       | 3          | 4   | Laaksonen  |

However, most of the result rows are not interesting because the information they contain is unrelated. For example, the first result row only tells you that there is a course called Calculation Models and that there is a teacher named Kaila.

To ensure that the query yields meaningful results, we limit the search so that the teacher ID number must be the same in the rows of both tables:

```sql
SELECT
  *
FROM
  Courses, Teachers
WHERE
  Courses.teacher_id = Teachers.id;
```

As a result, the query starts to yield meaningful results:

| id  | name              | teacher_id | id  | name      |
|-----|-------------------|------------|-----|-----------|
| 1   | Laskennan mallit  | 3          | 3   | Kivinen   |
| 2   | Tietoverkot       | 1          | 1   | Kaila     |
| 3   | Graduseminaari    | 1          | 1   | Kaila     |
| 4   | PHP-ohjelmointi   | 4          | 4   | Laaksonen |
| 5   | Neuroverkot       | 3          | 3   | Kivinen   |

After this, we can further refine the query results by selecting the columns we are interested in:

```sql
SELECT
  Courses.name, Teachers.name
FROM
  Courses, Teachers
WHERE
  Courses.teacher_id = Teachers.id;
```

This leads us to the same result as before:

| name              | name      |
|-------------------|-----------|
| Laskennan mallit  | Kivinen   |
| Tietoverkot       | Kaila     |
| Graduseminaari    | Kaila     |
| PHP-ohjelmointi   | Laaksonen |
| Neuroverkot       | Kivinen   |

## Add conditions to the query

In multi-table queries, the `WHERE` part connects the rows of the tables we are interested in, but we can also put other conditions in the `WHERE` part in the same way as before. For example, we can run the following query:

```sql
SELECT
  Courses.name, Teachers.name
FROM
  Courses, Teachers
WHERE
  Courses.teacher_id = Teachers.id AND Teachers.name = 'Kivinen';
```

This is how we can search for courses taught by Kivinen:

| name              | name     |
|-------------------|----------|
| Laskennan mallit  | Kivinen  |
| Neuroverkot       | Kivinen  |

## Short names of the tables

We can summarize a multi-table query by giving the tables alternative short names that we can use to refer to them in the query. For example, the query:

```sql
SELECT
  Courses.name, Teachers.name
FROM
  Courses, Teachers
WHERE
  Courses.teacher_id = Teachers.id;
```
```markdown
# Multi-Table Query Techniques

## Using Table Aliases

The query:

```sql
SELECT
  Courses.name, Teachers.name
FROM
  Courses, Teachers
WHERE
  Courses.teacher_id = Teachers.id;
```

can be presented more briefly using table aliases:

```sql
SELECT
  C.name, T.name
FROM
  Courses AS C, Teachers AS T
WHERE
  C.teacher_id = T.id;
```

The word `AS` is not required, so we can shorten the query further:

```sql
SELECT
  C.name, T.name
FROM
  Courses C, Teachers T
WHERE
  C.teacher_id = T.id;
```

## Repeating the Same Table

A multi-table query can also have the same table appear multiple times, as long as the repeated tables are given different aliases. For example, the following query finds all ways to select a pair of two teachers:

```sql
SELECT A.name, B.name FROM Teachers A, Teachers B;
```

The result of the query is as follows:

| name       | name       |
|------------|------------|
| Kaila      | Kaila      |
| Kaila      | Luukkainen |
| Kaila      | Kivinen    |
| Kaila      | Laaksonen  |
| Luukkainen | Kaila      |
| Luukkainen | Luukkainen |
| Luukkainen | Kivinen    |
| Luukkainen | Laaksonen  |
| Kivinen    | Kaila      |
| Kivinen    | Luukkainen |
| Kivinen    | Kivinen    |
| Kivinen    | Laaksonen  |
| Laaksonen  | Kaila      |
| Laaksonen  | Luukkainen |
| Laaksonen  | Kivinen    |
| Laaksonen  | Laaksonen  |
```
