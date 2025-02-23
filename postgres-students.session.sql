
--Ключ - ознака (чаще штучна) которая видризняе один рядок в таблице от другого
-- Потециальный ключ - столбец (группа столпцов) которые могли бы стать первинным ключем, но еще не выбраны как такие.
-- Первинний ключ (PRIMARY KEY) - используестя для того, что бы ключу дать ограничение уникальности(UNIQUE) и ограничение NOT NULL
-- Внешний ключ - столбец (группа столпцов) которые хранят значения, которые ссылаются на идетенфикаторы в других таблицах

INSERT INTO users (
    first_name,
    last_name,
    email,
    gender,
    is_subscribe,
    birhday,
    foot_size,
    height
  )
VALUES (
    'first_name:character varying',
    'last_name:character varying',
    'email:character varying',
    'gender:character varying',
    is_subscribe:boolean,
    'birhday:date',
    'foot_size:smallint',
    height:numeric
  );

  ALTER TABLE books 

  SELECT name FROM pg_timezone_names WHERE name ILIKE '%kyiv%';
  SET TIMEZONE = 'UTC';

    INSERT INTO users VALUES('ewqewq','ewqewq','ewewqq','dsaewqewq',true,'2020.11.22')
    SHOW TIMEZONE;

    DROP TABLE messages,books, coordinats
    
    TRUNCATE TABLE books,messages,users;

    ALTER TABLE  ALTER COLUMN birhday TYPE TIMESTAMP;

    ALTER TABLE users ALTER COLUMN birhday TYPE TIMESTAMP WITH TIME ZONE;

    INSERT INTO books VALUES(12,12,'213','123','2020.12.22','32132','3213','321321',true)





    ----------------------------------------------------


    CREATE TABLE orders(
      id serial PRIMARY KEY,
      created_at TIMESTAMP NOT NULL default current_timestamp,
      customer_id int REFERENCES users(id)
    )

DROP TABLE orders


ALTER TABLE users
ADD COLUMN id serial PRIMARY KEY;



CREATE TABLE orders_to_products(
  product_id int REFERENCES products(id),
  order_id int REFERENCES orders(id),
  quntity int,
  PRIMARY KEY(order_id,product_id)
) 

-- таблица1_to_таблица2


INSERT INTO users VALUES
('JOHN','DIPUCHIRIANO','DESPUCHIRIANOKING@GMAIL.com','MAN',true,'2000.02.02',46,2.3,1)

-- ОФОрмление заказа для какогото юзера


--1 Создали заказ
INSERT INTO orders(customer_id) VALUES
(1)

--2. Наполнить ЗАКАЗ! 

INSERT INTO orders_to_products (product_id,order_id,quntity)
VALUES (1,1,1),
(3,1,2),
(4,1,10);