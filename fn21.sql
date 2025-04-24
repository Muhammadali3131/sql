-- Active: 1745317106021@@127.0.0.1@3306@fn21
-- Active: 1745317047940@@127.0.0.1@3306@fn21
SHOW TABLES

USE fn21;

SHOW DATABASES

CREATE DATABASE IF NOT EXISTS fn2121;

DROP DATABASE fn2121

CREATE TABLE department (id INT(11), name VARCHAR(100))

SHOW TABLES

DESCRIBE department

INSERT INTO department (id, name) VALUES (1, "Dasturlash")

INSERT INTO department (name) VALUES ( "DIZAYN")

INSERT INTO department (id, name) VALUES ( null, "Sotuv")


INSERT INTO department ( name) VALUES ("Sotuv"), ("Dasturlash"), ("Dizayn")

INSERT INTO department (id) VALUES ( 10)


SELECT * FROM department

DROP TABLE department

CREATE TABLE department (
  id INT(11) UNSIGNED AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY(id)
)

DELETE FROM department

TRUNCATE department

CREATE TABLE IF NOT EXISTS old_workers
(
  id INT(11) AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  role VARCHAR(50),
  old_salary DECIMAL(15, 2),
  birthday DATE,
  PRIMARY KEY (id)
)

INSERT INTO workers (name, role, salary, birthday)
VALUES
("Malik", "Dasturchi", 2000, "2000-03-05"),
("Sabriddin", "Dizayner", 1000, "1995-05-15"),
("Kamol", "Dasturchi", 1500, "2002-10-14"),
("Zafar", "HR", 800, "2005-03-12"),
("Qodir", "Sotuv", 500, "2004-11-22")


SELECT * FROM workers

SELECT name as ism, role from workers

SELECT name , role, (salary*1.1) as new_salary from workers

SELECT name , role, (salary*1.1) as new_salary from workers WHERE role="Dasturchi"

SELECT name , role, (salary*1.1) as new_salary from workers WHERE name like "m%"

SELECT id, name , role from workers WHERE id IN (1, 3)

SELECT id, name , role, salary from workers WHERE salary>500 AND salary<1600

SELECT id, name , role, salary, birthday
from workers
WHERE birthday BETWEEN '2000-01-01' AND '2004-01-01'


SELECT id, name , role from workers WHERE name like "K_m_l"

SELECT * FROM  workers ORDER BY salary ASC

SELECT * FROM  workers ORDER BY role, salary DESC


SELECT * FROM  workers LIMIT 2

SELECT * FROM  workers LIMIT 2 OFFSET 2


LIMIT N OFFSET (PAGE-1)*N
LIMIT 10 OFFSET (5-1)*10

SELECT COUNT(*) FROM  workers

SELECT MIN(salary) FROM  workers

SELECT MAX(salary) FROM  workers

SELECT AVG(salary) FROM  workers

SELECT SUM(salary) FROM  workers

SELECT CONCAT('Ismi: ', name, '; Lavozimi: ', role) as desciption FROM `workers`

SELECT REPLACE(REPLACE(name, ' ', ''), '*', '') as new_name FROM `workers`

SHOW TABLES

SELECT * FROM old_workers

SELECT id, name, salary FROM workers WHERE salary > 500
UNION ALL
SELECT id, name, old_salary FROM old_workers WHERE old_salary > 1000
ORDER BY salary

SHOW TABLES

SELECT * FROM department


CREATE TABLE IF NOT EXISTS employers
(
  id INT(11) AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  role VARCHAR(50),
  salary DECIMAL(15, 2),
  birthday DATE,
  department_id INT UNSIGNED DEFAULT 3,
  PRIMARY KEY (id),
  Foreign Key (department_id) REFERENCES department (id)
  ON DELETE SET DEFAULT ON UPDATE SET DEFAULT
)

INSERT INTO employers (name, department_id, salary, birthday)
VALUES
("Malik", 1, 2000, "2000-03-05"),
("Kamol", 1, 1500, "2002-10-14"),
("Zafar", 3, 800, "2005-03-12"),
("Qodir", 3, 500, "2004-11-22")

DESCRIBE department

DROP TABLE employers

SELECT * FROM employers

DESCRIBE employers

INSERT INTO employers (name, department_id, salary, birthday)
VALUES
("Malik", 4865, 2000, "2000-03-05")

DELETE FROM department WHERE id = 3


DESCRIBE workers

ALTER TABLE workers ADD COLUMN email VARCHAR(50) FIRST

ALTER TABLE workers MODIFY email TEXT

ALTER TABLE workers CHANGE email phone VARCHAR(15)

ALTER TABLE workers DROP COLUMN phone

SELECT DISTINCT salary FROM workers

SELECT role, AVG(salary) as avg_salary FROM workers GROUP BY role

SELECT role, MAX(salary) as avg_salary FROM workers GROUP BY role

SELECT role, COUNT(role) as role_workers_count
FROM workers GROUP BY role

SELECT role, SUM(salary) as summa
FROM workers
WHERE salary < 1100
GROUP BY role

SELECT role, SUM(salary) as summa
FROM workers
GROUP BY role
HAVING summa < 2100

SELECT employers.id, department.name, salary FROM employers, department

SELECT e.id, d.name, salary FROM employers e, department d

SELECT * FROM employers JOIN department

SELECT * FROM employers CROSS JOIN department

SELECT * FROM employers
INNER JOIN department
ON department.id = employers.department_id

SELECT * FROM employers e
INNER JOIN department d
ON d.id = e.department_id

SELECT * FROM employers e
RIGHT JOIN department d
ON d.id = e.department_id

SELECT * FROM department d
LEFT JOIN employers e
ON d.id = e.department_id

CREATE TABLE IF NOT EXISTS projects
(
  id INT(11) PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  project_client VARCHAR(50)
)

INSERT INTO projects (name, project_client)
VALUES ("MedCrm", "Kamina"),
("GreenGo", "Abdullayev A"),
("ToshBus", "Zafarov B"),
("ShineGo", "Botirov D")

CREATE TABLE IF NOT EXISTS project_workers
(
  worker_id INT(11),
  project_id INT(11),
  Foreign Key (worker_id) REFERENCES workers(id),
  Foreign Key (project_id) REFERENCES projects(id)
)

INSERT INTO project_workers (project_id, worker_id)
VALUES (1, 1),
(1, 2),
(2, 3),
(2, 5),
(3, 4),
(4, 6),
(4, 7)

SELECT * FROM project_workers

SELECT w.name, p.name FROM workers w
RIGHT JOIN project_workers pw ON w.id = pw.worker_id
RIGHT JOIN projects p ON pw.project_id = p.id
WHERE w.name LIKE '%l%'



//------------------------------ Vazifa --------------------------------------------------------



CREATE DATABASE IF NOT EXISTS university;
USE university;

CREATE TABLE IF NOT EXISTS department2 (
  id INT(11) PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL
);

INSERT INTO department2 (name) VALUES
("Informatika"),
("Matematika")

CREATE TABLE IF NOT EXISTS city (
  id INT(11) PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL
);

INSERT INTO city (name) VALUES
("Toshkent"),
("Andijon"),
("Farg'ona"),
("Namangan"),
("Buxoro"),
("Samarqand"),
("Xorazm"),
("Jizzax"),
("Sirdaryo"),
("Qashqadaryo"),
("Surxandaryo"),
("Navoiy"),
("Qoraqalpog'iston")

CREATE TABLE IF NOT EXISTS course_group (
  id INT(11) PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  department2_id INT,
  FOREIGN KEY (department2_id) REFERENCES department2(id) ON DELETE CASCADE
);

INSERT INTO course_group (name, department2_id) VALUES
("Web Dasturlash", 1),
("Mobil Dasturlash", 2),
("Tizim administratori", 1)

CREATE TABLE IF NOT EXISTS student (
  id INT(11) PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  city_id INT,
  course_group_id INT,
  FOREIGN KEY (city_id) REFERENCES city(id) ON DELETE CASCADE,
  FOREIGN KEY (course_group_id) REFERENCES course_group(id) ON DELETE CASCADE
);

INSERT INTO student (name, city_id, course_group_id) VALUES
("Anvar", 1, 3),
("Ali", 2, 1),
("Shodibek", 6, 2),
("Xursand", 5, 3),
("Dilshod", 8, 2),
("Abdulloh", 5, 2),
("Tohir", 3, 3),
("Murod", 6, 1),
("Said", 13, 2),
("Diyor", 9, 2)

SELECT student.id, student.name, city.name AS city,
       course_group.name AS course_group_name, department2.name AS department2_name
FROM student
INNER JOIN city ON student.city_id = city.id
INNER JOIN course_group ON student.course_group_id = course_group.id
INNER JOIN department2 ON course_group.department2_id = department2.id
WHERE student.name LIKE 'A%';

SELECT student.id, student.name, city.name AS city,
       course_group.name AS course_group_name, department2.name AS faculty_name
FROM student
INNER JOIN city ON student.city_id = city.id
INNER JOIN course_group ON student.course_group_id = course_group.id
INNER JOIN department2 ON course_group.department2_id = department2.id
WHERE city.name = 'Samarqand' AND department2.name = 'Informatika';