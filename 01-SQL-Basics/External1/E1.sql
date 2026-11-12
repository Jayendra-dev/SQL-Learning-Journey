create database company_db;
create table Employees(
emp_id varchar(50) primary key,
emp_name varchar(100),
salary double,
department varchar(50));
drop table employees;
desc Employees;
alter table Employees add column email_id varchar(100);
alter table Employees modify column salary decimal(10,2);
alter table Employees rename column department to department_name ;
alter table employees drop column email_id;
Rename table employees to emp_details;

create table Projects (
project_id int primary key,
project_name  varchar(50));
rename table Projects to projectsCompany;
rename table projectsCompany to CompanyProjects;
drop table companyProjects;