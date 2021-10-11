-- 1. Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, catalogs и 
-- products в таблицу logs помещается время и дата создания записи, название таблицы, идентификатор 
-- первичного ключа и содержимое поля name.

USE SHOP_1;
SHOW TABLES;

DROP TABLE logs;
CREATE TABLE logs (
	table_name VARCHAR(100) NOT NULL,
	str_id INT(100) NOT NULL,
	name_value VARCHAR(100) NOT NULL,
    created_at DATETIME NOT NULL
) ENGINE = ARCHIVE;

SELECT * FROM logs;

DELIMITER // -- TRIGGER for users  
DROP TRIGGER archive_users//
CREATE TRIGGER archive_users AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, str_id, name_value)
	VALUES (NOW(), 'users', NEW.id, NEW.name);
END //
DELIMITER;

DELIMITER // -- TRIGGER for catalogs 
DROP TRIGGER IF EXISTS archive_catalogs//
CREATE TRIGGER archive_catalogs AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, str_id, name_value)
	VALUES (NOW(), 'catalogs', NEW.id, NEW.name);
END//
DELIMITER;


DELIMITER // -- TRIGGER for products 
DROP TRIGGER IF EXISTS archive_products//
CREATE TRIGGER archive_products AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, str_id, name_value)
	VALUES (NOW(), 'products', NEW.id, NEW.name);
END//

DELIMITER;


SELECT * FROM users; -- Tests 
SELECT * FROM logs;

INSERT INTO users (name, birthday_at)
VALUES ('Семён', '1987-04-17');

SELECT * FROM users;
SELECT * FROM logs;

INSERT INTO users (name, birthday_at)
VALUES ('Алёна', '1999-01-20'),
		('Егор', '1985-06-04'),
		('Геннадий', '1997-10-15'),
		('Маргарита', '2001-09-02');

SELECT * FROM users;
SELECT * FROM logs;


SELECT * FROM catalogs;
SELECT * FROM logs;

INSERT INTO catalogs (name)
VALUES ('Мониторы'),
		('Клавиатуры'),
		('Мыши');

SELECT * FROM catalogs;
SELECT * FROM logs;

SELECT * FROM products;
SELECT * FROM logs;

INSERT INTO products (name, description, price, catalog_id)
VALUES ('Монитор HP V19', '1366x768@60 Гц, TN, 5 мс, 600 : 1, 200 Кд/м², 90°/65°, VGA (D-sub)', 7999.00, 13),
		('Клавиатура проводная Oklick 130M', 'мембранная, клавиш - 104, USB, черная', 350.00, 14),
		('Мышь проводная Oklick 105S', '800 dpi, светодиодный, USB, кнопки - 3 ', 199.00, 15);

SELECT * FROM products;
SELECT * FROM logs;



