-- Once all data has been loaded, write 1 additional script that answers the questions
	-- HINT FOR QUESTION #2:
	-- USE BETWEEN as a part of the WHERE Clause for the hire_date from the employees table
	-- SELECT stuff FROM employees WHERE hire_date BETWEEN 'yyyy-mm-dd' AND 'yyyy-mm-dd';

-- List the employee number, last name, first name, sex, and salary of each employee.
	-- Need to get this from employees and salaries, using emp_no as the join
SELECT s.emp_no, 
	e.last_name, 
	e.first_name, 
	e.sex, 
	s.salary
FROM employees AS e
INNER JOIN salaries AS s
ON s.emp_no = e.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
	-- Need to get this from employees and use WHERE and BETWEEN 1/1/1986 and 12/1/1986.
SELECT emp_no, 
	first_name, 
	last_name, 
	hire_date 
FROM employees 
WHERE hire_date 
BETWEEN '01-01-1986' AND '12-31-1986';

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
	-- Need to get this from dept_manager and departments with dept_no as the INNER JOIN.
SELECT dm.dept_no, 
	d.dept_name, 
	dm.emp_no, 
	e.last_name, 
	e.first_name
FROM dept_manager AS dm
INNER JOIN departments 
AS d ON dm.dept_no= d.dept_no
INNER JOIN employees 
AS e ON dm.emp_no = e.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
	-- Need to get this from employees, dept_emp, and departments with emp_no as the INNER JOIN.
SELECT d.dept_no, 
	e.emp_no, 
	e.last_name,
	e.first_name,
	d.dept_name
FROM employees AS e
LEFT JOIN dept_emp
AS de ON e.emp_no= de.emp_no
INNER JOIN departments
AS d ON de.dept_no= d.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
	-- Need to get this from employees and use WHERE first name 'HERCULES' and last_name LIKE 'b'
	-- LIKE IS THE % IN 'b' for it to look for similar characters
SELECT e.last_name, 
	e.first_name, 
	e.sex
FROM employees AS e
WHERE (e.first_name = 'Hercules') 
AND (e.last_name) LIKE 'B%'
ORDER BY e.last_name;

-- List each employee in the Sales department, including their employee number, last name, and first name.
	-- Need to get this from employees and dept_emp using emp_no as the INNER JOIN.
	-- Then I need to search WHERE dept_name = 'sales'
SELECT e.emp_no, 
	e.last_name, 
	e.first_name, 
	d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS d_e
ON e.emp_no = d_e.emp_no
INNER JOIN departments AS d
ON d_e.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
	-- Need tp get this from employees, dept_emp, and department with emp_no as the INNER JOIN.
	-- Then i need to search WHERE dept_name = 'sales' OR dept_name = 'development'
SELECT e.emp_no, 
	e.last_name, 
	e.first_name, 
	d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS d_e
ON e.emp_no = d_e.emp_no
INNER JOIN departments AS d
ON d_e.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
	-- Need to get this from employees and do a GROUP BY last_name,
	-- and do a COUNT by last_name frequency and ORDER BY frequency using DESC.
SELECT last_name,COUNT(last_name) AS frequency 
FROM employees 
GROUP BY last_name
ORDER BY frequency DESC;