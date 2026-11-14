-- Chapter 3: DQL – SELECT Command in SQL (Complete Learning Guide)
/*1. What is DQL?
DQL stands for Data Query Language.
It is used to retrieve or fetch data from database tables.*/

CREATE DATABASE CollegeDB;
drop database CollegeDB;

USE CollegeDB;
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    City VARCHAR(50),
    Marks INT,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID)
        REFERENCES Department(DepartmentID)
);
INSERT INTO Department VALUES
(101, 'Computer Science'),
(102, 'Mathematics'),
(103, 'Data Science'),
(104, 'Commerce'),
(105, 'Physics');
INSERT INTO Student VALUES
(1, 'Aman', 21, 'Delhi', 85, 101),
(2, 'Rahul', 22, 'Mumbai', 78, 102),
(3, 'Priya', 20, 'Chennai', 92, 103),
(4, 'Sneha', 21, 'Delhi', 88, 101),
(5, 'Arjun', 23, 'Pune', 65, 104),
(6, 'Neha', 22, 'Chennai', 95, 103),
(7, 'Karan', 20, 'Mumbai', 72, 102),
(8, 'Riya', 21, 'Pune', 80, 101),
(9, 'Vijay', 24, 'Delhi', 55, 104),
(10, 'Anjali', 22, 'Jaipur', 90, 103);
SELECT * FROM Student;

SELECT * FROM Department;

-- Concept 2: SELECT specific columns
-- Sometimes we do not need all columns. We only want particular information.



/*Concept 3: SELECT with expressions
SQL allows us to perform calculations directly inside SELECT statements.

For example, suppose we want to increase every student's marks by 5 for a hypothetical calculation.*/
SELECT
    Name,
    Marks,
    Marks + 5 AS UpdatedMarks
FROM Student;

SELECT
    Name,
    Marks,
    Marks * 2 AS DoubleMarks
FROM Student;

SELECT
    Name,
    Marks,
    (Marks / 100) * 100 AS Percentage
FROM Student;
/*Concept 4: Column aliases using AS
An alias provides a temporary alternative name to a column in query output.
*Example:*/
SELECT
    Name AS StudentName,
    Marks AS ObtainedMarks
FROM Student;

SELECT
    Name AS FullName,
    City AS HomeCity
FROM Student;


/*Concept 5: SELECT with calculated text
We can combine multiple text values using CONCAT() in MySQL.

Example:*/
SELECT
    CONCAT(Name, ' lives in ', City) AS StudentInformation
FROM Student;

/*Practice Question 5

Display each student's name followed by their marks in one column.

Solution:*/
select concat(name,'score',Marks)as result from student;

/*Concept 6: SELECT with NULL values
NULL means a missing or unknown value.

It is different from:
- 0 (zero)
- Empty string ('')
- Space (' ')
Suppose a student has not received their marks yet.

To check NULL values, use:*/
SELECT *
FROM Student
WHERE Marks IS NULL;
-- To check records that have marks:
SELECT *
FROM Student
WHERE Marks IS NOT NULL;
/*Important: Never use Marks = NULL to check NULL values.

Use IS NULL or IS NOT NULL.*/


-- Q6. Display student names with their marks increased by 10.
SELECT
    Name,
    Marks,
    Marks + 10 AS NewMarks
FROM Student;

-- Q7. Display student names with double their marks.
select name ,marks,marks*2 from student as doubleMarks;

-- Q8. Display names and ages with appropriate aliases.
SELECT
    Name AS StudentName,
    Age AS StudentAge
FROM Student;

-- Q9. Display student names and their department IDs.
select name ,departmentID from student;

-- Q10. Display the name, city and marks of every student in a combined text column.
SELECT
    CONCAT(
        Name, ' - ',
        City, ' - Marks: ',
        Marks
    ) AS StudentDetails
FROM Student;

/*Level 3 – Advanced SELECT practice
Q11. Display student names and calculate marks as a percentage, assuming maximum marks are 100.*/
select name ,marks,(marks/100)*100 as percentage from student;

-- Q12. Display student names and calculate their remaining marks to reach 100.
select name,marks ,(100-marks) as remainingmarks from student;

-- Q13. Display all columns except the City column.
SELECT
    StudentID,
    Name,
    Age,
    Marks,
    DepartmentID
FROM Student;

/*SQL does not generally provide a standard SELECT * EXCEPT City syntax in MySQL, 
so specify the columns you need.*/

-- Q14. Display each student with a greeting message.
SELECT
    CONCAT('Welcome ', Name, ' to College') AS Greeting
FROM Student;

-- Q15. Display all students and calculate marks after a 10% increase.
select name,marks ,(marks/100)*110 as increaseMarks from student;

-- sQL practice test
-- Display only Name and City from the Student table.
select name,city from student;
-- Display all student records with an additional column showing marks multiplied by 3.
select name,marks ,marks*3 as TripleMultiple from student;
-- Display the name of every student with the text ' - MCA Student' appended.
select concat("hello  -> ",name,"->MCA Student") as GREETING from student;

-- Display DepartmentID and DepartmentName with aliases DeptID and DeptName.
SELECT DepartmentID AS DeptID, DepartmentName AS DeptName FROM Department;

-- Display marks and calculate how many marks are needed to reach 90.
select name,marks,(100-marks) as RemainingMarks from student;
-- Question: Display the names of the three students who obtained the highest marks from the Student table.
SELECT
    Name,
    Marks AS HighestMarks
FROM Student
ORDER BY Marks DESC
LIMIT 3;





