DROP TABLE messages

CREATE TABLE messages(
    id serial PRIMARY KEY,
    body text NOT NULL CHECK (body !=''),
    author varchar(256) NOT NULL CHECK (author !=''),
    created_at timestamp DEFAULT current_timestamp,
    is_read boolean DEFAULT false
);

INSERT INTO messages(author,body) VALUES('Hello JONATON','MEEEE');

INSERT INTO messages (author,body) VALUES
('Johnos','Hello BOBBA'),
('Me','Go to GYM!'),
('Johnos','OU YEEEESSSSSS!');

INSERT INTO messages (author,body) VALUES
('Peter','Hello'),
('Peter','Hello');

INSERT INTO messages VALUES(10,'Text mess','NoName');

--Ключ - ознака (чаще штучна) которая видризняе один рядок в таблице от другого
-- Первинний ключ (PRIMARY KEY) - используестя для того, что бы ключу дать ограничение уникальности(UNIQUE) и ограничение NOT NULL