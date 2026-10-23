-- 1. Create a sample database
CREATE DATABASE sql_practice;
USE sql_practice;

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    city VARCHAR(30),
    salary DECIMAL(10,2),
    age INT,
    experience INT
);
desc Employees;
INSERT INTO Employees VALUES
(1, 'Aman',   'IT',      'Delhi',    60000, 24, 2),
(2, 'Priya',  'HR',      'Mumbai',   45000, 27, 4),
(3, 'Rahul',  'IT',      'Delhi',    75000, 29, 5),
(4, 'Neha',   'Finance', 'Chennai',  55000, 26, 3),
(5, 'Karan',  'IT',      'Mumbai',   50000, 23, 1),
(6, 'Simran', 'HR',      'Delhi',    65000, 31, 7),
(7, 'Arjun',  'Finance', 'Mumbai',   40000, 22, 1),
(8, 'Pooja',  'IT',      'Chennai',  90000, 32, 8),
(9, 'Vikas',  'Sales',   'Delhi',    45000, 28, 4),
(10,'Isha',   'Sales',   'Chennai',  70000, 25, 2);
select*from employees;
