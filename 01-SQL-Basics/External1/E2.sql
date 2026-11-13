CREATE DATABASE CollegeDB;

USE CollegeDB;

CREATE TABLE Student (
    RollNo INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Department VARCHAR(30),
    City VARCHAR(30),
    Marks INT
);
INSERT INTO Student
VALUES
(101, 'Rahul', 21, 'MCA', 'Delhi', 85),
(102, 'Priya', 22, 'MBA', 'Mumbai', 90),
(103, 'Amit', 21, 'MCA', 'Pune', 75),
(104, 'Sneha', 23, 'BCA', 'Chennai', 88),
(105, 'Rohan', 22, 'MCA', 'Delhi', 65);
SELECT * FROM Student;
INSERT INTO Student
VALUES (106, 'Karan', 21, 'MCA', 'Hyderabad', 82);
INSERT INTO Student
(RollNo, Name, Age, Department, City, Marks)
VALUES
(107, 'Anjali', 22, 'MCA', 'Bangalore', 92);
INSERT INTO Student
(RollNo, Name, Age, Department, City, Marks)
VALUES
(107, 'Anjali', 22, 'MCA', 'Bangalore', 92);
INSERT INTO Student
VALUES (111, 'Varun', 21, 'MCA', NULL, 86);

INSERT INTO Student
(RollNo, Name, Department)
VALUES
(112, 'Meena', 'MCA');
CREATE TABLE MCA_Students (
    RollNo INT,
    Name VARCHAR(50),
    Age INT,
    Department VARCHAR(30),
    City VARCHAR(30),
    Marks INT
);

INSERT INTO MCA_Students
SELECT *
FROM Student
WHERE Department = 'MCA';



UPDATE Student
SET Marks = 95
WHERE RollNo = 101
;
-- Concept: UPDATE is used to modify existing records in a table.

-- Q7. Update the marks of a student.
update student Set Name='Jayendra' where RollNo=101;
select*from Student;
-- Q8. Update the city of a particular student.
UPDATE Student
SET City = 'Bangalore'
WHERE Name = 'Priya';

-- Q9. Update multiple columns simultaneously.
UPDATE Student
SET Age = 22,
    Marks = 80
WHERE RollNo = 103;

-- Q10. Increase marks of all MCA students by 5.
UPDATE Student
SET Marks = Marks + 5
WHERE Department = 'MCA';

-- Q11. Update marks of students whose marks are below 70.
UPDATE Student
SET Marks = Marks + 10
WHERE Marks < 70;

-- Q12. Change the department of students from BCA to MCA.
update Student set department ='MCA' where department ='BCA';

-- Part C: DELETE Command
-- Q13. Delete a student using RollNo.
-- Delete the student whose RollNo is 105.

-- Solution:

delete from   Student where RollNo=101;

-- 14. Delete students belonging to a particular city.
-- Delete all students from Mumbai.
DELETE FROM Student
WHERE City = 'Mumbai';

-- Q15. Delete students whose marks are below 40.
delete from student where marks<40;

-- Q16. Delete students belonging to the BCA department.
delete from student where department='BCA';

-- Q17. Delete students whose age is greater than 22 and marks are below 70.
delete from student where age>22 and marks<70;

-- Q18. Delete all records from the Student table.
delete from student;
-- note:This deletes all rows but keeps the table structure intact.

-- practice Questions
-- Q1. Insert a new student: RollNo 120, Name 'Ravi', Age 22, Department 'MCA', City 'Delhi', Marks 89. Show solution
insert into student (RollNo,Name,Age,Department,city,Marks) values (120,'Ravi',22,'MCA','Delhi',89);
select*from student;

-- Q2. Insert two students in a single INSERT statement: (121, 'Simran', 21, 'BCA', 'Pune', 76) and (122, 'Dev', 23, 'MBA', 'Delhi', 91).
insert into student values(121,'simran',21,'BCA','Pune',76),
(122,'Dev',23,'MBA','Delhi',91);
select *from student;

-- Q3. Change the marks of RollNo 101 to 99.
update student set marks=99 where RollNo=101;


-- Q4. Change the city of all MCA students to Chennai.
update student set city ='chennai' where department='MCA';

-- Q5. Increase marks of every student by 3.
update student set marks=marks+5 where department='MCA';

-- Q6. Delete the student whose RollNo is 104.
delete from student where RollNo=104;

-- Q7. Delete all students whose marks are less than 50.
delete from student where marks<50;
-- Q8. Delete students who belong to Delhi and have marks below 60.
delete from student where city ='Delhi' and marks<60;
-- Q9. Change the department of RollNo 103 to 'BCA' and city to 'Hyderabad'.
update student set department='BCA' where RollNo=103 and city ='Hyderabad';
-- Q10. Delete all records from Student without deleting the table.
delete from student;
select*from student;











