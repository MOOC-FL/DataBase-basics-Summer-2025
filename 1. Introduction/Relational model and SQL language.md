> In this course, we will explore databases through the relational model and SQL. At the core of the relational model are two basic ideas:
1. All information is stored in tables as rows that can refer to each other.
2. The database user processes data using SQL, which hides the details of the database's internal operations from the user.
#### Database structure
- A database consists of `tables ( tables )` with `fixed columns ( columns )`. Tables store information in `rows ( rows )`, which have specific `values ​​in the columns`.
- Each table contains a collection of information related to a specific topic.
- The following image shows an example of a database that could be used as part of an online store implementation.
- The tables `Production`, `Customer` and `Shopping` information about products, customers, and the contents of their shopping carts.
- Products Table
  
| id | name   | price |
|----|--------|-------|
| 1  | radish | 7     |
| 2  | carrot | 5     |
| 3  | turnip | 4     |
| 4  | swede  | 8     |
| 5  | celery | 4     |

- Customers Table
  
| id | name   |
|----|--------|
| 1  | Uolevi |
| 2  | Maya   |
| 3  | Apple  |

- Purchases Table (Customer-Product Relationships)
  
| customer_id | product_id |
|-------------|------------|
| 1           | 2          |
| 1           | 5          |
| 2           | 1          |
| 2           | 4          |
| 2           | 5          |
> For example, Production columns in the table are `id`, `name` and `price`. The table currently has five rows of information describing the products in the database.

> The tables `Production`and `customer` row have a unique ID number that can be used to refer to them. This is a common practice in database design. This allows the table `Shopping` use ID numbers to show which products each customer has selected. In this example, Uolevi's basket contains carrots and celery, and Maija's basket contains radishes, turnips, and celery. Aapeli's basket is empty.


