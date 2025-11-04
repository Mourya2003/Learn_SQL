CREATE DATABASE IF NOT EXISTS company_db;
USE company_db;

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    dept_name VARCHAR(50),
    salary DECIMAL(8,2),
    age INT,
    city VARCHAR(50),
    active BOOLEAN
);

INSERT INTO Employees VALUES
(101, 'Mourya', 'Engineering', 72000, 23, 'Hyderabad', TRUE),
(102, 'Amit', 'HR', 45000, 28, 'Delhi', TRUE),
(103, 'Sneha', 'Finance', 82000, 26, 'Bangalore', TRUE),
(104, 'Karan', 'Engineering', 90000, 32, 'Hyderabad', TRUE),
(105, 'Ravi', 'Finance', 40000, 24, 'Mumbai', FALSE),
(106, 'Pooja', 'HR', 55000, 30, 'Pune', TRUE),
(107, 'Ankit', 'Engineering', 30000, 22, 'Chennai', FALSE),
(108, 'Meera', 'Finance', 67000, 29, 'Hyderabad', TRUE),
(109, 'Raj', 'Engineering', 60000, 27, 'Delhi', TRUE),
(110, 'Nina', 'HR', 51000, 25, 'Bangalore', FALSE);

SELECT *
FROM employees;
-- Questions:

-- Show all employee names and their department names.
SELECT emp_name,dept_name 
FROM Employees;

-- Show names and salaries of employees who are active.
SELECT emp_name,salary
FROM Employees
WHERE active=TRUE;


-- Display details of employees who work in ‘HR’ department.
SELECT *
FROM Employees
WHERE dept_name='HR';


-- Find all employees older than 25.
SELECT *
FROM Employees
WHERE age>25;

-- Show employee names who live in Hyderabad.
SELECT *
FROM employees
WHERE city='Hyderabad';

-- Find employees whose salary is between 50,000 and 80,000.
SELECT *
FROM employees
WHERE salary BETWEEN 50000 AND 80000;

-- Show employees whose department is either HR or Finance.
SELECT *
FROM employees
WHERE dept_name='HR' OR dept_name='Finance';

-- List employees whose name starts with 'M'.    IMP
SELECT *
FROM employees
WHERE emp_name LIKE 'M%';


-- List employees whose name ends with 'a'.
SELECT *
FROM employees
WHERE emp_name LIKE '%a';


-- Show all employees who are not active.
SELECT *
FROM employees
WHERE active=FALSE;

-- 🔹 Level 3 — Sorting and Distinct

-- Display all employees sorted by salary (ascending).
SELECT *
FROM employees 
ORDER BY salary;

-- Display all employees sorted by department (asc) and salary (desc).
SELECT *
FROM employees
ORDER BY dept_name ASC,salary DESC;

-- Show all unique department names.
SELECT DISTINCT dept_name
FROM employees;

-- Find the top 3 highest-paid employees.
SELECT *
FROM employees
ORDER BY salary DESC
limit 3;

-- Nth highest salary perseon
-- N = 4
SELECT *
FROM employees
ORDER BY salary DESC
limit 1
offset 3;

-- Find the lowest 2 salaries in the company.
SELECT *
FROM employees
ORDER BY salary
limit 2;


-- 🔹 Level 4 — Logical Combinations

-- Find employees who are in Engineering AND active.
SELECT *
FROM employees
WHERE dept_name='Engineering' AND active=TRUE;

-- Find employees who are not in HR AND salary > 60000.
SELECT *
FROM employees
WHERE dept_name!='HR' AND salary>60000;

-- Find employees in Hyderabad OR Bangalore cities.
SELECT *
FROM employees
WHERE city='Hyderabad' or city='Bangalore';

-- Find employees with age < 25 OR salary > 80000.
SELECT *
FROM employees
WHERE age<25 or salary>80000;


-- Find employees whose name contains 'a' anywhere.
SELECT *
FROM employees
WHERE emp_name LIKE '%a%';




