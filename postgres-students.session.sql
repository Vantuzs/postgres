
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
('LINOR','MARINOCSKI','SKOBODU@GMAIL.com','MAn',false,'2000.03.03',45,2,2)

-- ОФОрмление заказа для какогото юзера


--1 Создали заказ
INSERT INTO orders(customer_id) VALUES
(1)

--2. Наполнить ЗАКАЗ! 

INSERT INTO orders_to_products (product_id,order_id,quntity)
VALUES (1,1,1),
(3,1,2),
(4,1,10);



---------------------------


CREATE TABLE chats(
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL CHECK(name != ''),
  owner_id int REFERENCES users(id),
  created_at TIMESTAMP default current_timestamp
)

INSERT INTO chats(name,owner_id) VALUES
('superchat',2);



CREATE TABLE chats_to_users(
  chat_id int REFERENCES chats(id) ,
  user_id int REFERENCES users(id),
  join_at TIMESTAMP default current_timestamp,
  PRIMARY KEY(chat_id,user_id)
)

INSERT INTO chats_to_users(chat_id,user_id) VALUES
(3,2)

CREATE TABLE messages(
  id serial PRIMARY KEY,
  body text NOT NULL CHECK(body !=''),
  created_at TIMESTAMP default current_timestamp,
  is_read boolean NOT NULL default false,
  -- author_id int REFERENCES chats_to_users(user_id),
  -- chat_id int REFERENCES chats_to_users(chat_id)
  author_id int,
  chat_id int,
  FOREIGN KEY (author_id,chat_id) REFERENCES chats_to_users(user_id,chat_id)
)

INSERT INTO messages(body,author_id,chat_id) VALUES
('LETS GOOOOOO BROTHER',1,3);



DROP TABLE chats_to_users