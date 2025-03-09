-- 1 НФ: в каждой ячейке сохраняется атомарное значение (без списков и тд.)
-- 2 НФ: 1 НФ + таблица должна иметь ключ; ключ функционально определяет всю строчку    
-- 3 НФ: 2 НФ + мы должны убрать транзитивные функциональные зависимости атрибутов

----------------------------------------------
DROP TABLE employees, positions, departments;
----------------------------------------------

CREATE TABLE employees(
    id serial PRIMARY KEY,
    name varchar(200),
    position varchar(200) REFERENCES positions(name)
);

CREATE TABLE positions (
    name varchar(300) PRIMARY KEY,
    department varchar(300) REFERENCES departments(name),
    car_aviability boolean
);

CREATE TABLE departments(
    name varchar(300) PRIMARY KEY,
    phone_number varchar(20)
);

----------------------------------------------

INSERT INTO departments VALUES
('TOP management', '11-11-11'),
('Operational direction', '22-22-22'),
('Financial direction', '33-33-33'),
('Develoers direction', '44-44-44');



---------------------------------------------


INSERT INTO positions (name,department,car_aviability) VALUES
('CFO','TOP management',true),
('CEO','TOP management' ,true),
('SMM/PR division','Operational direction', false),
('Accountant','Financial direction', false),
('JS developer','Develoers direction',false),
('Sales manager','Operational direction',false),
('Bodyguard for developers','Operational direction',true),
('Driver','Operational direction',true);


----------------------------------------------

INSERT INTO employees (name, position) VALUES
('John','JS developer'),
('Jane','Sales manager'),
('Jake','Bodyguard for developers'),
('Andrew','Driver'),
('Milena', 'CFO'),
('Sergey', 'CEO'),
('Matthew', 'SMM/PR division'),
('Timofey', 'Accountant');

---------------------------------------------- Достаем инфу про работника + дотсуптно/ не доступтно авто

SELECT employees.id, employees.name, employees.position, positions.car_aviability FROM 
employees JOIN positions
ON employees.position = positions.name;

---------------------------------------------- Дотсаем инфу про работника + номер телеофна отдела

SELECT e.id, e.name, e.position, p.car_aviability,d.phone_number AS "departmant phone number" FROM 
employees AS e JOIN positions AS p
ON e.position = p.name
JOIN departments as d
ON p.department = d.name;


----------------------------------------------


ALTER TABLE employees
DROP COLUMN department_phone;

ALTER TABLE employees
ADD FOREIGN KEY(department) REFERENCES departments(name);

INSERT INTO employees (name, department,department_phone) VALUES
('Milena', 'TOP management', '11-11-11'),
('Sergey', 'TOP management', '11-11-11'),
('Matthew','Operational direction', '22-22-22'),
('Timofey', 'Financial direction', '33-33-33'),
('John','Develoers direction', '44-44-44'),
('Jane','Operational direction', '22-22-22'),
('Jake','Operational direction', '22-22-22'),
('Andrew','Operational direction', '22-22-22');





-- INSERT INTO employees (name, position) VALUES
-- ('Milena', 'CFO'),
-- ('Sergey', 'CEO'),
-- ('Matthew', 'SMM/PR division'),
-- ('Timofey', 'Accountant'),
-- ('John','JS developer'),
-- ('Jane','Sales manager'),
-- ('Jake','Bodyguard for developers'),
-- ('Andrew','Driver');



INSERT INTO positions (name,car_aviability) VALUES
('JS developer',false),
('Sales manager',false),
('Bodyguard for developers',true),
('Driver',true);


INSERT INTO positions (name, car_aviability) VALUES
('CFO', true),
('CEO', true),
('SMM/PR division', false),
('Accountant', false);
