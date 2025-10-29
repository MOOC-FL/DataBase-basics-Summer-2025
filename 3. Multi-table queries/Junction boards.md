
# Junction Tables

## Types of Relationships Between Tables

There are usually two types of relationships between tables:

1. **One-to-many relationship**: A row in Table A is related to at most one row in Table B. A row in Table B can be related to multiple rows in Table A.

2. **Many-to-many relationship**: A row in Table A can relate to multiple rows in Table B. A row in Table B can relate to multiple rows in Table A.

In case 1, we can add a column to table A that references table B, as we did in the example in the previous section. However, in case 2, the situation is more complicated, because a single reference in a row in either table would not be enough. The solution is to create a third join table that contains information about the references.

## Example

Let's consider an example of a situation where an online store has products and customers, and each customer has selected certain products in their shopping cart. A given customer may have multiple products in their cart, and on the other hand, a given product may be in the cart of multiple customers.

We are building a database with three tables: `Products`, `Customers`, and `Purchases`. The join table `Purchases` indicates which products are in each customer's shopping cart. Each row in it represents one pair of the form "customer id in cart is product id".

Let's assume that the contents of the tables are as follows:

**Products table:**
| id | name   | price |
|----|--------|-------|
| 1  | radish | 7     |
| 2  | carrot | 5     |
| 3  | turnip | 4     |
| 4  | swede  | 8     |
| 5  | celery | 4     |

**Customers table:**
| id | name   |
|----|--------|
| 1  | Uolevi |
| 2  | Maija  |
| 3  | Aapeli |

**Purchases table:**
| customer_id | product_id |
|-------------|------------|
| 1           | 2          |
| 1           | 5          |
| 2           | 1          |
| 2           | 4          |
| 2           | 5          |

This means that Uolevi's basket contains carrots and celery, and Maija's basket contains radishes, turnips and celery. Aapeli's basket contains no products.

Now we can search for customers and products as follows:

```sql
SELECT
  Customers.name, Products.name
FROM
  Customers, Products, Purchases
WHERE
  Customers.id = Purchases.customer_id AND
  Products.id = Purchases.product_id;
```

The idea of the query is to retrieve data from tables `Customers` and `Products` using the rows in the table `Purchases`. To get meaningful results, we connect the rows using two conditions. The query produces the following result table:

| name   | name    |
|--------|---------|
| Uolevi | carrot  |
| Uolevi | celery  |
| Maija  | radish  |
| Maija  | swede   |
| Maija  | celery  |

## How does the query work?

We can again examine the behavior of the query by retrieving all columns and removing the conditions:

```sql
SELECT * FROM Customers, Products, Purchases;
```

The result table for this query contains all the ways to select a customer, product, and purchase. The table has 5 * 3 * 5 = 75 rows and starts like this:

| id | name   | id | name   | price | customer_id | product_id |
|----|--------|----|--------|-------|-------------|------------|
| 1  | Uolevi | 1  | radish | 7     | 1           | 2          |
| 1  | Uolevi | 1  | radish | 7     | 1           | 5          |
| 1  | Uolevi | 1  | radish | 7     | 2           | 1          |
| 1  | Uolevi | 1  | radish | 7     | 2           | 4          |
| 1  | Uolevi | 1  | radish | 7     | 2           | 5          |
| 1  | Uolevi | 2  | carrot | 5     | 1           | 2          |
| 1  | Uolevi | 2  | carrot | 5     | 1           | 5          |
| 1  | Uolevi | 2  | carrot | 5     | 2           | 1          |
| 1  | Uolevi | 2  | carrot | 5     | 2           | 4          |
| 1  | Uolevi | 2  | carrot | 5     | 2           | 5          |
| 1  | Uolevi | 3  | turnip | 4     | 1           | 2          |
| 1  | Uolevi | 3  | turnip | 4     | 1           | 5          |
| 1  | Uolevi | 3  | turnip | 4     | 2           | 1          |
| 1  | Uolevi | 3  | turnip | 4     | 2           | 4          |
| 1  | Uolevi | 3  | turnip | 4     | 2           | 5          |
...

Then, when we add conditions to the query, we can narrow down the rows of interest:

```sql
SELECT
  *
FROM
  Customers, Products, Purchases
WHERE
  Customers.id = Purchases.customer_id AND
  Products.id = Purchases.product_id;
```

| id | name   | id | name   | price | customer_id | product_id |
|----|--------|----|--------|-------|-------------|------------|
| 1  | Uolevi | 2  | carrot | 5     | 1           | 2          |
| 1  | Uolevi | 5  | celery | 4     | 1           | 5          |
| 2  | Maija  | 1  | radish | 7     | 2           | 1          |
| 2  | Maija  | 4  | swede  | 8     | 2           | 4          |
| 2  | Maija  | 5  | celery | 4     | 2           | 5          |

Once we specify the desired columns, the result is the final query:

```sql
SELECT
  Customers.name, Products.name
FROM
  Customers, Products, Purchases
WHERE
  Customers.id = Purchases.customer_id AND
  Products.id = Purchases.product_id;
```

| name   | name   |
|--------|--------|
| Uolevi | carrot |
| Uolevi | celery |
| Maija  | radish |
| Maija  | swede  |
| Maija  | celery |

## Add conditions to the query

We can add more conditions to the query if we want to find out more about the shopping carts. For example, the following query retrieves the products in Maija's cart:

```sql
SELECT
  Products.name
FROM
  Customers, Products, Purchases
WHERE
  Customers.id = Purchases.customer_id AND
  Products.id = Purchases.product_id AND
  Customers.name = 'Maija';
```

| name   |
|--------|
| radish |
| swede  |
| celery |

The following query tells you who has celery in their basket:

```sql
SELECT
  Customers.name
FROM
  Customers, Products, Purchases
WHERE
  Customers.id = Purchases.customer_id AND
  Products.id = Purchases.product_id AND
  Products.name = 'celery';
```

| name   |
|--------|
| Uolevi |
| Maija  |

## Summary of the Tables

We can also use aggregate functions and grouping in multi-table queries. They process the result table in the same way as single-table queries.

Let's continue looking at a database with products, customers, and purchases:

**Products table:**
| id | name   | price |
|----|--------|-------|
| 1  | radish | 7     |
| 2  | carrot | 5     |
| 3  | turnip | 4     |
| 4  | swede  | 8     |
| 5  | celery | 4     |

**Customers table:**
| id | name   |
|----|--------|
| 1  | Uolevi |
| 2  | Maija  |
| 3  | Aapeli |

**Purchases table:**
| customer_id | product_id |
|-------------|------------|
| 1           | 2          |
| 1           | 5          |
| 2           | 1          |
| 2           | 4          |
| 2           | 5          |

The following query creates a summary that shows each customer how many items are in their shopping cart and the total price of the items.

```sql
SELECT
  Customers.name, COUNT(Products.id), SUM(Products.price)
FROM
  Customers, Products, Purchases
WHERE
  Customers.id = Purchases.customer_id AND Products.id = Purchases.product_id
GROUP BY
  Customers.id;
```

The result of the query is as follows:

| name   | COUNT(Products.id) | SUM(Products.price) |
|--------|-------------------|---------------------|
| Uolevi | 2                 | 9                   |
| Maija  | 3                 | 19                  |

So Uolevi's basket contains 2 items with a total price of 9, and Maija's basket contains 3 items with a total price of 19.

## How does the query work?

The basis of the query is here:

```sql
SELECT
  *
FROM
  Customers, Products, Purchases
WHERE
  Customers.id = Purchases.customer_id AND Products.id = Purchases.product_id;
```

| id | name   | id | name   | price | customer_id | product_id |
|----|--------|----|--------|-------|-------------|------------|
| 1  | Uolevi | 2  | carrot | 5     | 1           | 2          |
| 1  | Uolevi | 5  | celery | 4     | 1           | 5          |
| 2  | Maija  | 1  | radish | 7     | 2           | 1          |
| 2  | Maija  | 4  | swede  | 8     | 2           | 4          |
| 2  | Maija  | 5  | celery | 4     | 2           | 5          |

When grouping is added to a query `GROUP BY Customers.id`, the rows are divided into two groups by `Customers.id` column:

**Group 1:**
| id | name   | id | name   | price | customer_id | product_id |
|----|--------|----|--------|-------|-------------|------------|
| 1  | Uolevi | 2  | carrot | 5     | 1           | 2          |
| 1  | Uolevi | 5  | celery | 4     | 1           | 5          |

**Group 2:**
| id | name   | id | name   | price | customer_id | product_id |
|----|--------|----|--------|-------|-------------|------------|
| 2  | Maija  | 1  | radish | 7     | 2           | 1          |
| 2  | Maija  | 4  | swede  | 8     | 2           | 4          |
| 2  | Maija  | 5  | celery | 4     | 2           | 5          |

`COUNT(Products.id)` counts the number of products and `SUM(Products.price)` calculates the total purchase price for these groups.

Note that the query groups by `Customers.id` column, but the query retrieves `Customers.name` column. This makes sense, because column `Customers.id` determines column `Customers.name`. This query works in SQLite, for example, but some databases require that the column being retrieved as such must also appear in the grouping. In this case, the grouping should be `GROUP BY Customers.id, Customers.name`.

## Missing row problem

The recent query works fine on its own, but something is missing:

| name   | COUNT(Products.id) | SUM(Products.price) |
|--------|-------------------|---------------------|
| Uolevi | 2                 | 9                   |
| Maija  | 3                 | 19                  |

Another flaw in the query is that the results do not include the third customer in the database, Aapeli. Since Aapeli has nothing in her basket, Aapeli's row does not connect to any other row and does not become part of the result table.

We have encountered a problem, but fortunately we will find a solution to it soon.
```
