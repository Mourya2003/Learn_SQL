-- 📘 Basic SQL Command Types Practice (DDL, DML, DCL, TCL)

-- ✅ Switch to the working database
USE learn_sql;

-- 🧾 Show all tables currently available in this database
SHOW TABLES;

-- =========================================================
-- 🔹 DDL (Data Definition Language)
-- Used to define or modify the structure of database objects
-- Commands: CREATE, ALTER, DROP, TRUNCATE, RENAME
-- =========================================================

-- 🏗️ Create a new table 'Students' with columns: id, name
CREATE TABLE Students (
    id INT PRIMARY KEY,         -- unique student ID (primary key)
    name VARCHAR(50)            -- variable-length student name
);

-- ➕ Add a new column 'gpa' to the Students table
ALTER TABLE Students
ADD COLUMN gpa DECIMAL(3, 2);   -- 3 digits total, 2 after decimal (e.g., 9.25)

-- ⚠️ Remove all rows from 'Students' (keeps structure, deletes data)
TRUNCATE TABLE Students;

-- =========================================================
-- 🔹 DML (Data Manipulation Language)
-- Used to add, update, or delete actual data inside tables
-- Commands: INSERT, UPDATE, DELETE
-- =========================================================

-- ➕ Insert a new record into Students
INSERT INTO Students VALUES (1, 'Mourya', 8.5);

-- 🔄 Update GPA of the student where id = 1
UPDATE Students SET gpa = 9.0 WHERE id = 1;

-- ❌ Delete the student record with id = 1
DELETE FROM Students WHERE id = 1;

-- =========================================================
-- 🔹 DCL (Data Control Language)
-- Used to control user access and permissions
-- Commands: GRANT, REVOKE
-- =========================================================

-- 🔐 Grant SELECT and INSERT privileges on 'Students' to user 'user1'
GRANT SELECT, INSERT ON Students TO 'user1'@'localhost';

-- 🚫 Revoke INSERT permission from the same user
REVOKE INSERT ON Students FROM 'user1'@'localhost';

-- =========================================================
-- 🔹 TCL (Transaction Control Language)
-- Used to manage transactions ensuring data consistency
-- Commands: COMMIT, ROLLBACK, SAVEPOINT
-- =========================================================

-- 🧾 Start a new transaction (all following DML statements are part of it)
START TRANSACTION;

-- ✏️ Example update inside a transaction
UPDATE Students SET gpa = 9.2 WHERE id = 1;

-- ⏪ Undo the last uncommitted change
ROLLBACK;  -- undoes the above update

-- 💾 Save all changes made since last commit
COMMIT;    -- permanently saves the transaction
