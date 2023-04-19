use osmos

/*1-Escribe un query para extraer los nombres, departamentos y salarios de todos los empleados.*/
SELECT first_name, last_name, department, salary
FROM employees
JOIN positions ON employees.position_id = positions.position_id;

/*2-Escribe un query para obtener los nombres y títulos (posiciones) de todos los empleados que son managers (es decir, que tienen al menos un reporte directo a su cargo).*/
SELECT first_name, last_name, title
FROM employees 
JOIN positions ON employees.position_id = positions.position_id
WHERE employee_id IN (
  SELECT DISTINCT manager_id
  FROM employees
);

/*3-Escribe un query para actualizar el salario de todos los empleados en el departamento 'Sales' a $50,000.*/
SELECT position_id
FROM employees
WHERE department = 'Sales'

UPDATE positions
SET salary = 50000.00
WHERE position_id = 3;

SELECT position_id, title, salary
FROM positions

/*4-Escribe un query para borrar todos los empleados en el departamento 'HR'.*/
DELETE FROM employees WHERE department = 'HR';

/*5-Escribe un query para obtener los nombres y departamentos de todos los empleados que no son managers (es decir, que no tienen reportes directos a su cargo).*/
SELECT first_name, last_name, title
FROM employees 
JOIN positions ON employees.position_id = positions.position_id
WHERE employee_id NOT IN (
  SELECT DISTINCT manager_id
  FROM employees
);

/*6-Escribe un query para obtener los nombres y títulos (posiciones) de todos los empleados que le reportan directamente al CEO.*/
SELECT e.first_name, e.last_name, p.title
FROM employees e
JOIN positions p ON e.position_id = p.position_id
WHERE e.manager_id = (SELECT employee_id FROM employees WHERE first_name = 'Bob' AND last_name = 'Smith');

/*7-Escribe un query para obtener los nombres de los empleados en el departamento de ‘Marketing’, junto con los nombres y títulos (posiciones) de sus managers.*/
SELECT e.first_name, e.last_name, p.title, m.first_name AS manager_first_name, m.last_name AS manager_last_name, mp.title AS manager_title
FROM employees e
JOIN positions p ON e.position_id = p.position_id
JOIN employees m ON e.manager_id = m.employee_id
JOIN positions mp ON m.position_id = mp.position_id
WHERE e.department = 'Marketing';

/*8-Escribe un query para actualizar el departamento de todos los empleados con un salario mayor a $75,000 a ‘Executive’.*/

SELECT title,salary,department
FROM employees
JOIN positions ON employees.position_id = positions.position_id
WHERE salary > 75000;


UPDATE employees
SET department = 'Executive'
WHERE department IN (
    SELECT department 
    FROM employees
    JOIN positions ON employees.position_id = positions.position_id
    WHERE salary > 75000.00
);

/*9-Escribe un query para borrar a todos los empleados que no son managers y tienen un salario menor a $50,000.*/
DELETE FROM employees
WHERE employee_id NOT IN (SELECT DISTINCT manager_id FROM employees) AND salary < 50000;

/*10-Escribe un query para obtener los nombres y departamentos de todos los empleados que tienen al menos un reporte directo en el departamento ‘Engineering’.*/
SELECT e.first_name, e.last_name, e.department
FROM employees e
WHERE e.manager_id IN (SELECT employee_id FROM employees WHERE department = 'Engineering');
