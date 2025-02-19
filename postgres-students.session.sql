CREATE TABLE users_with_snake();
DROP TABLE test ,users_with_snake, users;

-- Как выполнить запрос ctrl + E(2)

/* 

char(5): '1234567' -> error, '12' -> '12   '
varchar(5): '1234567' -> error, '12' -> '12'

 */

 CREATE TABLE users(
    first_name varchar(64),
    last_name varchar(64),
    biography text
 )