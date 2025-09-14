#### Internal workings of the database
- The job of a database system is to process SQL commands given by the user. For example, when a user issues a command that retrieves information from a database, the database system must find a good way to process the command and deliver the results to the user as quickly as possible.
- The beauty of SQL is that the user only needs to describe what information they want, and then the database system does the work and retrieves the information from the depths of the database. This is convenient for the user, because they do not need to know anything about the internal workings of the database and can trust the database system.
- Implementing a database system is a difficult task, because the system must both be able to handle SQL commands efficiently and ensure that everything works correctly with concurrent users and in unexpected situations. In this course, we will explore databases mainly from the perspective of the database user and will not delve into the internal workings of databases.

#### 1. What is a Database User?
- A database user is an identity recognized by a `database management system (DBMS)` that controls access to the database and its objects. It's an account that allows a person, application, or service to connect to and interact with a database.

Think of it like a user account on your operating system:
- **Username** to identify yourself
- **Password** to authenticate yourself
- **Permissions** that determine what files you can see and programs you can run

A database user works on the same principle but for data operations (reading, inserting, updating, or deleting data).

#### 2. Why are Database Users Important? (The Principle of Least Privilege)

The primary purpose of database users is **security** and **access control**.

- **Security:** Prevents unauthorized access to sensitive information
- **Integrity:** Prevents accidental or malicious modification of critical data
- **Auditability:** Enables logging of who performed which action when
- **Management:** Allows DBAs to grant precise levels of access for specific tasks

#### 3. Key Concepts Related to Database Users

##### a) Authentication
The process of verifying the user's identity. Common methods include:
- Username and password
- Integrated Windows Authentication
- Certificate-based authentication
- Token-based authentication

##### b) Authorization (Permissions & Privileges)
Determines what an authenticated user is allowed to do:

**Privilege Levels:**
- **System-level:** Global actions (e.g., `CREATE DATABASE`)
- **Database-level:** Actions within a specific database
- **Object-level:** Actions on specific objects (tables, views, etc.)

**Common Privileges (CRUD):**
- `SELECT`: Read data
- `INSERT`: Add new data
- `UPDATE`: Modify existing data
- `DELETE`: Remove data
- `EXECUTE`: Run stored procedures
- `ALTER`: Change table structure
- `DROP`: Delete objects

##### c) Roles
Groups of privileges that can be assigned to users en masse. This is a security best practice.

Example workflow:
1. Create a role called `data_entry_clerk`
2. Grant necessary privileges to the role
3. Add users to the role

##### d) Schemas
Containers for database objects (tables, views, etc.). Users are often associated with a default schema, and permissions can be granted at the schema level.

#### 4. Types of Database Users

| User Type | Description | Typical Use Case |
|-----------|-------------|------------------|
| **Administrator (DBA)** | Has full control over the entire DBMS instance | Database setup, configuration, user management, backups |
| **Application User** | Service account used by an application to connect to the database | Website backend reading and writing data |
| **End User** | A specific person needing direct database access | Business analyst running custom reports |
| **Schema Owner** | User who owns a specific schema and all objects within it | Development to separate logical database parts |

#### 5. Example in SQL (SQL Server Syntax)

```sql
-- 1. Create a Login at the server level (for authentication)
CREATE LOGIN app_login WITH PASSWORD = 'StrongPassword123!';

-- 2. Create a User in a specific database (for authorization)
USE MyDatabase;
CREATE USER app_user FOR LOGIN app_login;

-- 3. Create a Role and grant it privileges
CREATE ROLE read_write_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::dbo TO read_write_role;
GRANT EXECUTE ON SCHEMA::dbo TO read_write_role;

-- 4. Add the user to the role
ALTER ROLE read_write_role ADD MEMBER app_user;
```


