--Ключ - ознака (чаще штучна) которая видризняе один рядок в таблице от другого
-- Первинний ключ (PRIMARY KEY) - используестя для того, что бы ключу дать ограничение уникальности(UNIQUE) и ограничение NOT NULL


/* ALTER TABLE - Внесение изменений */
DROP TABLE products;

CREATE TABLE products(
    id serial PRIMARY KEY,
    brand varchar(200) NOT NULL CHECK (brand != ''),
    model varchar(300) NOT NULL CHECK(model != ''),
    description text,
    category varchar(200) NOT NULL,
    price numeric(10,2) NOT NULL CHECK(price >0),
    discounted_price numeric(10,2) CHECK (discounted_price <=price)
);


INSERT INTO products (brand,model,category,price) VALUES
('IPHONE','15 PRO MAX SUPER PUPER MEGA GYGABYTE TERROBYTE HDMI EDITION','smartphones',201034.56),
('Samsung','S55002231 SUPER ZOOM MEGA BLUM','smartphones', 1234.32),
('Sony','A33222123','TV',500.88),
('LG','GG322','TV',1488);


ALTER TABLE products
ADD CONSTRAINT "unique_brand_model_pair" UNIQUE(brand,model) ;


INSERT INTO products (brand,model,category,price) VALUES
('IPHONE','15 PRO MAX SUPER PUPER MEGA GYGABYTE TERROBYTE HDMI EDITION','smartphones',322.02);

ALTER TABLE products
ADD COLUMN quantity int;

ALTER TABLE products
ADD CONSTRAINT "products_quantity_check" CHECK(quantity >=0);

ALTER TABLE products
DROP CONSTRAINT "products_quantity_check";

ALTER TABLE products
DROP COLUMN quantity