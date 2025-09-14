#### Internal workings of the database
- The job of a database system is to process SQL commands given by the user. For example, when a user issues a command that retrieves information from a database, the database system must find a good way to process the command and deliver the results to the user as quickly as possible.
- The beauty of SQL is that the user only needs to describe what information they want, and then the database system does the work and retrieves the information from the depths of the database. This is convenient for the user, because they do not need to know anything about the internal workings of the database and can trust the database system.
- Implementing a database system is a difficult task, because the system must both be able to handle SQL commands efficiently and ensure that everything works correctly with concurrent users and in unexpected situations. In this course, we will explore databases mainly from the perspective of the database user and will not delve into the internal workings of databases.


