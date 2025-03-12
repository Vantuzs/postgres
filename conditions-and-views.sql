SELECT * FROM users
WHERE gender IS NULL;

ALTER TABLE orders
ADD COLUMN status boolean;


UPDATE orders
SET status = true
WHERE id % 2 = 0;

UPDATE orders
SET status = false
WHERE id % 2 = 1;

SELECT id,created_at, customer_id,status AS orders_status FROM orders;


--- 1 syntax CASE

/*
 CASE
    WHEN conditions1 = true
    THEN result1
    WHEN conditions2 = true
    THEN result2
    ...
    ELSE result3
END; 
*/

-- Вывести все заказы, там где статус true - написать "выполнено", где false - написать "новое"

SELECT id,created_at, customer_id,status, (
    CASE
        WHEN status = true 
        THEN 'выполнено'
        WHEN status = false 
        THEN 'новое'
    END) AS order_status  FROM orders
ORDER BY id;



-- 2 syntax CASE

/* 
    CASE condition WHEN value1 THEN result1
                    WHEN value2 THEN result2
                    ...
         ELSE default_result
    END;
*/

-- Вытянуть месяц рождения юзера и на его основе вывести, родился юзер осенью, весной, летом или зимой

SELECT *, (
    CASE EXTRACT('month' from birthday)
        WHEN 1 THEN 'winter'
        WHEN 2 THEN 'winter'
        WHEN 3 THEN 'spring'
        WHEN 4 THEN 'spting'
        WHEN 5 THEN 'spting'
        WHEN 6 THEN 'summer'
        WHEN 7 THEN 'summer'
        WHEN 8 THEN 'summer'
        WHEN 9 THEN 'fall'
        WHEN 10 THEN 'fall'
        WHEN 11 THEN 'fall'
        WHEN 12 THEN 'winter'
        ELSE 'unkown'
    END
) FROM users;


/* 

ВЫвести юзеров, у которых в поле "стать_пропистью" будет прописано "муждчина", "женсчина", "другое"

Задача 2

Вывести все телефоны с таблици products
Если цена больше 6000 - флагман
Если цена от 2-6 тыс. - средний клас
Если цена меньше 2 тыс. - бюджетный смартфон

*/

SELECT *,(
    CASE gender
        WHEN 'male' THEN 'муждчина'
        WHEN 'female' THEN 'женсчина'
        ELSE 'другое'
    END
) FROM users;


SELECT *,(
    CASE 
        WHEN price>6000 THEN 'флагман'
        WHEN price BETWEEN 2000 AND 6000 THEN 'средний клас'
        WHEN price<2000 THEN 'бюджетный клас'
        ELSE 'sigma BOY'
    END
) FROM products




------------------------------------------------------------------------------------------




-- Высести инфу про всех юзеров + инфу сколько кто сделал заказов



CREATE OR REPLACE VIEW  users_with_orders_amount AS (
    SELECT u.id ,u.first_name, u.last_name, u.email , count(o.id) AS orders_amount FROM 
    users AS u LEFT JOIN orders AS o
    ON u.id = o.customer_id
    GROUP BY u.id
    ORDER BY "orders_amount"
);

SELECT * FROM users_with_orders_amount;


-- Получить email тех юзеров, которые имеют мненьше 2 заказов

SELECT email, orders_amount FROM users_with_orders_amount
WHERE orders_amount<2;


-- Можно удалять вьюхи

DROP VIEW users_with_orders_amount



--  Создать представление, которое сохраняет заказы с ихней стоимостью
-- Добавим к этой вьюхе информацию про заказчика (id заказчика)

CREATE OR REPLACE VIEW orders_with_price AS (
    SELECT o.id,o.customer_id, sum(p.price*p.quantity) AS "order_sum", o.status FROM 
  orders AS o JOIN orders_to_products AS otp
  ON o.id = otp.order_id 
  JOIN products AS p
  ON p.id = otp.products_id
  GROUP BY o.id
);

DROP VIEW orders_with_price;


-- Вывсести юзеров с суммой денег, которую они потратили в нашем магазине

SELECT u.id,u.email,sum(owp.order_sum) AS "sum" FROM 
users AS u  LEFT JOIN orders_with_price AS owp
ON u.id = owp.customer_id
GROUP BY u.id
ORDER BY sum



--------------------------------------------------------------------------------------------------

-- FUNCTION

/* 

CREATE FUNCTION function_name ([parameter1 data_type],[parameter2 data_type], .... )
RETURNS return_data_type
AS
$$
BEGIN

    -- Тело функции (операции)
    RETURN result;

END;
$$
LANGUAGE plpgsql -- Язык програмирования фукнции для Postgresql

*/


CREATE FUNCTION add_numbers (number1 integer, number2 integer)
RETURNS integer
AS
$$
BEGIN
    RETURN number1 + number2;
END;
$$
LANGUAGE plpgsql;

-- Вызов функции

SELECT add_numbers(10,5);

-- Удаление функции

DROP FUNCTION add_numbers(integer,integer);