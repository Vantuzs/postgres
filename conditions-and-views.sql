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
