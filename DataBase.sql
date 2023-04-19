CREATE DATABASE osmos
use osmos

CREATE TABLE positions (
 position_id INTEGER PRIMARY KEY,
 title VARCHAR(255),
 salary DECIMAL(10,2)
);

CREATE TABLE employees (
 employee_id INTEGER PRIMARY KEY,
 first_name VARCHAR(255),
 last_name VARCHAR(255),
 department VARCHAR(255),
 manager_id INTEGER,
 position_id INTEGER,
 FOREIGN KEY (position_id) REFERENCES positions(position_id)
);

INSERT INTO positions (position_id, title, salary)
VALUES
 (1, 'Marketing Assistant', 45000.00),
 (2, 'Marketing Manager', 75000.00),
 (3, 'Sales Assistant', 40000.00),
 (4, 'Sales Manager', 70000.00),
 (5, 'HR Assistant', 40000.00),
 (6, 'HR Manager', 70000.00),
 (7, 'Engineering Assistant', 50000.00),
 (8, 'Engineering Manager', 80000.00),
 (9, 'CEO', 100000.00);

 
INSERT INTO employees (employee_id, first_name, last_name, department, 
manager_id, position_id)
VALUES
 (1, 'John', 'Doe', 'Marketing', 3, 1),
 (2, 'Jane', 'Doe', 'Sales', 3, 3),
 (3, 'Bob', 'Smith', 'CEO', NULL, 9),
 (4, 'Alice', 'Jones', 'HR', 3, 6),
 (5, 'Mike', 'Wilson', 'Engineering', 4, 8),
 (6, 'Sara', 'Johnson', 'Marketing', 1, 1),
 (7, 'Chris', 'Williams', 'Sales', 2, 3),
 (8, 'Amanda', 'Brown', 'Engineering', 5, 7),
 (9, 'Tom', 'Davis', 'HR', 4, 5),
 (10, 'Emily', 'Miller', 'Marketing', 1, 1),
 (11, 'Andrew', 'Moore', 'Sales', 2, 3),
 (12, 'Emma', 'Taylor', 'Engineering', 5, 7),
 (13, 'Olivia', 'Thomas', 'HR', 4, 5),
 (14, 'Daniel', 'Jackson', 'Marketing', 1, 1),
 (15, 'William', 'White', 'Sales', 2, 3),
 (16, 'Ava', 'Harris', 'Engineering', 5, 7),
 (17, 'James', 'Martin', 'HR', 4, 5),
 (18, 'Abigail', 'Thompson', 'Marketing', 1, 1),
 (19, 'Oliver', 'Garcia', 'Sales', 2, 3),
 (20, 'Elizabeth', 'Martinez', 'Engineering', 5, 7)
