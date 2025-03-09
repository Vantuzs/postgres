-- 1 НФ: в каждой ячейке сохраняется атомарное значение (без списков и тд.)
-- 2 НФ: 1 НФ + таблица должна иметь ключ; ключ функционально определяет всю строчку    
-- 3 НФ: 2 НФ + мы должны убрать транзитивные функциональные зависимости атрибутов
-- 4 НФ: не ключевые транзетивные зависимости не могут быть в составе составного ключа

----------------------------------------------

/* 

-- teachers

-- students

-- subjects 

Ограничения:
1 учитель может вести только 1 предмет


-- teachers 1:m subjects 

-- students m:n subjects

-- students m:n teachers

*/


CREATE TABLE students (
    id serial PRIMARY KEY,
    name varchar(100)
);

INSERT INTO students(name) VALUES
('Ivanov'),
('Petrov'),
('Sidorov');

-----------------------------------------

CREATE TABLE teachers (
    id serial PRIMARY KEY,
    name varchar(100),
    subject varchar(50) REFERENCES subjects(name) 
);

INSERT INTO teachers (name,subject) VALUES
('Smirnov','Системы штучногоинтелекта'),
('Petrenco', 'Обланый компьютинг')

CREATE TABLE students_to_teachers(
    teacher_id int REFERENCES teachers(id),
    student_id int REFERENCES students(id),
    PRIMARY KEY ( teacher_id,student_id) 
);

----------------------------------------

CREATE TABLE subjects(
    name VARCHAR(50) PRIMARY KEY 
);

INSERT INTO subjects VALUES
('Системы штучногоинтелекта'),
('Обланый компьютинг')

/* 
Ограничения:
1 учитель может вести только 1 предмет
*/

INSERT INTO students_to_teachers VALUES
(1,1),
(1,2),
(2,1);


----------------------------------------
/* 

Задача: реализовать витяг, какой студент, какой предмет учит и кто препадаёт

*/

SELECT s.id,s.name,t.subject,t.name AS "teacher name" FROM 
students AS s JOIN students_to_teachers AS stt
ON s.id = stt.student_id
JOIN teachers AS t
ON stt.teacher_id = t.id