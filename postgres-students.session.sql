
--Ключ - ознака (чаще штучна) которая видризняе один рядок в таблице от другого
-- Потециальный ключ - столбец (группа столпцов) которые могли бы стать первинным ключем, но еще не выбраны как такие.
-- Первинний ключ (PRIMARY KEY) - используестя для того, что бы ключу дать ограничение уникальности(UNIQUE) и ограничение NOT NULL
-- Внешний ключ - столбец (группа столпцов) которые хранят значения, которые ссылаются на идетенфикаторы в других таблицах



/* 


В таблице products создать генерируемый столбец is_luxury

Если price > 800 -> true
price <800 -> false


 */

 CREATE TABLE products_version_2(
    id serial PRIMARY KEY,
    brand varchar(256) NOT NULL CHECK(brand!=''),
    model varchar(256) NOT NULL CHECK(model!=''),
    price numeric(8,2) NOT NULL,
    is_luxury boolean GENERATED ALWAYS AS (price > 10000) STORED
 );
 
 INSERT INTO products_version_2 ( brand, model, price)
 VALUES 
 ('IPHONE','15PRO MAX DELICOTES',45000),
 ('SAMSUNG','S3000',12000),
 ('Xiaomi','T200 TURBO SUPER MEGA PRO EDITION',500)


ALTER TABLE products
ADD COLUMN is_luxury boolean GENERATED ALWAYS AS (price > 800) STORED

UPDATE products SET price = price* 3 WHERE price <1300;


---

INSERT INTO products (brand,model,price,category) VALUES
('LG','SUPER MEGA MONITOR 5500',2520,'MONITOR') RETURNING id;

INSERT INTO products (brand,model,price,category) VALUES
('IPHONE','16PRO',50,'PHONE') RETURNING *;

UPDATE products SET model = 'CHINA 14PRO DELICOTES' WHERE id = 8 RETURNING model,id


CREATE TABLE users_2 (
    first_name varchar(64) NOT NULL CHECK(first_name!='') ,
    last_name varchar(64) NOT NULL CHECK(last_name!=''),
    email varchar(100) NOT NULL CHECK(email!=''),
    gender varchar(64) NOT NULL CHECK(gender!=''),
    is_subscribe boolean,
    birhday timestamp,
    foot_size smallint,
    height numeric(5,2),
    id serial PRIMARY KEY
  )

  DROP TABLE users
VALUES (
    'first_name:character varying',
    'last_name:character varying',
    'email:character varying',
    'gender:character varying',
    is_subscribe:boolean,
    'birhday:timestamp with time zone',
    'foot_size:smallint',
    height:numeric,
    id:integer
  );
  

  ---


DELETE FROM users_2



--- 


DROP TABLE orders_to_products;

DROP TABLE orders

DROP TABLE messages

DROP TABLE chats_to_users

DROP TABLE chats

DROP TABLE reactions

DROP TABLE contents

DROP TABLE products

DROP TABLE products_version_2

DROP TABLE users_2

-------------------------------------------------------------------------------

CREATE TABLE users(
  id serial PRIMARY KEY,
  first_name varchar(64) NOT NULL CHECK(first_name!=''),
  last_name varchar(64) NOT NULL CHECK(last_name!=''),
  email text NOT NULL CHECK(email!=''),-- По хорошему тут еще должен быть UNIQUE
  gender varchar(30),
  is_subscribe boolean NOT NULL,
  birhday timestamp CHECK(birhday <= current_timestamp),
  foot_size smallint,
  height numeric(5,2) CHECK(height<2.5 AND height >0)
);

CREATE TABLE products(
  id serial PRIMARY KEY,
  brand varchar(200) NOT NULL CHECK(brand!=''),
  model varchar(300) NOT NULL CHECK(model!=''),
  description text,
  category varchar(200) NOT NULL CHECK(category!=''),
  price numeric(10,2) NOT NULL CHECK(price >0),
  discounted_price numeric(10,2) CHECK(discounted_price>0 AND discounted_price<price),
  quantity int CHECK (quantity >=0) 
);

CREATE TABLE orders(
  id serial PRIMARY KEY,
  created_at timestamp NOT NULL DEFAULT current_timestamp,
  customer_id int REFERENCES users(id)
);

CREATE TABLE orders_to_products( -- order_items
  order_id int REFERENCES orders(id),
  products_id int REFERENCES products(id),
  quantity int NOT NULL DEFAULT 1,
  PRIMARY KEY(order_id,products_id)
)