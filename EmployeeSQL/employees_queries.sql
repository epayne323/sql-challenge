-- 1. List the following details of each employee: employee number, last name, 
-- first name, gender, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees e
INNER JOIN salaries s ON e.emp_no = s.emp_no;

-- 2. List employees who were hired in 1986.
SELECT e.emp_no, e.hire_date 
FROM employees e
WHERE EXTRACT(YEAR FROM e.hire_date) = '1986';

-- 3. List the manager of each department with the following information: department 
-- number, department name, the manager's employee number, last name, first name, and 
-- start and end employment dates.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, de.from_date, de.to_date
FROM dept_manager dm
INNER JOIN departments d ON dm.dept_no = d.dept_no
INNER JOIN employees e ON dm.emp_no = e.emp_no
INNER JOIN dept_emp de ON dm.emp_no = de.emp_no;

-- 4. List the department of each employee with the following information: employee 
-- number, last name, first name, and department name.
--QUESTION: only include only one entry for each emp_no, or every department where they've worked?
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT e.last_name, e.first_name
FROM employees e
WHERE LEFT(e.last_name, 1) = 'B' AND first_name = 'Hercules';

-- 6. List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE (d.dept_name = 'Sales' OR d.dept_name = 'Development');

-- 8. In descending order, list the frequency count of employee last names, i.e., 
-- how many employees share each last name.
SELECT last_name, COUNT(last_name) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;
