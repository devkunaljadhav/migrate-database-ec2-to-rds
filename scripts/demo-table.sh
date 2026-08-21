Connect to local MySQL:
--------------
mysql -u root -p
Password: welcome123


CREATE DATABASE IF NOT EXISTS company_test_db;

USE company_test_db;

CREATE TABLE departments (
department_id INT AUTO_INCREMENT PRIMARY KEY,
department_name VARCHAR(50) NOT NULL UNIQUE,
location VARCHAR(50) DEFAULT 'Main Campus'	
);


CREATE TABLE employees (
employee_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(100) UNIQUE,
hire_date DATE NOT NULL,
salary DECIMAL(10, 2) NOT NULL,
is_active BOOLEAN DEFAULT TRUE,
department_id INT,
FOREIGN KEY (department_id)
REFERENCES departments(department_id)
ON DELETE SET NULL
);


INSERT INTO departments (department_name, location) VALUES
('Engineering', 'Building A'),
('Data Science', 'Building A'),
('Human Resources', 'Building B'),
('Marketing', 'Remote'),
('Finance', 'Building B');



INSERT INTO employees
(first_name, last_name, email, hire_date, salary, is_active, department_id)
VALUES
('Alice', 'Smith', 'alice.smith@example.com', '2022-03-15', 95000.00, TRUE, 1),
('Bob', 'Johnson', 'bob.johnson@example.com', '2021-06-20', 105000.00, TRUE, 1),
('Charlie', 'Brown', 'charlie.brown@example.com', '2023-01-10', 88000.00, TRUE, 2),
('Diana', 'Prince', 'diana.prince@example.com', '2020-11-05', 120000.00, TRUE, 2),
('Evan', 'Wright', 'evan.wright@example.com', '2019-05-12', 65000.00, TRUE, 3),
('Fiona', 'Gallagher', 'fiona.g@example.com', '2024-02-01', 55000.00, FALSE, 4),
('George', 'Miller', 'george.m@example.com', '2022-08-24', 72000.00, TRUE, 4),
('Hannah', 'Abbott', 'hannah.a@example.com', '2021-09-18', 85000.00, TRUE, 5),
('Ian', 'Malcolm', 'ian.m@example.com', '2023-07-19', 98000.00, TRUE, NULL);


SELECT e.employee_id, e.first_name, e.last_name,
d.department_name, e.salary
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;


SELECT d.department_name,
COUNT(e.employee_id) AS total_staff,
ROUND(AVG(e.salary), 2) AS avg_salary
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;

