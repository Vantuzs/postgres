SELECT * FROM users;

--------------

SELECT id,first_name,last_name,email FROM users;


--------------------

SELECT id,first_name,last_name,email FROM users WHERE id > 6450


SELECT first_name,last_name,gender FROM users
WHERE gender = 'female';

SELECT first_name,last_name,gender,is_subscribe FROM users
WHERE is_subscribe AND gender = 'male';


-------------------------


SELECT height, first_name FROM users
WHERE height IS NOT NULL;

/* 

Задача: найти всех пользователей  которые не подписались на рпассылку

 */

 SELECT first_name,last_name,email,is_subscribe FROM users
 WHERE is_subscribe IS false;



 ------------------------------


 SELECT first_name,last_name,email FROM users
 WHERE first_name = 'Tony';

 /* 
 
 У нас есть диапазон имен ['William','John','Jason']
 Задача: найти всех юзеров которые входят в этот диапазон

  */


SELECT first_name,last_name,email FROM users
WHERE first_name IN ('William','John','Jason');

----------------------------------

/* 

Задча: найти всех юхеров у которых ИД между 4100 и 4200

 */

-- вариант 1
SELECT first_name,last_name,email,id FROM users
WHERE id <=4200 AND id >= 4100;
 
 -- вариант 2
SELECT first_name,last_name,email,id FROM users
WHERE id BETWEEN 4100 AND 4200;

----------------------------


/* 

Задача: найти всех юзеров имя которых начинается на букву 'K'
% - любае количество любых символов(тип как * в JS)
_ - 1 любой символ

*/

SELECT first_name,last_name,email,id FROM users
WHERE first_name LIKE 'A%';

/* 

Задача: найти всех юзеров, у которых ровно 5 символов в имени

 */

SELECT first_name,last_name,email,id FROM users
WHERE first_name LIKE '_____';


/* 

Задача: найти всех пользовалетей, у которых имя состоит с 3х символов и начинается на букву 'А'

 */

 SELECT first_name,last_name,email,id FROM users
 WHERE first_name LIKE 'A__';


 /* 
 
 Задача: найти всех юзеров, у которых имя заканчиватеся на букву 'f'
 
  */

SELECT first_name,last_name,email,id FROM users
WHERE first_name LIKE '%f';


-----------------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE users
ADD COLUMN weight int CHECK(weight!=0 AND weight>0);

-------------------------------

UPDATE users
SET weight = 60;

---------------------------

UPDATE users
SET weight = 100
WHERE id BETWEEN 4000 AND 5000;

---------------------------

UPDATE users
SET weight = 95
WHERE id = 4002

SELECT * FROM users
WHERE id = 4002


--------------------------
--dz

CREATE TABLE employees(
  id serial PRIMARY KEY,
  name varchar(256) NOT NULL CHECK(name !=''),
  salary int NOT NULL CHECK(salary >=0),
  works_hours int NOT NULL CHECK(works_hours >=0)
);

INSERT INTO employees (name,salary,works_hours) VALUES
('Ivanov',15000, 2),
('Petrov',5,1500),
('Beerdov',100500,170);

---3

UPDATE employees
SET salary = salary *1.2 
WHERE salary >150;



-----------------------------------------------------------------------------------------


INSERT INTO users (first_name,last_name,email,gender,is_subscribe) VALUES
('Sigma','Boy','sigmaBoy2000@gmail.com','SIGMA',false) RETURNING *; ---6501 6502


DELETE FROM users WHERE id = 6502;



----------------------------------

-- Задача: вывести всех пользователей с информацией про них + возраст



SELECT id, first_name,last_name,extract("years" from age(birthday) ) FROM users;


UPDATE users 
SET birthday = '2005-01-01'
WHERE (gender = 'female' AND is_subscribe = true);

ALTER TABLE users
ADD COLUMN birthday timestamp

ALTER TABLE users DROP COLUMN birhday; 



----------------------------------------------
-- make_interval([years],[mouths],[days]) - функция которая создает собственный интервал
SELECT id, first_name,last_name,make_interval(40,5,18) FROM users;



------------------------------------------------------------------

-- Алиасы - Псевдонимы 
-- Если хочешь переимонавать-назвать таблицу кирилицей то ставь "" д
-- Если керилица - ОБЯЗАТЕЛЬНО берите в дв.вавычки
-- Если латиница - можно и с кавычками и без
SELECT first_name AS "Имя", last_name AS "Фамилия",id AS "Уникальный номер" FROM users;

SELECT id, first_name,last_name,extract("years" from age(birthday)) AS "years old" FROM users
WHERE extract("years" from age(birthday)) BETWEEN 2 AND 10;




------------------------

/* 

Пагинация - способ разделить большой обьем информации на меньшие части

1. Нам нужны страници
2. Нам нужно знать какое количество результатов будет отображатся на каждой странице

 */

 -- LIMIT - задаёт количество рещльтатов которые я хочу получить

SELECT * FROM users
LIMIT 50
OFFSET 50; -- 50 *2

-- Как нам узнать, сколько нужно отступать (формула для разсчета OFFSET)

/* 

 В этой формуле 1 страница будет вважатся нулевой

 OFFSET = LIMIT * страничку_которую_мы_запрашиваем -1

 */


 ---------------------


SELECT id,first_name || ' ' || last_name AS "full name",gender,email FROM users;

SELECT id,concat(first_name, ' ',last_name) AS "full name",gender,email FROM users;


/* 

Задача: найти всех пользователей, полное имя которых (имя + фамилия) < 10 символов

 */

 -- вариант 1

 SELECT id,concat(first_name, ' ',last_name) AS "full name",gender,email FROM users
 WHERE char_length(concat(first_name,' ',last_name)) <10;

-- вариант 2

SELECT * FROM
(
    SELECT id,concat(first_name, ' ',last_name) AS "full name",gender,email FROM users
) AS "FN"
WHERE char_length("FN"."full name") < 10;



--- Практика
/* 


Задача:
Создать таблицу workers:
- id
- name 
- salary 
- birthday

1. Добавте работника с именем Олег, з/п 300
2. Добавте работницу Ярослава, з/п 500
3. Добавить двух новых работников одним запросом - 
Саша, з/п 1000
Маша, з/п 200
4. Установить Олегу з/п 500
5. Всем у кого з/п > 500, урезать з/п до 400
6. Выбрать (Select) Всех работников, чья з/п > 400 
7. Выбрать работника с id = 4
8. Узнайте (SELECT) з/п и возраст Жени
9. Попробывать найти работника с именем "Petya"
10. Выбрать работников в возрасте 30 лет ИЛИ с з/п > 800
WHERE _количество_лет_ = 30 OR salary > 800
11. Выбрать всех работников в возрасте от 25 до 28 лет
12. Выбрать всех работников, которые родились в Сентябре
13. Удалить работника с id = 4
14. Удалить Олега
15. Удалить всех работников старших за 30 лет

 */


 CREATE TABLE workers(
  id serial PRIMARY KEY,
  name varchar(200) NOT NULL CHECK(name != ''),
  salary int NOT NULL CHECK (salary >=0),
  birhday timestamp
 )

 INSERT INTO workers(name,salary,birhday) VALUES
 ('Oleg',300,'2000-05-05')

INSERT INTO workers(name,salary,birhday) VALUES
('Yaroslava',500,'1990-09-01');

INSERT INTO workers(name,salary,birhday) VALUES
('Alexhadnor',1000,'1995-09-12'),
('Maria',200,'1999-02-28');

UPDATE workers SET salary = 500 WHERE name = 'Oleg';

UPDATE workers SET salary = 400 WHERE salary > 500;

SELECT * FROM workers WHERE salary > 400;

SELECT * FROM workers WHERE id = 4;

SELECT name,salary, extract("years" from age(birhday)) AS vozrast FROM workers
WHERE name = 'Maria';

SELECT * FROM workers WHERE name = 'Petya';

SELECT name,salary, extract("years" from age(birhday)) AS vozrast FROM workers
WHERE extract("years" from age(birhday)) >=30 OR salary > 800;


SELECT name,salary, extract("years" from age(birhday)) AS vozrast FROM workers
WHERE extract("years" from age(birhday)) BETWEEN 25 AND 28;


SELECT name,salary, extract("months" from birhday) AS vozrast FROM workers
WHERE extract("months" from birhday) = 9

DELETE FROM workers 
WHERE id = 4;

DELETE FROm workers
WHERE id = 1;

DELETE FROM workers
WHERE extract("years" from age(birhday)) >30





--- Агрератные функции - функции, которые выполняют какуюто операцию над групой рядков и возвращают  одно-единое значение
-- COUNT, SUM, AVG, MIN, MAX

SELECT max(weight) FROM users

SELECT min(weight) FROM users

SELECT sum(weight) FROM users

SELECT avg(weight) FROM users

-- Подсчитать количество запросов в таблице

SELECT count(id) FROM users

-- НАйти средний вес мужчин и женщин. Отдельно мужчин отдельно женщин

SELECT avg(weight),gender FROM users
GROUP BY gender;


/*  ВОТ ТУТ БУДЕТ ОШИБКА! ЗАпрашивать в SELECT мы можем тьолько те столбци, которые принимают участие в GROUP BY

SELECT id,avg(weight),gender FROM users
GROUP BY gender;

 */

-- НАйти средний вес мужчин

SELECT avg(weight) FROM users
WHERE gender = 'male';


-- НАйти средий вес всех пользователей старших за 10 лет

SELECT avg(weight) FROM users
WHERE extract("years" from age(birthday)) >10;



-- Сортировка - упорядочивание данных за каким-то критерием

-- ASC - по возрастанию(default)
-- DESC - по понижению

SELECT * FROM users
ORDER BY birthday ASC,
          first_name ASC;

-- красиво оформленно по возрасту, тудутуту пиу
SELECT *,extract("years" from age(birthday)) AS "vozrast" FROM users 
ORDER BY vozrast DESC;

UPDATE users
SET birthday = '2002-09-14'
WHERE id BETWEEN 4004 AND 4027;


-- Вывести топ 3 телефона, которых у нас осталось найменьше

SELECT * FROM products
ORDER BY quantity ASC
LIMIT 3;

SELECT * FROM products
ORDER BY price ASC

SELECT * FROM products
ORDER BY quantity DESC
LIMIT 5;



-- Фильтрация груп

/* 

Задача: Найти количество пользователей в каждой вековой группе

 */

SELECT count(*), extract("years" from age(birthday)) AS "возрастная группа" FROM users
GROUP BY "возрастная группа"
ORDER BY "возрастная группа" DESC;

/* 

Модифицировать запрос таким образом, что бы остались только возрастные группы, где < 1000 пользователей

 */

SELECT count(*) AS "количество", extract("years" from age(birthday)) AS "возрастная группа" FROM users
GROUP BY "возрастная группа"
HAVING count(*) <1000;



-- РЕЛЯЦИОННЫЕ ОПЕРАЦИИ

CREATE TABLE A(
  v char(3),
  t int
);

CREATE TABLE B (
  v char(3)
);

INSERT INTO A VALUES
('XXX',1),
('XXY',1),
('XXZ',1),
('XYX',2),
('XYY',2),
('XYZ',2),
('YXX',3),
('YXY',3),
('YXZ',3)

INSERT INTO B VALUES
('ZXX'),
('XXX'), -- A
('ZXZ'),
('YXZ'), -- A
('YXY'); -- A


SELECT * FROM A,B
ORDER BY 

-- UNION - обьединение 
-- (Все то, что в А + все то, что в В. А то, что есть и там и там - в 1 екземпляре)
-- INTERSECT - перетин множин
-- (Все то, что есть и в А, и в В, в едином екземпляре)

-- EXCEPT - РАзница:
---- А минус В - все с множини А минус общие елементы для А и В
---- В минус А - все из В минус общие елементы для А и В


SELECT v FROM A
UNION
SELECT * FROM B; -- ПОЛУЧИМ ВСЕ УНИКАЛЬНЫЕ ЗАПИСИ С ДВУХ ТАБЛИЦ БЕЗ ДУБЛИРОВАНИЯ

SELECT v FROM A
INTERSECT
SELECT * FROM B; -- ПОЛУЧИЛИ 3 ЕЛЕМЕНТА, КОТОРЫЕ ПОВТОРЯЮТСЯ В ДВУХ ТАБЛИЦАХ

SELECT v FROM A
EXCEPT
SELECT * FROM B; -- ПОЛУЧИМ ВСЕ ЕЛЕМЕНТЫ С ТАБЛИЦИ А, МИНУС ОБЩИЕ ЕЛЕМЕНТЫ В ТАБЛИЦЕ А И В





INSERT INTO users (first_name,last_name,email,gender,is_subscribe,birthday)
VALUES 
('User 1', 'Test 1', 'enail1@gmail.com','male',true,'1990-09-10'),
('User 2', 'Test 2', 'email2@gmail.com','female',true,'1999-09-12'),
('User 3', 'Test 3', 'email3@gmail.com','male',false,'1999-09-12');



-- Задача: найти id юзеров, которе делали заказы

SELECT id FROM users
INTERSECT
SELECT customer_id FROM orders;

-- Задача: найти id юзеров, которые не делали заказов

SELECT id FROM users
EXCEPT
SELECT customer_id FROM orders;



----- Соединение множеств - JOIN
/* 

Соединение множеств - операция которая обьединяет две или больше множеств в одно множество.

 */

SELECT * FROM A

SELECT * FROM B

SELECT A.v AS "id", A.t AS "price",B.v AS "phone.id" FROM A,B
WHERE A.v = B.v;


---


SELECT * 
FROM A JOIN B
ON A.v = B.v;


-- Задача: найти все заказы юзера, у которого id = 4505

SELECT * 
FROM users JOIN orders
ON orders.customer_id = users.id
WHERE users.id = 4505


--------

SELECT u.*, o.id AS "order_id"
FROM users AS u JOIN orders AS o
ON o.customer_id = u.id
WHERE u.id = 4505;


--------

SELECT *
FROM A JOIN B
ON A.v = B.v
JOIN products ON A.t = products.id;


--- Найти id всех заказов, где были заказаны телефоны Samsung

SELECT *
FROM products AS p JOIN  orders_to_products AS otp
ON p.id = otp.products_id 
WHERE p.brand = 'Samsung';

-- МОдифицируйте прошлый запрос. Посчитайте, сколько заказов бренда Самсунг
SELECT count(*)
FROM products AS p JOIN  orders_to_products AS otp
ON p.id = otp.products_id 
WHERE p.brand = 'Samsung';

-- Сделать топ продаж. Какой бренд чаще покупали?

SELECT p.brand,count(*) AS "quantity"
FROM products AS p JOIN  orders_to_products AS otp
ON p.id = otp.products_id 
GROUP BY p.brand
ORDER BY "quantity" DESC
LIMIT 3;