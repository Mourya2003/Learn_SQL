-- ✅ Switch to the working database
USE learn_sql;

-- 🧾 Show all tables present in the current database
SHOW TABLES;

-- 📋 View all records in the 'employees' table
SELECT * FROM employees;

-- 📋 View all records in the 'departments' table
SELECT * FROM departments;

-- 📈 Sort employees by salary in ascending order (lowest → highest)
SELECT * FROM employees ORDER BY salary;

-- 📉 Sort employees by salary in descending order (highest → lowest)
SELECT * FROM employees ORDER BY salary DESC;

-- 🧩 Sorting by multiple columns:
-- 1️⃣ Sorted by dept_id first
-- 2️⃣ Within each department, sorted by salary (ascending by default)
-- Equivalent to: ORDER BY dept_id ASC, salary ASC
-- Uncomment below to test:
SELECT * FROM employees ORDER BY dept_id, salary;

-- 🔁 Show distinct (unique) values of 'active' status column
SELECT DISTINCT active FROM employees;

-- 🎯 Filter records based on conditions using WHERE clause

-- Employees with salary >= 50,000 AND active = TRUE (1)
SELECT * FROM employees WHERE salary >= 50000 AND active = 1;

-- Employees with salary between 40,000 and 50,000 (inclusive)
SELECT * FROM employees WHERE salary BETWEEN 40000 AND 50000;

-- Employees whose emp_id is either 100 or 102 (set-based filtering)
SELECT * FROM employees WHERE emp_id IN (100, 102);

-- ⛳ Limit result set to top 2 highest-salaried employees
-- (First sorted by salary in descending order, then returns only first 2 rows)
SELECT * FROM employees ORDER BY salary DESC LIMIT 2;



-- Like and % , _ (under score) - search for patterns in text columns.

-- Starts with “M”	'M%'
SELECT * 
FROM employees
WHERE emp_name LIKE 'M%';

-- Ends with “a”	'%a'
SELECT * 
FROM employees
WHERE emp_name LIKE '%a';

-- Contains “an” anywhere	'%an%'
SELECT * 
FROM employees
WHERE emp_name LIKE '%mi%';

-- Second letter is “o”	'_o%'
SELECT * 
FROM employees
WHERE emp_name LIKE '_n%';

-- Exactly 4 letters	'____' (4 underscores)
SELECT * 
FROM employees
WHERE emp_name LIKE '_____';


-- | Keyword      | Meaning                                            |
-- | ------------ | -------------------------------------------------- |
-- | **LIMIT n**  | How many rows you want to fetch                    |
-- | **OFFSET m** | How many rows to **skip** before starting to fetch |

-- Nth highest salary perseon
-- N = 4
SELECT *
FROM employees
ORDER BY salary DESC
limit 1
offset 3;