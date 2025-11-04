-- 📘 Chapter: Constraints  
-- Focus: Applying various SQL constraints to ensure data integrity and validity.

CREATE DATABASE IF NOT EXISTS learn_sql;
USE learn_sql;

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,               -- PRIMARY KEY: uniquely identifies each department
    dept_name VARCHAR(50) UNIQUE NOT NULL  -- UNIQUE: prevents duplicate names | NOT NULL: disallows empty values
);

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,                            -- PRIMARY KEY: ensures unique employee IDs
    emp_name VARCHAR(50) NOT NULL,                     -- NOT NULL: every employee must have a name
    email VARCHAR(100) UNIQUE,                         -- UNIQUE: no two employees can share the same email
    salary DECIMAL(8,2) CHECK (salary > 0),            -- CHECK: ensures salary is always positive
    dept_id INT,                                       -- Foreign key link to Departments table
    active BOOLEAN DEFAULT TRUE,                       -- DEFAULT: sets active status to TRUE by default
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)  -- FOREIGN KEY: enforces valid department reference
);

INSERT INTO Departments VALUES
(1, 'HR'),
(2, 'Engineering'),
(3, 'Finance');

INSERT INTO Employees VALUES
(101, 'Mourya', 'mourya@gmail.com', 55000, 2, TRUE),
(102, 'Amit', 'amit@gmail.com', 40000, 1, TRUE),
(103, 'Sneha', 'sneha@gmail.com', 70000, 3, TRUE);

SELECT * FROM Employees;
