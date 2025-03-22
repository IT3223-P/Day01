--IT3223(P) Practical Exercise 02

Achira Wijesuriya@DESKTOP-8FO0AKP c:\xampp
# mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 10
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

--a) Create a database with name “CustomerDB” using MySQL having the above relations’ instances with proper indication of Primary and Foreign keys
MariaDB [(none)]> DROP DATABASE IF EXISTS CustomerDB;
Query OK, 2 rows affected (0.017 sec)

MariaDB [(none)]> CREATE DATABASE CustomerDB;
Query OK, 1 row affected (0.002 sec)

MariaDB [(none)]> USE CustomerDB;
Database changed
MariaDB [CustomerDB]> CREATE TABLE Customerdetails (
    ->     CustomerNo INT PRIMARY KEY,
    ->     CustomerName VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.019 sec)

MariaDB [CustomerDB]> CREATE TABLE Itemdetails (
    ->     ItemNo VARCHAR(10) PRIMARY KEY,
    ->     ItemName VARCHAR(50),
    ->     UnitPrice INT
    -> );
Query OK, 0 rows affected (0.020 sec)

MariaDB [CustomerDB]> CREATE TABLE Salesdetails (
    ->     CustomerNo INT,
    ->     ItemNo VARCHAR(10),
    ->     SalesQty INT,
    ->     FOREIGN KEY (CustomerNo) REFERENCES Customerdetails(CustomerNo),
    ->     FOREIGN KEY (ItemNo) REFERENCES Itemdetails(ItemNo)
    -> );
Query OK, 0 rows affected (0.036 sec)

--b) Display the data definition for each of the relations
MariaDB [CustomerDB]> DESC Customerdetails;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| CustomerNo   | int(11)     | NO   | PRI | NULL    |       |
| CustomerName | varchar(50) | YES  |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
2 rows in set (0.042 sec)

MariaDB [CustomerDB]> DESC Itemdetails;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| ItemNo    | varchar(10) | NO   | PRI | NULL    |       |
| ItemName  | varchar(50) | YES  |     | NULL    |       |
| UnitPrice | int(11)     | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.040 sec)

MariaDB [CustomerDB]> DESC Salesdetails;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| CustomerNo | int(11)     | YES  | MUL | NULL    |       |
| ItemNo     | varchar(10) | YES  | MUL | NULL    |       |
| SalesQty   | int(11)     | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
3 rows in set (0.039 sec)

--c) List all the records for each of the relations
MariaDB [CustomerDB]> INSERT INTO Customerdetails (CustomerNo, CustomerName) VALUES
    -> (101, 'rahunath'),
    -> (120, 'latha'),
    -> (201, 'ramanan'),
    -> (520, 'rajeshvaren')
    -> ;
Query OK, 4 rows affected (0.015 sec)
Records: 4  Duplicates: 0  Warnings: 0

MariaDB [CustomerDB]> INSERT INTO Itemdetails (ItemNo, ItemName, UnitPrice) VALUES
    -> ('S0243', 'Anchor', 325),
    -> ('R7603', 'Sunsilk', 125),
    -> ('A9480', 'Lifeboy', 25),
    -> ('EU450', 'Pencil', 15)
    -> ;
Query OK, 4 rows affected (0.013 sec)
Records: 4  Duplicates: 0  Warnings: 0

MariaDB [CustomerDB]> INSERT INTO Salesdetails (CustomerNo, ItemNo, SalesQty) VALUES
    -> (120, 'EU450', 25),
    -> (120, 'R7603', 3),
    -> (520, 'A9480', 30),
    -> (520, 'S0243', 5)
    -> ;
Query OK, 4 rows affected (0.013 sec)
Records: 4  Duplicates: 0  Warnings: 0

MariaDB [CustomerDB]> SELECT * FROM Customerdetails;
+------------+--------------+
| CustomerNo | CustomerName |
+------------+--------------+
|        101 | rahunath     |
|        120 | latha        |
|        201 | ramanan      |
|        520 | rajeshvaren  |
+------------+--------------+
4 rows in set (0.001 sec)

MariaDB [CustomerDB]> SELECT * FROM Itemdetails;
+--------+----------+-----------+
| ItemNo | ItemName | UnitPrice |
+--------+----------+-----------+
| A9480  | Lifeboy  |        25 |
| EU450  | Pencil   |        15 |
| R7603  | Sunsilk  |       125 |
| S0243  | Anchor   |       325 |
+--------+----------+-----------+
4 rows in set (0.001 sec)

MariaDB [CustomerDB]> SELECT * FROM Salesdetails;
+------------+--------+----------+
| CustomerNo | ItemNo | SalesQty |
+------------+--------+----------+
|        120 | EU450  |       25 |
|        120 | R7603  |        3 |
|        520 | A9480  |       30 |
|        520 | S0243  |        5 |
+------------+--------+----------+
4 rows in set (0.001 sec)

--d) Write down SQL statements for each of the following queries:
--1. Display all the item names, sales quantities, unit prices, and total sales amounts for each item based on the sales data. (Sales Amount = UnitPrice * SalesQty)
MariaDB [CustomerDB]> SELECT Itemdetails.ItemName, Salesdetails.SalesQty, Itemdetails.UnitPrice,
    -> (Itemdetails.UnitPrice * Salesdetails.SalesQty) AS SalesAmount
    -> FROM Salesdetails
    -> JOIN Itemdetails ON Salesdetails.ItemNo = Itemdetails.ItemNo;
+----------+----------+-----------+-------------+
| ItemName | SalesQty | UnitPrice | SalesAmount |
+----------+----------+-----------+-------------+
| Lifeboy  |       30 |        25 |         750 |
| Pencil   |       25 |        15 |         375 |
| Sunsilk  |        3 |       125 |         375 |
| Anchor   |        5 |       325 |        1625 |
+----------+----------+-----------+-------------+
4 rows in set (0.003 sec)

--2. Display all the item no, sales quantities and unit prices, which items have the lowest unit price
MariaDB [CustomerDB]> SELECT ItemNo, SalesQty, UnitPrice
    -> FROM Itemdetails
    -> JOIN Salesdetails USING(ItemNo)
    -> WHERE UnitPrice = (SELECT MIN(UnitPrice) FROM Itemdetails);
+--------+----------+-----------+
| ItemNo | SalesQty | UnitPrice |
+--------+----------+-----------+
| EU450  |       25 |        15 |
+--------+----------+-----------+
1 row in set (0.002 sec)

--3. Display the details of item numbers, item names, sales quantities, and customer names for each sale
MariaDB [CustomerDB]> SELECT Salesdetails.ItemNo, Itemdetails.ItemName, Salesdetails.SalesQty, Customerdetails.CustomerName
    -> FROM Salesdetails
    -> JOIN Itemdetails ON Salesdetails.ItemNo = Itemdetails.ItemNo
    -> JOIN Customerdetails ON Salesdetails.CustomerNo = Customerdetails.CustomerNo;
+--------+----------+----------+--------------+
| ItemNo | ItemName | SalesQty | CustomerName |
+--------+----------+----------+--------------+
| A9480  | Lifeboy  |       30 | rajeshvaren  |
| EU450  | Pencil   |       25 | latha        |
| R7603  | Sunsilk  |        3 | latha        |
| S0243  | Anchor   |        5 | rajeshvaren  |
+--------+----------+----------+--------------+
4 rows in set (0.001 sec)

--4. Display the Customer No, Customer Name, and Total Sales Quantity for each customer
MariaDB [CustomerDB]> SELECT Customerdetails.CustomerNo, Customerdetails.CustomerName, SUM(Salesdetails.SalesQty) AS TotalSalesQty
    -> FROM Customerdetails
    -> JOIN Salesdetails ON Customerdetails.CustomerNo = Salesdetails.CustomerNo
    -> GROUP BY Customerdetails.CustomerNo, Customerdetails.CustomerName;
+------------+--------------+---------------+
| CustomerNo | CustomerName | TotalSalesQty |
+------------+--------------+---------------+
|        120 | latha        |            28 |
|        520 | rajeshvaren  |            35 |
+------------+--------------+---------------+
2 rows in set (0.001 sec)

--5. List the items, which have a total sales amount of 250 or more, along with their customer names and sales quantities
MariaDB [CustomerDB]> SELECT Itemdetails.ItemName, Customerdetails.CustomerName, Salesdetails.SalesQty,
    ->        (Itemdetails.UnitPrice * Salesdetails.SalesQty) AS SalesAmount

    -> FROM Salesdetails
    -> JOIN Itemdetails ON Salesdetails.ItemNo = Itemdetails.ItemNo
    -> JOIN Customerdetails ON Salesdetails.CustomerNo = Customerdetails.CustomerNo
    -> WHERE (Itemdetails.UnitPrice * Salesdetails.SalesQty) >= 250;
+----------+--------------+----------+-------------+
| ItemName | CustomerName | SalesQty | SalesAmount |
+----------+--------------+----------+-------------+
| Lifeboy  | rajeshvaren  |       30 |         750 |
| Pencil   | latha        |       25 |         375 |
| Sunsilk  | latha        |        3 |         375 |
| Anchor   | rajeshvaren  |        5 |        1625 |
+----------+--------------+----------+-------------+
4 rows in set (0.001 sec)

MariaDB [CustomerDB]>