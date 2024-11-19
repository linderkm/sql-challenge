-- 1. List the employee number, last name, first name, sex, and salary of each employee.
-- (2)
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries ON salaries.emp_no=employees.emp_no;


-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
-- (3)
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '__/__/1986%';


-- 3. List the manager of each department along with:
-- their department number, department name, employee number, last name, and first name
--(2)
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name,employees.first_name
FROM dept_manager
JOIN departments ON departments.dept_no = dept_manager.dept_no
JOIN employees ON employees.emp_no = dept_manager.emp_no;


--4. List the department number for each employee along with:
--that employee’s employee number, last name, first name, and department name
--(2)
SELECT de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN employees e ON e.emp_no = de.emp_no
JOIN departments d ON d.dept_no = de.dept_no;


-- 5. List first name, last name, and sex of each employee whose first name is
-- Hercules and whose last name begins with the letter B.
-- (3)
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B__%';


--6. List each employee in the Sales department, including their employee number, last name, and first name
-- (4)
SELECT emp_no, last_name, first_name
FROM employees
Where emp_no IN
	(
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN
		(
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales'
		)
	);


-- 7. List each employee in the Sales and Development departments, including:
--their employee number, last name, first name, and department name
-- (5)
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
LEFT JOIN dept_emp de ON e.emp_no = De.emp_no
LEFT JOIN departments d ON dE.dept_no = d.dept_no
Where d.dept_name = 'Sales'

UNION

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
LEFT JOIN dept_emp de ON e.emp_no = De.emp_no
LEFT JOIN departments d ON dE.dept_no = d.dept_no
Where d.dept_name = 'Development'


-- 8. List the frequency counts, in descending order:
-- all the employee last names (that is, how many employees share each last name).
-- (6)
SELECT last_name, COUNT(last_name) as name_count
FROM employees
GROUP BY last_name
ORDER BY name_count desc;
