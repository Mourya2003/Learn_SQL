-- 📘 Chapter: Data Types  
-- Focus: Demonstrating common SQL data types and their practical usage.

-- ✅ Switch to working database
USE learn_sql;

-- 🧱 Table creation showing different data types
CREATE TABLE Employee (
    emp_id INT,                 -- Integer: for numeric IDs (whole numbers only)
    full_name VARCHAR(50),      -- VARCHAR: variable-length string for names (saves space)
    dept CHAR(3),               -- CHAR: fixed-length 3 characters (ideal for short codes like 'HR', 'IT')
    age INT,                    -- Integer: whole number for age
    salary DECIMAL(10,5)        -- DECIMAL: fixed precision for exact monetary values (10 total digits, 5 after decimal)
);

-- ➕ Insert sample data to visualize type usage and storage behavior
INSERT INTO Employee
VALUES
(1, 'John Smith', 'SAL', 35, 45000.00),
(2, 'Mary Johnson', 'HR', 28, 38000.00),
(3, 'Bob Wilson', 'IT', 42, 52000.00);

-- 📋 View all records inserted to verify data and formatting
SELECT * FROM Employee;

-- ⚠️ TRUNCATE clears all rows but retains the table structure (used for cleanup/testing)
TRUNCATE TABLE employee;
