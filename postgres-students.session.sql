
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