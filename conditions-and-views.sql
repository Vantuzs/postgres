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