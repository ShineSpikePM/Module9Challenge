DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS titles CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;

-- FIRST: Create the tables and relationships in the following order:

-- Create Titles table
create table titles (
	--both fields are VARCHARS
	title_id VARCHAR PRIMARY KEY NOT NULL,
	title VARCHAR NOT NULL
);
select * from titles;

-- Create Employees table
CREATE TABLE employees (
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	foreign key (emp_title_id) references titles (title_id)
);

select * from employees;

-- Create Departments table
create table departments (
	--both fields are VARCHARS
	dept_no VARCHAR primary key NOT NULL,
	dept_name VARCHAR NOT NULL
);
select * from departments;

-- Create Department Manager table
	--Foreign key that references emp_no from employees table
	--Foreign key that references dept_no from departments table
	--Primary Key is a composite of the dept_no and emp_no
create table dept_manager (
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	foreign key (dept_no) references departments (dept_no),
    foreign key (emp_no) references employees (emp_no),
	PRIMARY KEY (dept_no, emp_no)
);
select * from dept_manager;

-- Create Department Employee table
create table dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	--emp_no - Foreign key that references emp_no from employees table
	--dept_no - Foreign key that references dept_no from departments table
    foreign key (emp_no) references employees (emp_no),
    foreign key (dept_no) references departments (dept_no),
	-- Primary Key is a composite of the emp_no and dept_no
	PRIMARY KEY (emp_no, dept_no)
);

select * from dept_emp;

-- Create Salaries table
create table salaries (
	emp_no INT PRIMARY KEY NOT NULL,
	salary INT NOT NULL,
	--foreign key that references emp_no from the employees table
    foreign key (emp_no) references employees (emp_no)
);

select * from salaries;