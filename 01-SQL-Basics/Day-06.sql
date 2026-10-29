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

-- 2. DISTINCT — remove duplicate values
-- SELECT DISTINCT column_name FROM table_name      -- basic formate

-- Example 1: Find unique cities

select distinct city from employees;

-- Example 2: Find all unique departments
select distinct department from employees;

-- Example 3: Unique department and city combinations
select distinct department,city from employees;

-- Example 4: Count unique departments

select count(distinct department) as total_departments from employees;

-- 3. WHERE — filter records using a condition
-- WHERE selects only those rows that satisfy a specified condition.
-- Syntax:SELECT column1, column2 FROM table_name WHERE condition;

-- Example 1: Find employees in IT
select*from employees where department='IT';

-- Example 2: Find employees earning more than ₹60,000

select*from employees where salary > 60000;

-- Example 3: Find employees from Delhi
select*from employees where city='Delhi';

-- Example 4: Select specific columns and filter
SELECT emp_name, department, salary
FROM Employees
WHERE department = 'Finance';

 -- Key rules
-- WHERE comes after FROM.
-- Text values are written in quotes: 'Delhi'.
-- Numeric values normally do not require quotes: 60000.
-- WHERE filters rows before the final result is returned.
-- Use = for equality, not ==.


----------------------- Operators used in SQL ------------------------------
-- A. Equality operator =
-- Find employees whose salary is exactly ₹50,000.
select emp_name,salary from employees where salary=50000;

-- B. Not equal operator <>
-- Find employees who do not work in HR.
select emp_name,department from employees where department <> 'HR';

-- C. Greater than >
-- Find employees older than 25.
select emp_name,department from employees where age >25;

-- D. Less than <
-- Find employees earning less than ₹50,000.
select emp_name,department,salary from employees where salary < 50000;

-- E. Greater than or equal to >=
-- Find employees earning at least ₹60,000.
select emp_name,department,salary from employees where salary >=60000;

-- F. Less than or equal to <=
-- Find employees with three or fewer years of experience.
SELECT emp_name, experience
FROM Employees
WHERE experience <= 3;

-- 5. AND — both conditions must be true
-- AND combines two or more conditions. A row is selected only when every condition is TRUE.

-- Example 1: IT employees earning more than ₹60,000
SELECT emp_name, department, salary
FROM Employees
WHERE department = 'IT'
  AND salary > 60000;
  
  -- Example 2: Employees older than 25 with experience of at least 4 years
  SELECT emp_name, age, experience
FROM Employees
WHERE age > 25
  AND experience >= 4;

-- C. IT employees from Delhi earning at least ■60,000. Result: Aman and Rahul.
SELECT emp_name, department, city, salary
FROM Employees
WHERE department = 'IT'
 AND city = 'Delhi'
 AND salary >= 60000;

-- 6. OR — AT LEAST ONE CONDITION MUST BE TRUE

-- OR returns a row if at least one condition is TRUE.

-- A. Employees in IT or HR.
SELECT emp_name, department
FROM Employees
WHERE department = 'IT'
 OR department = 'HR';
 
 -- B. Employees from Delhi or Chennai.
select emp_name,department,city from employees where city='Delhi' or 'Chennai';

-- C. Salary above ■70,000 OR age below 24. Result: Rahul, Karan, Arjun, Pooja.
SELECT emp_name, salary, age
FROM Employees
WHERE salary > 70000
 OR age<24;
 
 -- AND vs OR 
 -- AND generally narrows results because every condition must pass. 
 -- OR generally broadens results because anyone condition can qualify a row.
 
 -- 7. NOT(<>) — NEGATE A CONDITION
-- NOT reverses TRUE and FALSE. With NULL, the result may remain UNKNOWN.

-- A. Employees not in IT.
SELECT emp_name, department
FROM Employees
WHERE NOT (department = 'IT');

-- B. Employees whose salary is not greater than ■60,000; for non-NULL salaries this is equivalent to salary <= 60000.
select emp_name,department from employees where NOT (salary>60000);

-- C. Employees not from Delhi.
select emp_name,department from employees where city<>'Delhi';

-- D. Employees who are NOT (in IT AND from Delhi). This excludes only rows satisfying both conditions.
select emp_name,department,city  from employees where department<>'IT'and city<>'Delhi';

-- E. Different requirement: employees not in IT AND not from Delhi.
SELECT emp_name, department, city
FROM Employees
WHERE department <> 'IT'
 AND city <>'Delhi';
 
 -- NOTE: Logic distinction NOT (A AND B) is not the same as (NOT A AND NOT B).
 -- In SQL's three-valued logic, be especially careful when
-- NULL values are possible.


-- 8. OPERATOR PRECEDENCE & PARENTHESES

-- in MySQL, comparisons are evaluated before NOT, NOT before AND, 
-- and AND before OR. Parentheses explicitly group
-- conditions and should be used whenever the intended logic could be unclear.

-- Potentially confusing query: AND is evaluated before OR.

SELECT emp_name, department, salary
FROM Employees
WHERE department = 'IT'
 OR department = 'HR'
 AND salary > 60000;
 -- Equivalent grouping:
select emp_name,department,salary from employees where department = 'IT' OR (department = 'HR' AND salary > 60000);
-- If the requirement is IT or HR employees who earn more than ■60,000, group the department conditions first:
SELECT emp_name, department, salary
FROM Employees
WHERE (department = 'IT' OR department = 'HR')
 AND salary > 60000;
 -- Relevant precedence order
-- Order //Operator / expression //Purpose
-- 1// Parentheses ( ) //Explicitly group expressions
-- 2 //Comparison operators //Compare values
-- 3 //NOT //Negate a condition
-- 4 //AND //All conditions must be true
-- 5 //OR //At least one condition must be true

-- 9. COMBINING DISTINCT AND WHERE
-- A. Unique cities of IT employees.
SELECT DISTINCT city
FROM Employees
WHERE department = 'IT';

-- B. Unique departments among employees earning at least ■60,000.
SELECT DISTINCT department
FROM Employees
WHERE salary >= 60000;

-- C. Unique cities of employees earning more than ■50,000.
select distinct  city from employees where salary>50000;

-- D. Unique departments of employees who are outside Delhi, earn at least ■50,000, and work in IT or Finance.
SELECT DISTINCT department
FROM Employees
WHERE city <> 'Delhi'
 AND salary >= 50000
 AND (department = 'IT' OR department = 'Finance');
 
 -- How to read combined queries
-- Start with the parentheses, evaluate each condition, combine the conditions using AND/OR, filter rows with
-- WHERE, and finally apply DISTINCT to the selected result


-- 10. NULL HANDLING
-- NULL means a value is missing or unknown. It is not equal to zero, an empty string, or the text 'NULL'.
SELECT * FROM Employees WHERE salary IS NULL;
SELECT * FROM Employees WHERE salary IS NOT NULL;


-- NOTE: Three-valued logic
-- comparisons involving NULL usually evaluate to UNKNOWN. WHERE returns only rows where its condition is
-- TRUE. For example, NOT (salary > 60000) will not select a row whose salary is NULL.


-- Day-07,:11. TWENTY PRACTICE QUESTIONS WITH SOLUTIONS



