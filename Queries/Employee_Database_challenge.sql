-- Create retirement_titles table
DROP TABLE retirement_titles;

SELECT employees.emp_no, employees.first_name, employees.last_name, titles.title, titles.from_date, titles.to_date
INTO retirement_titles
FROM employees 
LEFT OUTER JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;

SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
DROP TABLE unique_titles;

SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;

-- Get count of titles close to retirement
DROP TABLE retiring_titles;

SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

SELECT * FROM retiring_titles; 

-- Create mentorship_eligibility table
DROP TABLE mentorship_eligibility;

SELECT DISTINCT ON (employees.emp_no) employees.emp_no, employees.first_name, employees.last_name, employees.birth_date, 
    dept_employee.from_date, dept_employee.to_date, 
    titles.title
INTO mentorship_eligibility
FROM employees
LEFT OUTER JOIN dept_employee
ON employees.emp_no = dept_employee.emp_no
LEFT OUTER JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31') AND (dept_employee.to_date = '9999-01-01')
ORDER BY emp_no ASC;

SELECT * FROM mentorship_eligibility;

-- Find count of titles for all ages
DROP total_titles;

SELECT COUNT(title), title
INTO total_titles
FROM employees 
LEFT OUTER JOIN titles
ON employees.emp_no = titles.emp_no
GROUP BY title
ORDER BY count DESC;

SELECT * FROM total_titles;

-- Count mentorship_eligibility employees by title
DROP TABLE mentorship_titles;

SELECT COUNT(title), title
INTO mentorship_titles
FROM mentorship_eligibility
GROUP BY title
ORDER BY count DESC;

SELECT * FROM mentorship_titles;