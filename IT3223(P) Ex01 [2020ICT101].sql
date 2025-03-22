Setting environment for using XAMPP for Windows.
2020ict101@CL1-122 c:\xampp
# mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 22
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

--a) Create a database with name “Company” using MySQL having the above relations’ instances with proper indication of Primary and Foreign keys
MariaDB [(none)]> DROP DATABASE IF EXISTS Company;
Query OK, 0 rows affected, 1 warning (0.001 sec)

MariaDB [(none)]> CREATE DATABASE Company;
Query OK, 1 row affected (0.006 sec)

MariaDB [(none)]> USE Company;
Database changed

--b) Display the data definition for each of the relations
MariaDB [Company]> CREATE TABLE Department (
    ->     DepId INT PRIMARY KEY,
    ->     DName VARCHAR(50),
    ->     Location VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.013 sec)

MariaDB [Company]> CREATE TABLE Employee (
    ->     EmpID INT PRIMARY KEY,
    ->     EmpName VARCHAR(50),
    ->     Job VARCHAR(50),
    ->     DepId INT,
    ->     DOB DATE
    -> );
Query OK, 0 rows affected (0.014 sec)

--c) List all the records for each of the relations
MariaDB [Company]> INSERT INTO Department (DepId, DName, Location) VALUES
    ->     (1732, 'Production', 'Jaffna'),
    ->     (1654, 'Supply', 'Vavuniya'),
    ->     (1543, 'Planning', 'Colombo'),
    ->     (2312, 'Mechanical', 'Kilinochchi'),
    ->     (2323, 'Finance', 'Mankulam')
    -> ;
Query OK, 5 rows affected (0.027 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [Company]> INSERT INTO Employee (EmpID, EmpName, Job, DepId, DOB) VALUES
    ->     (111, 'Finch', 'Clerk', 1543, '1993-02-04'),
    ->     (112, 'Warner', 'Engineer', 2312, '1994-03-17'),
    ->     (113, 'Smith', 'Manager', 1732, '1989-05-13'),
    ->     (114, 'Maxwel', 'Accountant', 2323, '1990-08-27'),
    ->     (115, 'Stare', 'Clerk', 1732, '1979-08-31'),
    ->     (116, 'Cummins', 'Technician', 2312, '1998-09-11'),
    ->     (117, 'Zampa', 'Technician', 1654, '1997-12-09'),
    ->     (118, 'Carrery', 'Manager', 1654, '1996-04-29')
    -> ;
Query OK, 8 rows affected (0.008 sec)
Records: 8  Duplicates: 0  Warnings: 0

--d) Write down SQL statements for each of the following queries:
--i. Display the names of all employees whose names start with the letter 'S'
MariaDB [Company]> SELECT EmpName FROM Employee
    -> WHERE EmpName
    -> LIKE 'S%';
+---------+
| EmpName |
+---------+
| Smith   |
| Stare   |
+---------+
2 rows in set (0.001 sec)

--ii. Count the total number of employees who work as 'Manager'
MariaDB [Company]> SELECT COUNT(*)
    -> AS TotalManagers
    -> FROM Employee
    -> WHERE Job = 'Manager';
+---------------+
| TotalManagers |
+---------------+
|             2 |
+---------------+
1 row in set (0.000 sec)

--iii. Add a new column named Salary (of type INT (5)) to the Employee table, placing it between the Job and DepId column
MariaDB [Company]> ALTER TABLE Employee
    -> ADD Salary INT(5)
    -> AFTER Job;
Query OK, 0 rows affected (0.009 sec)
Records: 0  Duplicates: 0  Warnings: 0

--Insert the appropriate salary values for each employee in the Salary column
MariaDB [Company]> UPDATE Employee SET Salary = 25000 WHERE EmpID = 111;
Query OK, 1 row affected (0.005 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [Company]> UPDATE Employee SET Salary = 75000 WHERE EmpID = 112;
Query OK, 1 row affected (0.001 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [Company]> UPDATE Employee SET Salary = 60000 WHERE EmpID = 113;
Query OK, 1 row affected (0.001 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [Company]> UPDATE Employee SET Salary = 65000 WHERE EmpID = 114;
Query OK, 1 row affected (0.001 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [Company]> UPDATE Employee SET Salary = 28000 WHERE EmpID = 115;
Query OK, 1 row affected (0.001 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [Company]> UPDATE Employee SET Salary = 35000 WHERE EmpID = 116;
Query OK, 1 row affected (0.001 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [Company]> UPDATE Employee SET Salary = 32000 WHERE EmpID = 117;
Query OK, 1 row affected (0.001 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [Company]> UPDATE Employee SET Salary = 55000 WHERE EmpID = 118;
Query OK, 1 row affected (0.005 sec)
Rows matched: 1  Changed: 1  Warnings: 0

--iv. Display the EmpId and Job of all employees whose salary is greater than 30,000
MariaDB [Company]> SELECT EmpId, Job
    -> FROM Employee
    -> WHERE Salary > 30000;
+-------+------------+
| EmpId | Job        |
+-------+------------+
|   112 | Engineer   |
|   113 | Manager    |
|   114 | Engineer   |
|   116 | Technician |
|   117 | Technician |
|   118 | Manager    |
+-------+------------+
6 rows in set (0.000 sec)

--v. Get all the department names located in 'Jaffna'
MariaDB [Company]> SELECT DName
    -> FROM Department
    -> WHERE Location = 'Jaffna';
+------------+
| DName      |
+------------+
| Production |
+------------+
1 row in set (0.006 sec)

--vi. Update the accountant to Engineer in the Job column for the Employee whose employee number is '114' in the Employee table
MariaDB [Company]> UPDATE Employee
    -> SET Job = 'Engineer'
    -> WHERE EmpId = 114;
Query OK, 0 rows affected (0.001 sec)
Rows matched: 1  Changed: 0  Warnings: 0

--vii. Display all records from the Employee table where the Department number ends with the digit 2 and has exactly 4 characters in the Employee table
MariaDB [Company]> SELECT *
    -> FROM Employee
    -> WHERE DepId
    -> LIKE '%2' AND LENGTH(DepId) = 4;
+-------+---------+------------+--------+-------+------------+
| EmpID | EmpName | Job        | Salary | DepId | DOB        |
+-------+---------+------------+--------+-------+------------+
|   112 | Warner  | Engineer   |  75000 |  2312 | 1994-03-17 |
|   113 | Smith   | Manager    |  60000 |  1732 | 1989-05-13 |
|   115 | Stare   | Clerk      |  28000 |  1732 | 1979-08-31 |
|   116 | Cummins | Technician |  35000 |  2312 | 1998-09-11 |
+-------+---------+------------+--------+-------+------------+
4 rows in set (0.001 sec)

--viii. Find the departments where the maximum salary of employees is greater than 50,000
MariaDB [Company]> SELECT DepId
    -> FROM Employee
    -> GROUP BY DepId
    -> HAVING MAX(Salary) > 50000;
+-------+
| DepId |
+-------+
|  1654 |
|  1732 |
|  2312 |
|  2323 |
+-------+
4 rows in set (0.001 sec)

--ix. find the average salary of each department and display the result in descending order of average salary
MariaDB [Company]> SELECT DepId, AVG(Salary) AS AvgSalary
    -> FROM Employee
    -> GROUP BY DepId
    -> ORDER BY AvgSalary DESC;
+-------+------------+
| DepId | AvgSalary  |
+-------+------------+
|  2323 | 65000.0000 |
|  2312 | 55000.0000 |
|  1732 | 44000.0000 |
|  1654 | 43500.0000 |
|  1543 | 25000.0000 |
+-------+------------+
5 rows in set (0.001 sec)

--x. display the EmpId, EmpName, DepId, Dname of all employees who works as a “Technician”
MariaDB [Company]> SELECT EmpId, EmpName, Salary
    -> FROM Employee
    -> WHERE EmpName
    -> LIKE 'S%';
+-------+---------+--------+
| EmpId | EmpName | Salary |
+-------+---------+--------+
|   113 | Smith   |  60000 |
|   115 | Stare   |  28000 |
+-------+---------+--------+
2 rows in set (0.001 sec)