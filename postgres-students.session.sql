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


CREATE TABLE books(
    id serial PRIMARY KEY,
    exzemplar int,
    author varchar(100) NOT NULL CONSTRAINT author_need CHECK(author !=''),
    book_name varchar(100) NOT NULL CONSTRAINT book_name_need CHECK(book_name !=''),
    birthday date NOT NULL CONSTRAINT birthday_current_date CHECK(birthday <= current_date),
    vidatniztvo varchar(200) CONSTRAINT vidatniztvo_need CHECK(vidatniztvo !=''),
    category varchar(200) NOT NULL CONSTRAINT category_need CHECK(category !=''),
    sinopsis varchar(200) NOT NULL CONSTRAINT sinopsis_need CHECK(sinopsis !=''),
    book_status boolean NOT null
)
    --  PRIMARY KEY(author,book_name)

DROP TABLE books

INSERT INTO books(author,book_name,birthday,vidatniztvo,category,sinopsis,book_status) VALUES
('SIGMA','SIGMA BOY LADN','2020.12.02','CHARIPORSKA','BOEVIK','serial',false)

ALTER TABLE books
ADD CONSTRAINT "exzemplar_by_need_positive" CHECK(exzemplar >0);

ALTER TABLE books
ADD CONSTRAINT "authod_name_books" UNIQUE(author,book_name)



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