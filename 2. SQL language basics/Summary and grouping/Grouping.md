#### Grouping
- Grouping allows us to combine row-specific data and aggregate function data. The idea is that the rows are divided into groups `GROUP BY` according to the columns given in the -section, and then the aggregate function value is calculated for each group separately.
  
| id | name     | company   | salary |
|----|----------|-----------|--------|
| 1  | Anna     | Google    | 8000   |
| 2  | Liisa    | Google    | 7500   |
| 3  | Kaaleppi | Amazon    | 5000   |
| 4  | Uolevi   | Amazon    | 8000   |
| 5  | Maija    | Google    | 9500   |
| 6  | Vihtori  | Facebook  | 5000   |
> The following query retrieves the number of employees for each company:
```sql
SELECT company ,COUNT(*) FROM Employees GROUP BY company;
```
```sql
SELECT company, COUNT(*) AS employee_count
FROM Employees
GROUP BY company
ORDER BY company;
```
| company   | COUNT(*) |
|-----------|----------|
| Amazon    | 2        |
| Facebook  | 1        |
| Google    | 3        |

- This means that Amazon has 2 employees, Facebook has 1 employee, and Google has 3 employees.
#### How does Grouping Works ?
- In grouping, each group contains all rows that have the same content in the columns used in the grouping. Grouping produces a scorecard with the same number of rows as the number of groups. Each row can contain the columns used in the grouping as well as aggregate functions.
- In the recent query, the grouping condition is `GROUP BY` company, so the rows are divided into groups companyby column. In this case, the groups are:
- Group 1 :

| id | name     | company | salary |
|----|----------|---------|--------|
| 3  | Kaaleppi | Amazon  | 5000   |
| 4  | Uolevi   | Amazon  | 8000   |

- Group 2 :

| id | name    | company   | salary |
|----|---------|-----------|--------|
| 6  | Vihtori | Facebook  | 5000   |

- Group 3 :

| id | name  | company | salary |
|----|-------|---------|--------|
| 1  | Anna  | Google  | 8000   |
| 2  | Liisa | Google  | 7500   |
| 5  | Maija | Google  | 9500   |

> After this, the number of rows for each group is calculated using the function COUNT(*).
#### Grouping columns
- Quite often, the basis for grouping is exactly one column, such as the column `company` in the previous example. If there are multiple columns in the grouping, each group consists of rows that have the same combination of values ​​in the columns included in the grouping.
- For example, the following query uses two columns as the grouping basis:
```sql
SELECT company,salary,
COUNT(*)
FROM Employees
GROUP BY company,salary;
```
- Because each row has a different combination of values ​​in these columns, each row in the scoreboard is in its own group:
  
| company   | salary | COUNT(*) |
|-----------|--------|----------|
| Amazon    | 5000   | 1        |
| Amazon    | 8000   | 1        |
| Facebook  | 5000   | 1        |
| Google    | 7500   | 1        |
| Google    | 8000   | 1        |
| Google    | 9500   | 1        |

- After grouping, the scorecard may contain columns that are part of the grouping but not columns that are not part of the grouping. For example, the following query would not make sense:
```sql
SELECT company,name
FROM Employees
GROUP BY company;
```
- Here, the column nameis not part of the grouping, which makes it unclear what the column value would be in the scoreboard. For example, the scoreboard would only have one row related to the company Amazon, but the company has two employees with different names (Kaaleppi and Uolevi).



