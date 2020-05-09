-- SQL HOMEWORK --
-- CREATE TABLE & IMPORT DATA
-- EMPLOYEE TABLE--
CREATE TABLE employee(
emp_no INTEGER NOT NULL PRIMARY KEY,
emp_title_id VARCHAR NOT NULL,
birth_date VARCHAR NOT NULL,
first_name VARCHAR NOT NULL,
last_name VARCHAR NOT NULL,
sex VARCHAR NOT NULL,
hire_date DATE NOT NULL
)
-- DEPARTMENTS TABLE--
CREATE TABLE departments(
	dept_no VARCHAR NOT NULL PRIMARY KEY,
	dept_name VARCHAR NOT NULL
);
SELECT * FROM departments;
-- DEPARTMENT EMPLOYEES--
CREATE TABLE dept_employees(
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR NOT NULL
)
SELECT * FROM dept_employees;
--TITLES--
CREATE TABLE titles(
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL
)
SELECT * FROM titles;
--DEPARTMENT MANAGER--
CREATE TABLE deptmgr(
	dept_no VARCHAR NOT NULL ,
	emp_no INTEGER NOT NULL
)
SELECT * FROM deptmgr
-- SALARIES --
CREATE TABLE salaries(
	emp_no INTEGER NOT NULL ,
	salary INTEGER NOT NULL
)
SELECT * FROM salaries
--1.List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT salaries.emp_no,last_name,first_name, sex, salary
FROM salaries 
LEFT JOIN employee
ON(salaries.emp_no = employee.emp_no);
--2.List first name, last name, and hire date for employees who were hired in 1986--
SELECT * FROM employee
SELECT first_name, last_name, hire_date
FROM employee
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';
--3.List the manager of each department with the following information:department number, department name, the manager's employee number, last name, first name.
SELECT dpmgr.dept_no,dep.dept_name,dpmgr.emp_no,em.last_name,em.first_name
FROM deptmgr as dpmgr
LEFT JOIN departments as dep
ON(dpmgr.dept_no = dep.dept_no)
LEFT JOIN employee AS em
ON(dpmgr.emp_no= em.emp_no);
--4.List the department of each employee with the following information employee number, last name, first name, and department name.
select  de.emp_no,em.last_name,em.first_name,dep.dept_name
from departments dep
left join dept_employees de
on (dep.dept_no = de.dept_no)
left join employee em
on (de.emp_no = em.emp_no)
--5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM employee
where First_name = 'Hercules' and last_name LIKE 'B%'
--6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
select  de.emp_no,em.last_name,em.first_name,dep.dept_name
from departments dep
left join dept_employees de
on (dep.dept_no = de.dept_no)
left join employee em
on (de.emp_no = em.emp_no)
where dept_name = 'Sales'
--7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select  de.emp_no,em.last_name,em.first_name,dep.dept_name
from departments dep
left join dept_employees de
on (dep.dept_no = de.dept_no)
left join employee em
on (de.emp_no = em.emp_no)
where dept_name = 'Sales' or  dept_name = 'Development'

--8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name
SELECT em.last_name, COUNT(last_name) 
FROM employee as em
GROUP BY em.last_name 
order by em.last_name DESC


