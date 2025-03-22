--IT3223(P) Practical Exercise 03

Achira Wijesuriya@DESKTOP-8FO0AKP c:\xampp
# mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 11
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

--1. Create database called Exercises
MariaDB [(none)]> DROP DATABASE IF EXISTS Exercises;
Query OK, 0 rows affected, 1 warning (0.015 sec)

MariaDB [(none)]> CREATE DATABASE Exercises;
Query OK, 1 row affected (0.012 sec)

MariaDB [(none)]> USE Exercises;
Database changed

--2. Create table employee
MariaDB [Exercises]> CREATE TABLE Employee (
    ->     First_name VARCHAR(50),
    ->     Last_name VARCHAR(50),
    ->     Age INT,
    ->     Dept VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.041 sec)

MariaDB [Exercises]> INSERT INTO Employee (First_name, Last_name, Age, Dept) VALUES
    -> ('Shana', 'Ragavan', 30, 'Acct'),
    -> ('Raj', 'Sanmugam', 27, 'Devl'),
    -> ('Nuska', 'Nasar', 37, 'QA'),
    -> ('Shashini', 'Rathna', 32, 'QA')
    -> ;
Query OK, 4 rows affected (0.017 sec)
Records: 4  Duplicates: 0  Warnings: 0

--3. Write a MySQL statement to find the concatenated first_name, last_name where age of the employee is greater than 30
MariaDB [Exercises]> SELECT CONCAT(First_name, ' ', Last_name) AS FullName
    -> FROM Employee
    -> WHERE Age > 30;
+-----------------+
| FullName        |
+-----------------+
| Nuska Nasar     |
| Shashini Rathna |
+-----------------+
2 rows in set (0.014 sec)

--4. Create table Student
MariaDB [Exercises]> CREATE TABLE Student (
    ->     id INT PRIMARY KEY,
    ->     name VARCHAR(50),
    ->     department VARCHAR(10),
    ->     age INT
    -> );
Query OK, 0 rows affected (0.017 sec)

MariaDB [Exercises]> INSERT INTO Student (id, name, department, age) VALUES
    -> (1, 'Maria Gloria', 'CS', 22),
    -> (2, 'John Smith', 'IT', 23),
    -> (3, 'Gal Rao', 'CS', 22),
    -> (4, 'Jakey Smith', 'EC', 24),
    -> (5, 'Rama Saho', 'IT', 22),
    -> (6, 'Maria Gaga', 'EC', 23)
    -> ;
Query OK, 6 rows affected (0.013 sec)
Records: 6  Duplicates: 0  Warnings: 0

--5. Write a MySQL statement to select data of only CS and IT departments
MariaDB [Exercises]> SELECT * FROM Student
    -> WHERE department IN ('CS', 'IT');
+----+--------------+------------+------+
| id | name         | department | age  |
+----+--------------+------------+------+
|  1 | Maria Gloria | CS         |   22 |
|  2 | John Smith   | IT         |   23 |
|  3 | Gal Rao      | CS         |   22 |
|  5 | Rama Saho    | IT         |   22 |
+----+--------------+------------+------+
4 rows in set (0.010 sec)

--6. Write a MySQL statement to select data of all departments in descending order by age
MariaDB [Exercises]> SELECT * FROM Student
    -> ORDER BY age DESC;
+----+--------------+------------+------+
| id | name         | department | age  |
+----+--------------+------------+------+
|  4 | Jakey Smith  | EC         |   24 |
|  2 | John Smith   | IT         |   23 |
|  6 | Maria Gaga   | EC         |   23 |
|  1 | Maria Gloria | CS         |   22 |
|  3 | Gal Rao      | CS         |   22 |
|  5 | Rama Saho    | IT         |   22 |
+----+--------------+------------+------+
6 rows in set (0.011 sec)

MariaDB [Exercises]>