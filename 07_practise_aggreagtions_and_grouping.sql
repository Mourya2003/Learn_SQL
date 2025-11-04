USE company_db;

SHOW tables;
DESCRIBE employees;
SELECT * FROM employees;

-- 📘 Step 3: Aggregations & Grouping — Practice Questions:
-- 🔹 Level 1 – Basic Aggregations

-- Find the total number of employees in the company.
SELECT count(*) AS total
from employees;

-- Find the total salary paid to all employees.
SELECT sum(salary) as total
FROM employees;

-- Find the average salary of employees.
SELECT avg(salary) as avg
FROM employees;

-- Find the minimum and maximum salary in the company.
SELECT min(salary) as min,max(salary) as max
FROM employees;

-- Find the average age of employees.
SELECT avg(age) as avg_age
FROM employees;

-- 🔹 Level 2 – Grouped Aggregations

-- Find the number of employees in each department.
SELECT dept_name,count(*) as Total
FROM employees
GROUP BY dept_name;

-- Find the total salary per department.
SELECT dept_name,sum(salary) as Total
FROM employees
GROUP BY dept_name;

-- Find the average salary per department.
SELECT dept_name,avg(salary) as avg_salary
FROM employees
GROUP BY dept_name;

-- Find the number of employees per city.
SELECT city,count(*) as total
FROM employees
GROUP BY city;

-- Find the highest salary in each department.
SELECT dept_name,max(salary) as highest_salary
FROM employees
GROUP BY dept_name;

-- 🔹 Level 3 – Filtering with HAVING

-- Show departments that have more than 2 employees.
SELECT dept_name
FROM employees
GROUP BY dept_name
HAVING count(*)>2;

-- Show departments where the average salary is above 60,000.
SELECT dept_name
FROM employees
GROUP BY dept_name
HAVING avg(salary)>60000;

-- Show cities where the total salary paid is more than 1,00,000.
SELECT city
FROM employees
GROUP BY city
HAVING sum(salary)>100000;

-- Show departments that have at least one inactive employee.
SELECT dept_name
FROM employees
GROUP BY dept_name
HAVING sum(CASE WHEN active=0 THEN 1 ELSE 0 END)>=1; 
--  or we can use sum(NOT active)>=1
--  or we can use count(CASE WHEN active=0 THEN 1 ELSE NULL END)>=1

-- Show departments where the maximum salary exceeds 80,000.
SELECT dept_name
FROM employees
GROUP BY dept_name
HAVING max(salary)>80000;

-- 🔹 Level 4 – Conditional Aggregation (Advanced)

-- Show the count of active and inactive employees per department.
SELECT dept_name,sum(NOT active) as inactive,sum(active) as active
FROM employees
GROUP BY dept_name;

-- Find the total salary of active employees per department.
SELECT dept_name,sum(salary) as total
FROM employees
WHERE active=TRUE
GROUP BY dept_name

-- Show the average salary of employees aged below 30, grouped by department.
SELECT dept_name,avg(salary) as avg
FROM employees
WHERE age<30
GROUP BY dept_name

-- For each department, count how many employees have salary > 60,000.
SELECT dept_name,count(CASE WHEN salary>60000 then 1 ELSE NULL END) as total
FROM employees
GROUP BY dept_name;

-- Show departments with more than 1 active and more than 1 inactive employee.
SELECT dept_name
FROM employees
GROUP BY dept_name
HAVING sum(active)>1 and sum(not active)>1;