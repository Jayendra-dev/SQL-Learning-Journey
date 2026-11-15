use collegeDB;

CREATE TABLE Student (
    roll_no INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    city VARCHAR(50),
    marks INT,
    course VARCHAR(30)
);

drop table student;


INSERT INTO Student VALUES
(101, 'Aman', 21, 'Delhi', 85, 'MCA'),
(102, 'Rahul', 22, 'Mumbai', 72, 'MCA'),
(103, 'Priya', 20, 'Delhi', 95, 'BCA'),
(104, 'Neha', 21, 'Chennai', 65, 'MCA'),
(105, 'Arjun', 23, 'Mumbai', 88, 'BCA'),
(106, 'Sneha', 20, 'Pondicherry', 91, 'MCA'),
(107, 'Karan', 22, 'Delhi', 55, 'BCA'),
(108, 'Riya', 21, 'Pondicherry', 78, 'MCA'),
(109, 'Vikas', 23, 'Chennai', 85, 'BCA'),
(110, 'Anjali', 20, 'Mumbai', 95, 'MCA');


-- 2. WHERE command
-- Concept: WHERE is used to filter records based on a specified condition.

-- Q1. Display all students who scored more than 80 marks.
select* from student where marks>80;

-- Q2. Display students whose age is exactly 21.
select *from student where age>21;

-- Q3. Display students who belong to Delhi.
select*from student where city ='Delhi';

-- Q4. Display students who scored less than 70 marks.
select*from student where marks<70;
-- Q5. Display students whose course is MCA.
select * from student where course='MCA';

-- Level 2 — Intermediate questions
-- Q6. Display students who scored between 70 and 90 marks.
select*from student where marks between 70 and 80;
-- Remember: BETWEEN includes both endpoints.

-- Q7. Display students who belong to Delhi or Mumbai.
SELECT *
FROM Student
WHERE city IN ('Delhi', 'Mumbai');

-- Q8. Display students who do not belong to Delhi.
select *from student where city <>'Delhi';
-- Q9. Display students whose marks are greater than 80 and age is less than 23.
select* from student where marks > 80 and age <23;
-- Q10. Display students who belong to MCA or have scored more than 90 marks.
select* from student where course='MCA' or marks >90;


-- Level 3 — Advanced exam questions
-- Q11. Display students who belong to Delhi and scored more than 80 marks.
select * from student where city='Delhi' and marks>80;
-- Q12. Display students who are not from Chennai and have scored at least 80 marks.
select *from student where city<>'chennai'and marks>=80;

-- Q13. Display students whose names start with 'A'.
SELECT *
FROM Student
WHERE name LIKE 'A%';

-- Q14. Display students whose names end with 'a'.
select *from student where name like'%a';

-- Q15. Display students whose marks are not between  60 and 85.
select*from student where marks not  between 60 and 85;

-- 3. DISTINCT command
-- Concept: DISTINCT removes duplicate values from the result.
-- syntax :SELECT DISTINCT column_name FROM table_name;

-- Practice questions with solutions
-- Q16. Display all unique cities of students.
select distinct city from  student;
-- Q17. Display all unique courses.
select distinct course from student;
-- Q18. Display unique ages of students.
select distinct age from student ;
-- Q19. Display unique combinations of city and course.
SELECT DISTINCT city, course
FROM Student;
-- Important: Here DISTINCT applies to the combination of both columns, not individually to each column.
-- Q20. Count the number of different cities.
SELECT COUNT(DISTINCT city) AS Total_Cities FROM Student;
-- Q21. Count the number of different courses.
select count(distinct course ) as total_Course from student;


-- 4. ORDER BY command
-- Concept: ORDER BY arranges the records in ascending or descending order.
-- SYNTAX:SELECT column_name FROM table_name ORDER BY column_name ASC;

-- Level 1 — Basic questions
-- Q22. Display students according to marks in ascending order.
select name,marks from student order by marks asc; 
-- Q23. Display students according to marks in descending order.
select name ,marks from student order by marks desc;
-- Q24. Display students according to their names alphabetically.
select *from student order by name asc;
-- Q25. Display students according to age from highest to lowest.
select*from student order by age desc;
-- Q25. Display students according to age from highest to lowest.
select * from student order by age desc;


-- Level 2 — Intermediate questions
-- Q26. Display the top three students based on marks.
select * from student order by marks desc limit 3;
-- Q27. Display students according to city alphabetically.
select*from student order by city asc;
-- Q28. Display students according to marks in descending order, but show only their names and marks.
select name,marks from student order by marks desc ;
-- Q29. Display students according to age in ascending order and marks in descending order.
SELECT *
FROM Student
ORDER BY age ASC, marks DESC;
-- Explanation: First, students are sorted by age. If two students have the same age, their marks determine their order.
-- Q30. Display the highest-scoring student first and lowest-scoring student last.
select*from student order by marks desc;


-- 5. Combined questions — WHERE + DISTINCT + ORDER BY
-- Q31. Display unique cities of students who scored more than 80 marks.
select distinct city from student where marks >80;
-- Q32. Display names of MCA students in descending order of marks.
SELECT name, marks
FROM Student
WHERE course = 'MCA'
ORDER BY marks DESC;
-- Q33. Display unique courses of students belonging to Delhi.
select distinct course from student where city ='Delhi';
-- Q34. Display students from Mumbai who scored more than 75, arranged alphabetically by name.
select*from student where city='Mumbai' and marks>75 order by marks asc ;
-- Q35. Display the three highest-scoring students from MCA.
select *from student where course='MCA' order by marks desc limit 3;
-- Note: LIMIT 3 returns exactly three rows, even if there is a tie at the third position.

-- Exam self-test
-- 5 questions

-- Q1. Find students who scored exactly 95 marks.
select*from student where marks=95;
-- 2. Display unique cities in descending alphabetical order.
select distinct city from student order by city desc;
-- Q3. Find students aged between 20 and 22, arranged by marks from highest to lowest.
select name ,age from student where age between 20 and 22 order by  marks desc;
-- Q4. Display the names of students who are not enrolled in BCA.
select name,course  from student where course <>'BCA';
-- Q5. Display the second-highest distinct marks.
SELECT DISTINCT marks FROM Student ORDER BY marks DESC LIMIT 1 OFFSET 1;