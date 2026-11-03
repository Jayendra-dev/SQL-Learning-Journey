-- DAY-10
create database sql_materclass;
use sql_masterclass;
INSERT INTO Employees VALUES
(1, 'Rahul', 'IT', 'Delhi', 25, 50000, 2, 'Male'),
(2, 'Priya', 'HR', 'Mumbai', 28, 45000, 4, 'Female'),
(3, 'Amit', 'IT', 'Delhi', 30, 70000, 6, 'Male'),
(4, 'Sneha', 'Finance', 'Pune', 26, 55000, 3, 'Female'),
(5, 'Karan', 'IT', 'Mumbai', 24, 40000, 1, 'Male'),
(6, 'Neha', 'HR', 'Delhi', 29, 60000, 5, 'Female'),
(7, 'Arjun', 'Finance', 'Pune', 32, 80000, 8, 'Male'),
(8, 'Pooja', 'IT', 'Chennai', 27, 65000, 4, 'Female'),
(9, 'Vikas', 'Sales', 'Mumbai', 35, 90000, 10, 'Male'),
(10, 'Anjali', 'Sales', 'Delhi', 23, 35000, 1, 'Female'),
(11, 'Rohit', 'IT', 'Pune', 31, 75000, 7, 'Male'),
(12, 'Meena', 'HR', 'Chennai', 25, 42000, 2, 'Female'),
(13, 'Sahil', 'Finance', 'Delhi', 28, 58000, 4, 'Male'),
(14, 'Kavya', 'IT', 'Mumbai', 26, 62000, 3, 'Female'),
(15, 'Dev', 'Sales', 'Pune', 29, 68000, 5, 'Male');
SELECT * FROM Employees;

-- (OR) based Problems

-- Day-10 Querries
-- Employees in IT or HR
select emp_name,department from employees where department='IT' or department='HR';

-- Employees in Delhi or Mumbai
select emp_name ,city from employees where city='Mumbai' or city='Delhi';

-- Salary below 40,000 or above 70,000
select emp_name,salary from employees where salary<40000 or salary>70000;

-- IT employees or employees earning above 80,000 
select emp_name ,salary,department from employees where department='IT' or salary>80000;

-- 6. NOT operator
 --  NOT reverses a condition: TRUE becomes FALSE, FALSE becomes TRUE, and UNKNOWN remains UNKNOWN
 
 -- Employees not from Delhi
 select emp_name,department from employees where city !='Delhi';
 
 -- Employees not in IT
 select emp_name ,department from employees where NOT department ='IT';
 
 -- Salary not greater than 50,000
select emp_name ,department,salary from employees where NOT salary >50000;

-- Employees neither from Delhi nor Mumbai
SELECT *
FROM Employees
WHERE NOT (city = 'Delhi' OR city = 'Mumbai');
-- NOT city = 'Delhi' is equivalent to city <> 'Delhi'. 
-- Parentheses are useful when NOT is applied to a compound condition.

-- Day-11 -- DISTINCT Keyword.






