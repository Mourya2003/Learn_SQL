USE company_db;

SHOW tables;
DESCRIBE employees;
SELECT * FROM employees;

-- Aggregations & Grouping

-- aggreat functins:
-- Total number of employees
SELECT COUNT(*) AS total_employees
FROM employees;

-- Total salary of all employees
SELECT SUM(salary) AS total_salary
FROM employees;

-- Average salary across the company
SELECT AVG(salary) AS avg_salary
FROM employees;

-- Minimum and maximum salaries
SELECT MIN(salary) AS min_salary, MAX(salary) AS max_salary
FROM employees;

-- 🔹 2️⃣ GROUP BY — Aggregate Within Groups
-- 🧠 Concept:
-- "GROUP BY" groups rows that have the same value in one or more columns,
-- then applies aggregate functions (COUNT, SUM, AVG, etc.) to each group.

-- ⚙️ Key Notes:
-- Every column in the SELECT that is not aggregated must appear in the GROUP BY.
-- ❌ Wrong:
-- SELECT dept_name, salary FROM employees GROUP BY dept_name;
-- ✅ Correct:
-- SELECT dept_name, MAX(salary) FROM employees GROUP BY dept_name;
-- GROUP BY always executes before the aggregate function is calculated.

-- 1️⃣ Count of employees per department
SELECT dept_name, COUNT(*) AS emp_count
FROM employees
GROUP BY dept_name;

-- 2️⃣ Total salary paid per department
SELECT dept_name,sum(salary) as salary_per_dept
from employees
GROUP BY dept_name;

-- 3️⃣ Average salary per department
SELECT dept_name,AVG(salary) as avg_salary
from employees
GROUP BY dept_name;

-- 4️⃣ Count of employees per city
SELECT city,count(*) as count
from employees
GROUP BY city;

-- 5️⃣ Minimum and maximum salary per department
SELECT dept_name,min(salary) AS min_salary,max(salary) AS max_salary
FROM employees
GROUP BY dept_name;

-- 🔹 3️⃣ HAVING — Filtering After Grouping
-- 🧠 Concept:

-- WHERE filters before grouping (on individual rows).

-- HAVING filters after grouping (on aggregated results).

-- Think of it like this:
-- 👉 WHERE = filter raw rows
-- 👉 HAVING = filter summarized data

-- 1️⃣ Show departments with more than 2 employees
SELECT dept_name, COUNT(*) AS emp_count
FROM employees
GROUP BY dept_name
HAVING emp_count > 2;

-- 2️⃣ Show departments with average salary above 60,000
SELECT dept_name, AVG(salary) AS avg_salary
FROM employees
GROUP BY dept_name
HAVING avg_salary>60000;

-- 3️⃣ Show cities where total salary is more than 100,000
SELECT city,sum(salary)
FROM employees
GROUP BY city
HAVING sum(salary)>100000;

-- 4️⃣ Show departments having at least one inactive employee
SELECT dept_name
FROM employees
GROUP BY dept_name
HAVING count(active=FALSE)>=1;
-- 🔹 1️⃣ COUNT(column) vs COUNT(expression)
-- In SQL:
-- COUNT(column) counts non-NULL values only.
-- COUNT(*) counts all rows.
-- When you write COUNT(active = FALSE),
-- → the expression active = FALSE returns TRUE (1) or FALSE (0) for each row.
-- → but since both 0 and 1 are non-NULL, they all get counted.
-- ✅ So it always counts every row, not just the false ones.

SELECT dept_name, COUNT(*) AS total_emp,
       SUM(CASE WHEN active = FALSE THEN 1 ELSE 0 END) AS inactive_count
FROM employees
GROUP BY dept_name
HAVING inactive_count >= 1;
