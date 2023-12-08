-- Entity Relationship Diagram found at https://app.quickdatabasediagrams.com/#/d/1vF6xr
-- Query 1: List the employee number, last name, first name, sex, and salary of each employee 
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary 
FROM employees AS emp
JOIN salaries AS sal
ON (emp.emp_no = sal.emp_no);

-- Query 2: List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- Query 3: List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT dm.dept_no, dm.emp_no, d.dept_name, e.last_name, e.first_name
FROM dept_manager AS dm
	JOIN departments AS d
		ON (dm.dept_no = d.dep_no)
	JOIN employees AS e
		ON (dm.emp_no = e.emp_no)
;
		
-- Query 4: List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT em.emp_no, em.first_name, em.last_name, d.dept_name, d.dep_no
FROM employees AS em
	JOIN dept_emp AS de
		ON (em.emp_no = de.emp_no)
	JOIN departments AS d
		ON (de.dept_no = d.dep_no);
		
-- Query 5: List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex
FROM employees
WHERE last_name LIKE 'B%' AND first_name = 'Hercules';

-- Query 6: List each employee in the Sales department, including their employee number, last name, and first name.
SELECT em.emp_no, em.first_name, em.last_name, dep.dept_name
FROM employees AS em
	JOIN dept_emp AS de
		ON (de.emp_no = em.emp_no)
	JOIN departments AS dep
		ON (dep.dep_no = de.dept_no)
	WHERE dept_name = 'Sales';

-- Query 7: List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT em.emp_no, em.first_name, em.last_name, dep.dept_name
FROM employees AS em
	JOIN dept_emp AS de
		ON (de.emp_no = em.emp_no)
	JOIN departments AS dep
		ON (dep.dep_no = de.dept_no)
	WHERE dep.dept_name IN ('Development', 'Sales');

-- Query 8: List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;