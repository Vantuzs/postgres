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