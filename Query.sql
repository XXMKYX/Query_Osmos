use osmos

/*Escribe un query para extraer los nombres, departamentos y salarios de todos los empleados.*/
SELECT first_name, last_name, department, salary
FROM employees
JOIN positions ON employees.position_id = positions.position_id;
