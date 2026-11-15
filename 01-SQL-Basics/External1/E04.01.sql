CREATE DATABASE SQL_Practice;
USE SQL_Practice;

CREATE TABLE Student (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(30),
    department VARCHAR(30),
    age INT,
    marks INT,
    fees INT
);

INSERT INTO Student VALUES
(1, 'Amit', 'Delhi', 'MCA', 22, 85, 50000),
(2, 'Rahul', 'Mumbai', 'MBA', 23, 72, 60000),
(3, 'Priya', 'Delhi', 'MCA', 21, 92, 50000),
(4, 'Neha', 'Pune', 'BCA', 20, 65, 40000),
(5, 'Arjun', 'Chennai', 'MCA', 24, 78, 55000),
(6, 'Sneha', 'Mumbai', 'BCA', 21, 88, 40000),
(7, 'Karan', 'Delhi', 'MBA', 22, 55, 60000),
(8, 'Pooja', 'Pune', 'MCA', 23, 95, 55000),
(9, 'Rohit', 'Chennai', 'BCA', 20, 45, 40000),
(10, 'Anjali', 'Delhi', 'MCA', 22, 76, 50000),
(11, 'Vikas', 'Mumbai', 'MCA', 25, 81, 55000),
(12, 'Meena', 'Pune', 'MBA', 21, 69, 60000);
SELECT * FROM Student;


/*3. AND operator — Practice questions
Concept: Both conditions must be satisfied by a record.
Q1. Display students whose marks are greater than 80 AND age is greater than 21.*/
select name,marks,city from student where marks>80 and age > 21;
-- Explanation: A student must satisfy both conditions.
-- Q2. Display students who belong to MCA AND live in Delhi.
select name,department,city from student where department='MCA' and city='Delhi';
-- Q3. Display students whose marks are between 70 and 90 AND fees are 50000.
SELECT *
FROM Student
WHERE marks >= 70 AND marks <= 90
AND fees = 50000;
-- Q4. Display students whose age is at least 21 AND marks are at least 75.
SELECT *
FROM Student
WHERE age >= 21 AND marks >= 75;
-- Q5. Display MCA students from Mumbai whose marks are greater than 75.
select name,department from student where department ='MCA' and city ='Mumbai' and marks>75;


-- 4. OR operator — Practice questions
-- concept: At least one condition must be true.
-- Q6. Display students who belong to Delhi OR Mumbai.
SELECT *
FROM Student
WHERE city = 'Delhi' OR city = 'Mumbai';
-- Q7. Display students whose marks are greater than 90 OR age is less than 21.
SELECT *
FROM Student
WHERE marks > 90 OR age < 21;
-- Q8. Display students who belong to MCA OR MBA.
SELECT *
FROM Student
WHERE department = 'MCA'
OR department = 'MBA';
-- Q9. Display students whose fees are 40000 OR marks are greater than 90.
SELECT *
FROM Student
WHERE fees = 40000 OR marks > 90;
-- Q10. Display students who live in Pune OR have marks less than 60.
SELECT *
FROM Student
WHERE city = 'Pune' OR marks < 60;
/*5. NOT operator — Practice questions
Concept: NOT reverses the result of a condition.
Q11. Display students who do NOT belong to Delhi.*/
SELECT *
FROM Student
WHERE NOT city = 'Delhi';
-- Q12. Display students who are NOT studying MCA.
SELECT *
FROM Student
WHERE NOT department = 'MCA';
-- Q13. Display students whose marks are NOT greater than 80.
SELECT *
FROM Student
WHERE NOT marks > 80;
-- Q14. Display students whose city is NOT Mumbai AND marks are greater than 70.
SELECT *
FROM Student
WHERE NOT city = 'Mumbai'
AND marks > 70;
-- Q15. Display students who are NOT from Pune OR whose marks are greater than 90.
SELECT *
FROM Student
WHERE NOT city = 'Pune'
OR marks > 90;
select *from student WHERE NOT city = 'Delhi' AND marks > 70;

-- 6. IN operator — Practice questions
-- Q16. Display students who belong to Delhi, Pune or Mumbai.
SELECT *
FROM Student
WHERE city IN ('Delhi', 'Pune', 'Mumbai');
-- Q17. Display students who belong to MCA or BCA.
SELECT *
FROM Student
WHERE department IN ('MCA', 'BCA');
-- 18. Display students whose marks are 55, 72, 85 or 95.
	SELECT *
FROM Student
WHERE marks IN (55, 72, 85, 95);
-- Q19. Display students who are NOT from Delhi or Pune.
SELECT *
FROM Student
WHERE city NOT IN ('Delhi', 'Pune');
-- Q20. Display students whose fees are either 40000 or 55000 and marks are greater than 75.
-- tip: Prefer IN when checking multiple possible values of the same column.

/*7. BETWEEN operator — Practice questions
Concept: BETWEEN checks whether a value falls within a range.

Remember: Both endpoints are included.
Q21. Display students whose marks are between 60 and 90.*/
SELECT *
FROM Student
WHERE marks BETWEEN 60 AND 90;
-- Q22. Display students whose age is between 21 and 23.
SELECT *
FROM Student
WHERE age BETWEEN 21 AND 23;
-- Q23. Display students whose fees are between 40000 and 50000.
SELECT *
FROM Student
WHERE fees BETWEEN 40000 AND 50000;
-- Q24. Display students whose marks are NOT between 60 and 80.
SELECT *
FROM Student
WHERE marks NOT BETWEEN 60 AND 80;
-- Q25. Display students whose marks are between 70 and 95 AND age is between 21 and 24.
SELECT *
FROM Student
WHERE marks BETWEEN 70 AND 95
AND age BETWEEN 21 AND 24;
-- 8. LIKE operator — Practice questions
/*8. LIKE operator — Practice questions
Concept: LIKE is used for pattern matching, particularly with text columns.*/
-- Q26. Display students whose names start with A.
SELECT *
FROM Student
WHERE name LIKE 'A%';
-- Q27. Display students whose names end with a.
select*from student where name like '%a';
-- Q28. Display students whose names contain the letter 'o'.
SELECT *
FROM Student
WHERE name LIKE '%o%';
-- Q29. Display students whose names have exactly four characters.
SELECT *
FROM Student
WHERE name LIKE '____';
-- Q31. Display students whose second character is 'a'.
SELECT *
FROM Student
WHERE name LIKE '_a%';
-- Q32. Display students whose names do NOT start with A.
SELECT *
FROM Student
WHERE name NOT LIKE 'A%';


/*9. Mixed practice — Combine all six operators
These are more important for exams and placement-oriented SQL practice because questions often combine multiple conditions.*/
-- Q34. Display MCA students from Delhi or Pune who have marks greater than 80.
SELECT *
FROM Student
WHERE department = 'MCA'
AND city IN ('Delhi', 'Pune')
AND marks > 80;
-- Q35. Display students who are not from Mumbai and whose marks are between 60 and 90.
SELECT *
FROM Student
WHERE city NOT IN ('Mumbai')
AND marks BETWEEN 60 AND 90;
-- Q36. Display students whose names start with P or R and marks are greater than 70.
SELECT *
FROM Student
WHERE (name LIKE 'P%' OR name LIKE 'R%')
AND marks > 70;
-- Q37. Display students who belong to MCA or BCA, but do not live in Delhi.
SELECT *
FROM Student
WHERE department IN ('MCA', 'BCA')
AND city NOT IN ('Delhi');
-- Q38. Display students whose names contain 'a', marks are between 60 and 90, and city is not Pune.
SELECT *
FROM Student
WHERE name LIKE '%a%'
AND marks BETWEEN 60 AND 90
AND city NOT IN ('Pune');