--Ключ - ознака (чаще штучна) которая видризняе один рядок в таблице от другого
-- Первинний ключ (PRIMARY KEY) - используестя для того, что бы ключу дать ограничение уникальности(UNIQUE) и ограничение NOT NULL

/* первинные ключи на два столпца */

DROP TABLE coordinats

CREATE TABLE coordinats(
    x INT,
    y INT,
    z INT,
    CONSTRAINT "unique_coord" PRIMARY KEY(x,y,z)
)

-- (111,22,36);
-- (252, 76,88);
-- (111,22,36); <<---- Тут возвращается ошибка

INSERT INTO coordinats VALUES(111,22,35),
(252, 76,88)