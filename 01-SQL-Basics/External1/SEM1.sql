USE college_db;
create database college_db;
-- 1. Department table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

-- 2. Student table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    age INT,
    city VARCHAR(50),
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id)
);

-- 3. Course table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    fees DECIMAL(10,2)
);

-- 4. Faculty table
CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY,
    faculty_name VARCHAR(50),
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id)
);

-- 5. Enrollment table
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    marks INT,
    FOREIGN KEY (student_id)
        REFERENCES Students(student_id),
    FOREIGN KEY (course_id)
        REFERENCES Courses(course_id)
);

-- 6. Employee table
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    manager_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (manager_id)
        REFERENCES Employees(employee_id)
);
INSERT INTO Departments VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Management'),
(4, 'Electronics'),
(5, 'Physics');

INSERT INTO Students VALUES
(101, 'Aman', 22, 'Delhi', 1),
(102, 'Riya', 21, 'Pune', 1),
(103, 'Rahul', 23, 'Mumbai', 2),
(104, 'Priya', 22, 'Chennai', 2),
(105, 'Karan', 24, 'Delhi', 3),
(106, 'Sneha', 21, 'Pune', 3),
(107, 'Arjun', 22, 'Kolkata', 1),
(108, 'Neha', 23, 'Chennai', NULL);

INSERT INTO Courses VALUES
(201, 'DBMS', 5000),
(202, 'Java', 6000),
(203, 'Python', 4500),
(204, 'Mathematics', 4000),
(205, 'AI ML', 8000),
(206, 'Cloud Computing', 7000);

INSERT INTO Faculty VALUES
(301, 'Mr Sharma', 1),
(302, 'Ms Verma', 2),
(303, 'Mr Khan', 3),
(304, 'Ms Gupta', 1);


INSERT INTO Enrollments VALUES
(1, 101, 201, 85),
(2, 101, 202, 78),
(3, 102, 201, 92),
(4, 102, 203, 88),
(5, 103, 204, 75),
(6, 104, 204, 90),
(7, 105, 202, 65),
(8, 106, 205, 95),
(9, 107, 201, 80),
(10, 107, 205, 89);


INSERT INTO Employees VALUES
(1, 'Director', NULL, 100000),
(2, 'Manager A', 1, 70000),
(3, 'Manager B', 1, 75000),
(4, 'Developer A', 2, 45000),
(5, 'Developer B', 2, 50000),
(6, 'Analyst A', 3, 40000);

SELECT * FROM Departments;
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Faculty;
SELECT * FROM Enrollments;
SELECT * FROM Employees;


CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY,
    student_id INT,
    attendance_date DATE,
    status VARCHAR(10)
);

alter table students add email varchar(100);
alter table students modify student_name varchar(100);
alter table students rename column city to student_city;
alter table students drop column email;
rename table attendance to StudentAttendance;
drop table StudentAttendance;

