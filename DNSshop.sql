DROP DATABASE dns_shop;
CREATE DATABASE dns_shop;
USE dns_shop;

DROP TABLE IF EXISTS catalog;
CREATE TABLE catalog (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) UNIQUE COMMENT 'Название раздела',
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Разделы интернет-магазина';

INSERT INTO catalog (name) VALUES
  ('Микроволновые печи'),
  ('Холодильники'),
  ('Посудомоечные машины'),
  ('Мультиварки'),
  ('Плиты электрические');
  
  SELECT * FROM catalog;


DROP TABLE IF EXISTS manufacturers;
CREATE TABLE manufacturers (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
manufacturer_name VARCHAR(255) COMMENT 'Название производителя',
country VARCHAR(100) NOT NULL COMMENT 'Страна производителя',
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Производители техники';

INSERT INTO manufacturers (manufacturer_name, country) VALUES
('Bosch', 'Китай'),
('Gorenje', 'Китай'),
('Hyundai', 'Китай'),
('Hotpoint-Ariston', 'Китай'),
('Samsung', 'Китай'),
('LG', 'Китай'),
('Electrolux', 'Китай'),
('Indesit', 'Польша'),
('Tefal', 'Китай'),
('Hyundai', 'Турция');

SELECT * FROM manufacturers;


DROP TABLE IF EXISTS products;
CREATE TABLE products (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) COMMENT 'Название товара',
description TEXT COMMENT 'Описание',
catalog_id INT NULL,
manufacturers_id INT NOT NULL,
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (catalog_id) REFERENCES catalog (id), 
FOREIGN KEY (manufacturers_id) REFERENCES manufacturers (id)
) COMMENT = 'Товарные позиции';

INSERT INTO products (name, description, catalog_id, manufacturers_id) VALUES
('Микроволновая печь Hyundai HYM-M2059', '20 л, 700 Вт, переключатели - поворотный механизм, 48 см x 28 см x 38 см', 1, 3),
('Микроволновая печь Hotpoint-Ariston MWHR 3101', '20 л, 700 Вт, переключатели - поворотный механизм, 45.2 см x 26.2 см x 36.5 см', 1, 4),
('Холодильник с морозильником Bosch KGN39UW25R', '388 л, размораживание - No Frost, дисплей, 60 см х 203 см х 66 см', 2, 1),
('Холодильник с морозильником Samsung RB30A30N0WW/WT', '311 л, внешнее покрытие-металл, размораживание - No Frost, дисплей, 59.5 см х 178 см х 67.5 см', 2, 5),
('Посудомоечная машина Electrolux ESF2400OH', 'расход воды - 6.5 л, вместимость - 6 комплектов, дисплей, защита от протечек, 43.8 см x 55 см x 50 см', 3, 7),
('Посудомоечная машина Indesit DSCFE 1B10 RU', 'расход воды - 11.5 л, вместимость - 10 комплектов, 85 см x 45 см x 59 см', 3, 8),
('Мультиварка Tefal RK815832', '5 л, 750 Вт, управление - кнопки, программ - 42, поддержание температуры, отложенный старт', 4, 9),
('Мультиварка Bosch MUC11W12RU', '5 л, 900 Вт, управление - кнопки, программ - 16, поддержание температуры, отложенный старт', 4, 1),
('Электрическая плита Gorenje EF5110W', 'поверхность - эмалированная сталь, конфорок - 4 шт, духовка - 50 л, 85 см x 50 см x 60 см', 5, 2),
('Электрическая плита INDESIT IS5V5PMW/RU', 'поверхность - стеклокерамика, конфорок - 4 шт, духовка - 57 л, гриль, 85 см x 50 см x 60 см', 5, 8);

SELECT * FROM products;


DROP TABLE IF EXISTS price;
CREATE TABLE price ( 
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
product_id INT,
price DECIMAL (11,2) COMMENT 'Цена',
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (product_id) REFERENCES products (id)
) COMMENT = 'Цены';

INSERT INTO price (product_id, price) VALUES
(1, 4899.00),
(2, 4999.00),
(3, 36999.00),
(4, 36699.00),
(5, 20099.00),
(6, 24999.00),
(7, 5999.00),
(8, 9799.00),
(9, 14299.00),
(10, 24999.00);

SELECT * FROM price;


DROP TABLE IF EXISTS discounts;
CREATE TABLE discounts ( 
id INT NOT NULL AUTO_INCREMENT  PRIMARY KEY,
discounts_name VARCHAR(255) COMMENT 'Название скидки',
product_id INT,
discount INTEGER COMMENT 'Величина скидки',
started_at DATETIME,
finished_at DATETIME,
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (product_id) REFERENCES products (id)
) COMMENT = 'Скидки';

INSERT INTO discounts (discounts_name, product_id, discount, started_at, finished_at) VALUES
('Осенняя акция', 4, '0.10', '2021-10-01', '2021-11-30');

SELECT * FROM discounts;


DROP TABLE IF EXISTS city;
CREATE TABLE city ( 
id INT NOT NULL AUTO_INCREMENT  PRIMARY KEY,
country VARCHAR(255) COMMENT 'Страна',
city VARCHAR(255) COMMENT 'Город',
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Города';

INSERT INTO city (country, city) VALUES
('Россия', 'Москва'),
('Россия', 'Санкт-Петербург'),
('Россия', 'Иркутск'),
('Россия', 'Магадан'),
('Россия', 'Великий Новгород');

SELECT * FROM city;


DROP TABLE IF EXISTS stores;
CREATE TABLE stores (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
store_name VARCHAR(255) COMMENT 'Название магазина',
phone varchar(12) COMMENT 'Телефон магазина',
city_id INT,
adress varchar(100) NOT NULL COMMENT 'Адрес магазина',
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (city_id) REFERENCES city (id)
) COMMENT = 'Магазины';

INSERT INTO stores (store_name, phone, city_id, adress) VALUES
('DNS Mосква ТРЦ «БраVо»', '+74994901728', 1, 'ул. Борисовские Пруды, дом 26, корпус 2'),
('ТРЦ «РИО»', '+79523918188', 2, 'ул. Фучика, д. 2'),
('ТЦ «Версаль»', '+73952500821', 3, 'Академическая, д. 31'),
('DNS Гипер «На Дзержинского»', NULL, 4, 'Дзержинского, д. 19'),
('ТЦ «Волна»', NULL, 5, 'Большая Санкт-Петербургская, д. 39');


DROP TABLE IF EXISTS users;
CREATE TABLE users (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
first_name varchar(100) NOT NULL COMMENT 'Имя покупателя',
last_name varchar(100) NOT NULL COMMENT 'Фамилия покупателя',
birthday_at DATE COMMENT 'Дата рождения',
email varchar(100) NOT NULL COMMENT 'E-mail покупателя',
phone varchar(12) NOT NULL COMMENT 'Телефон покупателя',
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

INSERT INTO users (first_name, last_name, birthday_at, email, phone) VALUES
('Олег', 'Григорьев', '1975-04-22', 'grig777@mail.ru', '+79213456789'),
('Вера', 'Афанасьева', '1989-03-16', 'ave91@mail.ru', '+79512233222'),
('Андрей', 'Самойлов', '1987-09-07', 'samuil@yandex.ru', '+79517775566'),
('Татьяна', 'Вербова', '1994-11-22', 'totosha@gmail.com', '+79211234567'),
('Николай', 'Пашин', '1988-02-04', 'bigmak@mail.ru', '+79214567890'),
('Зоя', 'Ярвицина', '1989-12-23', 'prosto_ya@mail.ru', '+79067778822'),
('Семен', 'Зайцев', '1997-04-05', 'zaycev@gmail.com', '+79210078899'),
('Полина', 'Кириллова', '1999-06-15', 'polina.k@mail.ru', '+79056784321'),
('Евгений', 'Сомородов', '1964-05-17', 'somorodov.e.v@mail.ru', '+79063336732'),
('Олеся', 'Пачулина', '2001-01-09', 'pachulina@yandex.ru', '+79218563241');

SELECT * FROM users;


DROP TABLE IF EXISTS user_adress;
CREATE TABLE user_adress (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
user_id INT,
city_id INT,
adress varchar(100) NOT NULL COMMENT 'Адрес покупателя',
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (user_id) REFERENCES users (id),
FOREIGN KEY (city_id) REFERENCES city (id)
) COMMENT = 'Адрес покупателя';

INSERT INTO user_adress (user_id, city_id, adress) VALUES
(1, 1, 'Вяземский пр. д.6 кв.234'),
(2, 1, 'Суворовский пр. д.10 кв.567'),
(3, 4, 'ул. Якутская д.3 кв.15'),
(4, 4, 'ул. Гагарина д.16 кв.50'),
(5, 2, 'Московский д.24 к.1 кв.74'),
(6, 2, 'Литейный пр. д.13 кв.6'),
(7, 3, 'ул. Ленина д.30 кв.23'),
(8, 3, 'ул. Александра Невского д.7 кв.138'),
(9, 5, 'ул. Карла Маркса д.34 кв.21'),
(10, 5, 'ул. Ленина д.26 кв.40');

SELECT * FROM user_adress;


DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
user_id INT,
store_id INT,
product_id INT,
total INT UNSIGNED DEFAULT 1 COMMENT 'Количество заказанных товарных позиций',
summa INT,
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (user_id) REFERENCES users (id),
FOREIGN KEY (store_id) REFERENCES stores (id),
FOREIGN KEY (product_id) REFERENCES products (id)
) COMMENT = 'Заказы';

INSERT INTO orders (user_id, store_id, product_id, total) VALUES
(1, 1, 1, 1),
(2, 1, 4, 1),
(3, 4, 2, 1),
(4, 4, 5, 1),
(5, 2, 6, 1),
(6, 2, 7, 1),
(7, 3, 8, 1),
(8, 3, 9, 1),
(9, 5, 10, 1),
(10, 5, 3, 1);


DROP TABLE IF EXISTS quantity;
CREATE TABLE quantity (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
store_id INT,
product_id INT,
value INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (store_id) REFERENCES stores (id),
FOREIGN KEY (product_id) REFERENCES products (id)
) COMMENT = 'Запасы на складе';

INSERT INTO quantity (store_id, product_id, value) VALUES
(1, 1, 10),
(1, 4, 9),
(2, 6, 8),
(2, 7, 7),
(3, 8, 6),
(3, 9, 5),
(4, 2, 4),
(4, 5, 3),
(5, 10, 2),
(5, 3, 1);


DROP TABLE IF EXISTS reviews;
CREATE TABLE reviews (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
user_id INT,
product_id INT,
body TEXT NOT NULL COMMENT 'Текст отзыва',
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (user_id) REFERENCES users (id),
FOREIGN KEY (product_id) REFERENCES products (id)
) COMMENT = 'Отзывы о товаре';

INSERT INTO reviews (user_id, product_id, body) VALUES
(1, 1, 'Отличный товар!'),
(3, 2, 'Все работает'),
(8, 9, 'Характеристики товара соответствует описанию');


 SHOW TABLES;
 