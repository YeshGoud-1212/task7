-- Create a base table
CREATE TABLE Employees (
    id INTEGER PRIMARY KEY,
    name TEXT,
    department TEXT,
    salary INTEGER,
    age INTEGER
);

-- Insert dummy data
INSERT INTO Employees (id, name, department, salary, age) VALUES
(1, 'Alice', 'HR', 50000, 28),
(2, 'Bob', 'IT', 70000, 32),
(3, 'Charlie', 'Finance', 65000, 29),
(4, 'David', 'IT', 72000, 35),
(5, 'Eve', 'HR', 48000, 26);

-- 1. Create a View: IT Department Employees
CREATE VIEW IT_Employees AS
SELECT name, salary
FROM Employees
WHERE department = 'IT';

-- 2. Create a View: High earners
CREATE VIEW High_Salary_Employees AS
SELECT name, department, salary
FROM Employees
WHERE salary > 60000;

-- 3. Create a View with aggregation
CREATE VIEW Avg_Salary_By_Dept AS
SELECT department, AVG(salary) AS avg_salary
FROM Employees
GROUP BY department;

-- 4. Update through a view (allowed if conditions are met)
UPDATE IT_Employees SET salary = salary + 5000 WHERE name = 'Bob';

-- 5. Drop a view
DROP VIEW IF EXISTS IT_Employees;

-- 6. View with WITH CHECK OPTION
CREATE VIEW Young_Employees AS
SELECT * FROM Employees
WHERE age < 30
WITH CHECK OPTION;
