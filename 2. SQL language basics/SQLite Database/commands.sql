CREATE TABLE Products (id INTEGER PRIMARY KEY, name TEXT, price INTEGER);
INSERT INTO Products (name, price) VALUES ('retiisi', 7);
INSERT INTO Products (name, price) VALUES ('porkkana', 5);
INSERT INTO Products (name, price) VALUES ('nauris', 4);
INSERT INTO Products (name, price) VALUES ('lanttu', 8);
INSERT INTO Products (name, price) VALUES ('selleri', 4);
.mode column
.headers on
SELECT * FROM Products;
