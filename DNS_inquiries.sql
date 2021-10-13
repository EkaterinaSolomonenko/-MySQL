USE dns_shop;
SHOW TABLES;

-- *** Группировки и JOIN'ы ***

-- 1) Показать производителей микроволновок. Группировка по id производителя.

SELECT * FROM manufacturers;
SELECT * FROM catalog;
SELECT * FROM products;

SELECT p.id, p.name, m.manufacturer_name FROM manufacturers m
INNER JOIN products p ON (p.manufacturers_id = m.id) 
INNER JOIN catalog c ON (c.id = p.catalog_id) WHERE c.id = 1
GROUP BY m.manufacturer_name; 


-- 2) Показать города, в котовых купили посудомоечные машины. Группировка по id города.

SELECT * FROM city;
SELECT * FROM catalog;
SELECT * FROM stores;
SELECT * FROM orders;
SELECT * FROM products;

SELECT c.city FROM city c
INNER JOIN stores s ON (s.city_id = c.id) 
INNER JOIN orders o ON (o.store_id = s.id) 
INNER JOIN products p ON (p.id = o.product_id) 
INNER JOIN catalog ON (c.id = p.catalog_id) 
GROUP BY c.city; 


-- 3) Найти покупателей, сделавших покупку в Москве. Группировка по id покупателя.

SELECT * FROM stores;
SELECT * FROM orders;

SELECT u.first_name, u.last_name FROM users u 
INNER JOIN orders o ON (o.user_id = u.id) WHERE o.store_id = 1
GROUP BY u.id; 

-- 4) Вывести список товаров из каталога "Мультиварки".

SELECT * FROM catalog;
SELECT * FROM products;

SELECT p.name FROM products p 
INNER JOIN catalog c ON c.id = p.catalog_id WHERE p.catalog_id = 4
GROUP BY p.id;

-- *** Вложенные таблицы ***

-- 1) Показать товары, которые купили в Москве и Санкт-Петербурге

SELECT * FROM city;
SELECT * FROM orders;
SELECT * FROM stores;
SELECT * FROM products;

SELECT name FROM products 
WHERE id 
IN 
(SELECT product_id FROM orders 
WHERE store_id 
IN 
(SELECT id FROM stores 
WHERE city_id 
IN (1, 2)));

-- 2) Показать отзывы, оставленные на микроволновки.

SELECT * FROM reviews;
SELECT * FROM products;
SELECT * FROM catalog;

WITH prod_name AS (SELECT id, name FROM products WHERE catalog_id IN (SELECT id FROM catalog WHERE name = 'Микроволновые печи'))
SELECT body AS 'Отзывы' FROM reviews WHERE product_id IN (SELECT id FROM prod_name);

 -- *** Представления ***
-- 1) Создать представление товарных позиций с указанием цены на товар. Отсортировать по цене.
SELECT * FROM products;
SELECT * FROM price;

CREATE OR REPLACE VIEW ProductPrice
AS SELECT products.id, name, price FROM products, price
WHERE products.id = price.product_id
ORDER BY price.price;

SELECT * FROM ProductPrice;

-- 2) Создать представление товарных позиций, купленных в Иркутске и Магадане.

SELECT * FROM city;
SELECT * FROM orders;
SELECT * FROM stores;
SELECT * FROM products;

CREATE OR REPLACE VIEW Sales_In_Cities 
AS 
SELECT name AS 'Название товара', city AS 'Город продаж' FROM products, city 
WHERE products.id IN 
(SELECT product_id FROM orders o 
WHERE o.store_id 
IN 
(SELECT id FROM stores s 
WHERE s.city_id 
IN 
(SELECT id FROM city c 
WHERE c.city 
IN ('Иркутск', 'Магадан'))))
AND city.city IN ('Иркутск', 'Магадан');

SELECT * FROM Sales_In_Cities;

 -- *** Хранимые процедуры ***
 
 -- Создать хранимую процедуру, выводящую данные о клиентах (имя, фамилия, телефон, e-mail)
 
 DELIMITER //
 DROP PROCEDURE my_client//
 CREATE PROCEDURE my_client ()
 BEGIN 
 SELECT CONCAT(first_name, '', last_name), email, phone FROM users;
 END//
DELIMITER ;

  CALL my_client;
  
  -- Создать хранимую процедуру, которая будет добавлять новый товар в таблицу Products.
  
DELIMITER //
 DROP PROCEDURE Add_new_product//
 CREATE PROCEDURE Add_new_product (IN -- создание процедуры для добавление нового товара
 name VARCHAR(255),
 description TEXT,
 catalog_id INT,
 manufacturers_id INT)
 BEGIN 
 INSERT INTO products (name, description, catalog_id, manufacturers_id) -- добавление основных данных о товаре в таблицу
 VALUES (@name, @description, @catalog_id, @manufacturers_id);
  END//

  ALTER TABLE products MODIFY manufacturers_id INTEGER//
  SELECT * FROM products//
  CALL Add_new_product ('Холодильник с морозильником Bosch KGV36NL1AR', '317 л, внешнее покрытие-пластик, металл, размораживание - ручное, 60 см х 185 см х 65 см', '2', '1')//
 
DELIMITER ;

-- *** Триггеры ***

-- Триггер вставляет новую строчку в таблицу Price после создания новой записи в таблице Products.
DELIMITER //
DROP TRIGGER new_products//
CREATE TRIGGER new_products AFTER INSERT ON products
FOR EACH ROW
BEGIN
INSERT INTO price (product_id, created_at, price) VALUES (NEW.id, NOW(), price);
END//

DELIMITER ;

INSERT INTO products (name, description, catalog_id, manufacturers_id) VALUES -- проверка работы триггера
('Микроволновая печь BOSH', '20 л, 700 Вт, 50 см x 28 см x 38 см', 1, 1);

select * from products;
select * from price;

-- Триггер копирует имя покупателя в архив при обновлении таблицы.

DROP TABLE user_name; -- для выполнения триггера создаем таблицу-архив
CREATE TABLE user_name (
table_id INT NOT NULL,
name VARCHAR (200),
created_at DATETIME NOT NULL
) ENGINE = ARCHIVE;

 
DELIMITER //
DROP TRIGGER user_name//
CREATE TRIGGER user_name AFTER UPDATE ON users
FOR EACH ROW
BEGIN
DECLARE new_name varchar(200);
SELECT CONCAT('first_name', '', 'last_name') FROM users INTO new_name;
INSERT INTO user_name (table_id, name, created_at) VALUES (NEW.id, new_name, NOW());
END//

DELIMITER ;
