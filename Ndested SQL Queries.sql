CREATE DATABASE Nested;

USE Nested;


CREATE TABLE employee(
	emp_Id INT,
    emp_name VARCHAR(50),
    dept_ID INT,
    Salary int
);

SELECT * FROM employee;

CREATE TABLE departments(
	dept_id INT,
	dept_name VARCHAR(50)
);

SELECT * FROM departments;

INSERT INTO employee VALUES
(1,'Alice',10,50000),
(2,'Bob',20,60000),
(3,'Charlie',10,55000);

INSERT INTO departments VALUES
(10,'HR'),
(20,'Sales');

-- Find employees who work in HR
SELECT emp_name FROM employee
WHERE dept_id = (
SELECT dept_id FROM departments
WHERE dept_name = 'HR');

-- Find the average salary of each department then show only departments with average salary>55000
SELECT dept_id, AVG_salary FROM
(SELECT dept_id,AVG(salary) AS AVG_salary
FROM employee 
GROUP BY dept_id
) AS department_average
WHERE AVG_salary > 55000;

-- find employees who work in sales or HR
SELECT emp_name FROM employee
WHERE dept_id IN (
SELECT dept_id FROM departments
WHERE dept_name IN ('HR','Sales')
);

