USE shop;
SHOW TABLES;

-- 1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

SELECT u.name, count(u.id) counter FROM users u 
INNER JOIN orders o ON (u.id = o.user_id)
GROUP BY u.id HAVING COUNT(u.id) >= 1; 

-- 2. Выведите список товаров products и разделов catalogs, который соответствует товару.


SELECT p.name, c.name FROM products p 
INNER JOIN catalogs c ON c.id = p.catalog_id;

-- 3. (по желанию) Пусть имеется таблица рейсов fligHTS (Id, from, tO) и тАБЛИца городов cITIES (LABel, name). ПОЛя From, tO и label содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов.
CREATE DATABASE sky;
USE sky;

CREATE TABLE flights(
id SERIAL PRIMARY KEY,
city_from VARCHAR (100) COMMENT 'Откуда',
city_to VARCHAR (100) COMMENT 'Куда');

INSERT INTO flights
  (id, city_from, city_to)
VALUES 
(1, 'Moscow', 'Omsk'),
(2, 'Novgorod', 'Kazan'),
(3, 'Irkutsk', 'Moscow'),
(4, 'Omsk', 'Irkutsk'),
(5, 'Moscow', 'Kazan');


CREATE TABLE cities (
label VARCHAR (100) UNIQUE NOT NULL PRIMARY KEY, 
`name` VARCHAR (100) COMMENT 'Названия по-русски'
);

INSERT INTO cities
  (label, name)
VALUES 
('Moscow', 'Москва'),
('Irkutsk', 'Иркутск'),
('Novgorod', 'Новгород'),
('Kazan', 'Казань'),
('Omsk', 'Омск');

SELECT c.name AS 'From', C1.name AS 'To' FROM flights f
INNER JOIN cities C ON c.label = f.city_from
INNER JOIN cities C1 ON c1.label = f.city_to
ORDER BY f.id;
