
--Ключ - ознака (чаще штучна) которая видризняе один рядок в таблице от другого
-- Потециальный ключ - столбец (группа столпцов) которые могли бы стать первинным ключем, но еще не выбраны как такие.
-- Первинний ключ (PRIMARY KEY) - используестя для того, что бы ключу дать ограничение уникальности(UNIQUE) и ограничение NOT NULL
-- Внешний ключ - столбец (группа столпцов) которые хранят значения, которые ссылаются на идетенфикаторы в других таблицах

/* 

Задача: МИНИ-ЮТУБ

Таблица контента: 
- name,
- описание,
- автор (юзер, который создал контент),
- дата создания


таблица Реакции
- is_liked:
  - null - пользователь не ставил оценку
  - true - контент лайкнули
  - false - контент дизлайкнули


У конента может быть много реакций от пользователей
Реакции - связь между пользователем и контентом


 */


 CREATE TABLE contents(
  id serial PRIMARY KEY,
  name varchar(256) NOT NULL CHECK(name !=''),
  description text,
  authhor_id int references users(id),
  created_at TIMESTAMP default current_timestamp
 );

 CREATE TABLE reactions(
  content_id int references contents(id),
  user_id int references users(id),
  is_liked boolean
 )

 INSERT INTO contents(name,authhor_id) VALUES
 ('NIGGERS IN GYM',1)

 INSERT INTO reactions VALUES
 (1,2,true)