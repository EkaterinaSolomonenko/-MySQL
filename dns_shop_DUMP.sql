-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: dns_shop
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `catalog`
--

DROP TABLE IF EXISTS `catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT 'Название раздела',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Разделы интернет-магазина';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog`
--

LOCK TABLES `catalog` WRITE;
/*!40000 ALTER TABLE `catalog` DISABLE KEYS */;
INSERT INTO `catalog` VALUES (1,'Микроволновые печи','2021-10-09 12:07:49','2021-10-09 12:07:49'),(2,'Холодильники','2021-10-09 12:07:49','2021-10-09 12:07:49'),(3,'Посудомоечные машины','2021-10-09 12:07:49','2021-10-09 12:07:49'),(4,'Мультиварки','2021-10-09 12:07:49','2021-10-09 12:07:49'),(5,'Плиты электрические','2021-10-09 12:07:49','2021-10-09 12:07:49');
/*!40000 ALTER TABLE `catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `id` int NOT NULL AUTO_INCREMENT,
  `country` varchar(255) DEFAULT NULL COMMENT 'Страна',
  `city` varchar(255) DEFAULT NULL COMMENT 'Город',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Города';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Россия','Москва','2021-10-09 12:07:55','2021-10-09 12:07:55'),(2,'Россия','Санкт-Петербург','2021-10-09 12:07:55','2021-10-09 12:07:55'),(3,'Россия','Иркутск','2021-10-09 12:07:55','2021-10-09 12:07:55'),(4,'Россия','Магадан','2021-10-09 12:07:55','2021-10-09 12:07:55'),(5,'Россия','Великий Новгород','2021-10-09 12:07:55','2021-10-09 12:07:55');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `discounts_name` varchar(255) DEFAULT NULL COMMENT 'Название скидки',
  `product_id` int DEFAULT NULL,
  `discount` int DEFAULT NULL COMMENT 'Величина скидки',
  `started_at` datetime DEFAULT NULL,
  `finished_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `discounts_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Скидки';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
INSERT INTO `discounts` VALUES (1,'Осенняя акция',4,0,'2021-10-01 00:00:00','2021-11-30 00:00:00','2021-10-09 12:07:55','2021-10-09 12:07:55');
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturers`
--

DROP TABLE IF EXISTS `manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `manufacturer_name` varchar(255) DEFAULT NULL COMMENT 'Название производителя',
  `country` varchar(100) NOT NULL COMMENT 'Страна производителя',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Производители техники';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturers`
--

LOCK TABLES `manufacturers` WRITE;
/*!40000 ALTER TABLE `manufacturers` DISABLE KEYS */;
INSERT INTO `manufacturers` VALUES (1,'Bosch','Китай','2021-10-09 12:07:50','2021-10-09 12:07:50'),(2,'Gorenje','Китай','2021-10-09 12:07:50','2021-10-09 12:07:50'),(3,'Hyundai','Китай','2021-10-09 12:07:50','2021-10-09 12:07:50'),(4,'Hotpoint-Ariston','Китай','2021-10-09 12:07:50','2021-10-09 12:07:50'),(5,'Samsung','Китай','2021-10-09 12:07:50','2021-10-09 12:07:50'),(6,'LG','Китай','2021-10-09 12:07:50','2021-10-09 12:07:50'),(7,'Electrolux','Китай','2021-10-09 12:07:50','2021-10-09 12:07:50'),(8,'Indesit','Польша','2021-10-09 12:07:50','2021-10-09 12:07:50'),(9,'Tefal','Китай','2021-10-09 12:07:50','2021-10-09 12:07:50'),(10,'Hyundai','Турция','2021-10-09 12:07:50','2021-10-09 12:07:50');
/*!40000 ALTER TABLE `manufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `store_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `total` int unsigned DEFAULT '1' COMMENT 'Количество заказанных товарных позиций',
  `summa` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `store_id` (`store_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Заказы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1,1,1,NULL,'2021-10-09 12:08:01','2021-10-09 12:08:01'),(2,2,1,4,1,NULL,'2021-10-09 12:08:01','2021-10-09 12:08:01'),(3,3,4,2,1,NULL,'2021-10-09 12:08:01','2021-10-09 12:08:01'),(4,4,4,5,1,NULL,'2021-10-09 12:08:01','2021-10-09 12:08:01'),(5,5,2,6,1,NULL,'2021-10-09 12:08:01','2021-10-09 12:08:01'),(6,6,2,7,1,NULL,'2021-10-09 12:08:01','2021-10-09 12:08:01'),(7,7,3,8,1,NULL,'2021-10-09 12:08:01','2021-10-09 12:08:01'),(8,8,3,9,1,NULL,'2021-10-09 12:08:01','2021-10-09 12:08:01'),(9,9,5,10,1,NULL,'2021-10-09 12:08:01','2021-10-09 12:08:01'),(10,10,5,3,1,NULL,'2021-10-09 12:08:01','2021-10-09 12:08:01');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price`
--

DROP TABLE IF EXISTS `price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `price` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `price` decimal(11,2) DEFAULT NULL COMMENT 'Цена',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `price_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Цены';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price`
--

LOCK TABLES `price` WRITE;
/*!40000 ALTER TABLE `price` DISABLE KEYS */;
INSERT INTO `price` VALUES (1,1,4899.00,'2021-10-09 12:07:53','2021-10-09 12:07:53'),(2,2,4999.00,'2021-10-09 12:07:53','2021-10-09 12:07:53'),(3,3,36999.00,'2021-10-09 12:07:53','2021-10-09 12:07:53'),(4,4,36699.00,'2021-10-09 12:07:53','2021-10-09 12:07:53'),(5,5,20099.00,'2021-10-09 12:07:53','2021-10-09 12:07:53'),(6,6,24999.00,'2021-10-09 12:07:53','2021-10-09 12:07:53'),(7,7,5999.00,'2021-10-09 12:07:53','2021-10-09 12:07:53'),(8,8,9799.00,'2021-10-09 12:07:53','2021-10-09 12:07:53'),(9,9,14299.00,'2021-10-09 12:07:53','2021-10-09 12:07:53'),(10,10,24999.00,'2021-10-09 12:07:53','2021-10-09 12:07:53');
/*!40000 ALTER TABLE `price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT 'Название товара',
  `description` text COMMENT 'Описание',
  `catalog_id` int DEFAULT NULL,
  `manufacturers_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `catalog_id` (`catalog_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`catalog_id`) REFERENCES `catalog` (`id`),
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`manufacturers_id`) REFERENCES `manufacturers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Товарные позиции';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Микроволновая печь Hyundai HYM-M2059','20 л, 700 Вт, переключатели - поворотный механизм, 48 см x 28 см x 38 см',1,3,'2021-10-09 12:07:52','2021-10-09 12:07:52'),(2,'Микроволновая печь Hotpoint-Ariston MWHR 3101','20 л, 700 Вт, переключатели - поворотный механизм, 45.2 см x 26.2 см x 36.5 см',1,4,'2021-10-09 12:07:52','2021-10-09 12:07:52'),(3,'Холодильник с морозильником Bosch KGN39UW25R','388 л, размораживание - No Frost, дисплей, 60 см х 203 см х 66 см',2,1,'2021-10-09 12:07:52','2021-10-09 12:07:52'),(4,'Холодильник с морозильником Samsung RB30A30N0WW/WT','311 л, внешнее покрытие-металл, размораживание - No Frost, дисплей, 59.5 см х 178 см х 67.5 см',2,5,'2021-10-09 12:07:52','2021-10-09 12:07:52'),(5,'Посудомоечная машина Electrolux ESF2400OH','расход воды - 6.5 л, вместимость - 6 комплектов, дисплей, защита от протечек, 43.8 см x 55 см x 50 см',3,7,'2021-10-09 12:07:52','2021-10-09 12:07:52'),(6,'Посудомоечная машина Indesit DSCFE 1B10 RU','расход воды - 11.5 л, вместимость - 10 комплектов, 85 см x 45 см x 59 см',3,8,'2021-10-09 12:07:52','2021-10-09 12:07:52'),(7,'Мультиварка Tefal RK815832','5 л, 750 Вт, управление - кнопки, программ - 42, поддержание температуры, отложенный старт',4,9,'2021-10-09 12:07:52','2021-10-09 12:07:52'),(8,'Мультиварка Bosch MUC11W12RU','5 л, 900 Вт, управление - кнопки, программ - 16, поддержание температуры, отложенный старт',4,1,'2021-10-09 12:07:52','2021-10-09 12:07:52'),(9,'Электрическая плита Gorenje EF5110W','поверхность - эмалированная сталь, конфорок - 4 шт, духовка - 50 л, 85 см x 50 см x 60 см',5,2,'2021-10-09 12:07:52','2021-10-09 12:07:52'),(10,'Электрическая плита INDESIT IS5V5PMW/RU','поверхность - стеклокерамика, конфорок - 4 шт, духовка - 57 л, гриль, 85 см x 50 см x 60 см',5,8,'2021-10-09 12:07:52','2021-10-09 12:07:52');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quantity`
--

DROP TABLE IF EXISTS `quantity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quantity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `store_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `value` int unsigned DEFAULT NULL COMMENT 'Запас товарной позиции на складе',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `quantity_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`),
  CONSTRAINT `quantity_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Запасы на складе';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quantity`
--

LOCK TABLES `quantity` WRITE;
/*!40000 ALTER TABLE `quantity` DISABLE KEYS */;
INSERT INTO `quantity` VALUES (1,1,1,10,'2021-10-09 12:08:03','2021-10-09 12:08:03'),(2,1,4,9,'2021-10-09 12:08:03','2021-10-09 12:08:03'),(3,2,6,8,'2021-10-09 12:08:03','2021-10-09 12:08:03'),(4,2,7,7,'2021-10-09 12:08:03','2021-10-09 12:08:03'),(5,3,8,6,'2021-10-09 12:08:03','2021-10-09 12:08:03'),(6,3,9,5,'2021-10-09 12:08:03','2021-10-09 12:08:03'),(7,4,2,4,'2021-10-09 12:08:03','2021-10-09 12:08:03'),(8,4,5,3,'2021-10-09 12:08:03','2021-10-09 12:08:03'),(9,5,10,2,'2021-10-09 12:08:03','2021-10-09 12:08:03'),(10,5,3,1,'2021-10-09 12:08:03','2021-10-09 12:08:03');
/*!40000 ALTER TABLE `quantity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `body` text NOT NULL COMMENT 'Текст отзыва',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Отзывы о товаре';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,1,1,'Отличный товар!','2021-10-09 12:08:04','2021-10-09 12:08:04'),(2,3,2,'Все работает','2021-10-09 12:08:04','2021-10-09 12:08:04'),(3,8,9,'Характеристики товара соответствует описанию','2021-10-09 12:08:04','2021-10-09 12:08:04');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Название магазина',
  `phone` varchar(12) DEFAULT NULL COMMENT 'Телефон магазина',
  `city_id` int DEFAULT NULL,
  `adress` varchar(100) NOT NULL COMMENT 'Адрес магазина',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `stores_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Магазины';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` VALUES (1,'DNS Mосква ТРЦ «БраVо»','+74994901728',1,'ул. Борисовские Пруды, дом 26, корпус 2','2021-10-09 12:07:57','2021-10-09 12:07:57'),(2,'ТРЦ «РИО»','+79523918188',2,'ул. Фучика, д. 2','2021-10-09 12:07:57','2021-10-09 12:07:57'),(3,'ТЦ «Версаль»','+73952500821',3,'Академическая, д. 31','2021-10-09 12:07:57','2021-10-09 12:07:57'),(4,'DNS Гипер «На Дзержинского»',NULL,4,'Дзержинского, д. 19','2021-10-09 12:07:57','2021-10-09 12:07:57'),(5,'ТЦ «Волна»',NULL,5,'Большая Санкт-Петербургская, д. 39','2021-10-09 12:07:57','2021-10-09 12:07:57');
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_adress`
--

DROP TABLE IF EXISTS `user_adress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_adress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  `adress` varchar(100) NOT NULL COMMENT 'Адрес покупателя',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `user_adress_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `user_adress_ibfk_2` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Адрес покупателя';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_adress`
--

LOCK TABLES `user_adress` WRITE;
/*!40000 ALTER TABLE `user_adress` DISABLE KEYS */;
INSERT INTO `user_adress` VALUES (1,1,1,'Вяземский пр. д.6 кв.234','2021-10-09 12:08:00','2021-10-09 12:08:00'),(2,2,1,'Суворовский пр. д.10 кв.567','2021-10-09 12:08:00','2021-10-09 12:08:00'),(3,3,4,'ул. Якутская д.3 кв.15','2021-10-09 12:08:00','2021-10-09 12:08:00'),(4,4,4,'ул. Гагарина д.16 кв.50','2021-10-09 12:08:00','2021-10-09 12:08:00'),(5,5,2,'Московский д.24 к.1 кв.74','2021-10-09 12:08:00','2021-10-09 12:08:00'),(6,6,2,'Литейный пр. д.13 кв.6','2021-10-09 12:08:00','2021-10-09 12:08:00'),(7,7,3,'ул. Ленина д.30 кв.23','2021-10-09 12:08:00','2021-10-09 12:08:00'),(8,8,3,'ул. Александра Невского д.7 кв.138','2021-10-09 12:08:00','2021-10-09 12:08:00'),(9,9,5,'ул. Карла Маркса д.34 кв.21','2021-10-09 12:08:00','2021-10-09 12:08:00'),(10,10,5,'ул. Ленина д.26 кв.40','2021-10-09 12:08:00','2021-10-09 12:08:00');
/*!40000 ALTER TABLE `user_adress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL COMMENT 'Имя покупателя',
  `last_name` varchar(100) NOT NULL COMMENT 'Фамилия покупателя',
  `birthday_at` date DEFAULT NULL COMMENT 'Дата рождения',
  `email` varchar(100) NOT NULL COMMENT 'E-mail покупателя',
  `phone` varchar(12) NOT NULL COMMENT 'Телефон покупателя',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Покупатели';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Олег','Григорьев','1975-04-22','grig777@mail.ru','+79213456789','2021-10-09 12:07:58','2021-10-09 12:07:58'),(2,'Вера','Афанасьева','1989-03-16','ave91@mail.ru','+79512233222','2021-10-09 12:07:58','2021-10-09 12:07:58'),(3,'Андрей','Самойлов','1987-09-07','samuil@yandex.ru','+79517775566','2021-10-09 12:07:58','2021-10-09 12:07:58'),(4,'Татьяна','Вербова','1994-11-22','totosha@gmail.com','+79211234567','2021-10-09 12:07:58','2021-10-09 12:07:58'),(5,'Николай','Пашин','1988-02-04','bigmak@mail.ru','+79214567890','2021-10-09 12:07:58','2021-10-09 12:07:58'),(6,'Зоя','Ярвицина','1989-12-23','prosto_ya@mail.ru','+79067778822','2021-10-09 12:07:58','2021-10-09 12:07:58'),(7,'Семен','Зайцев','1997-04-05','zaycev@gmail.com','+79210078899','2021-10-09 12:07:58','2021-10-09 12:07:58'),(8,'Полина','Кириллова','1999-06-15','polina.k@mail.ru','+79056784321','2021-10-09 12:07:58','2021-10-09 12:07:58'),(9,'Евгений','Сомородов','1964-05-17','somorodov.e.v@mail.ru','+79063336732','2021-10-09 12:07:58','2021-10-09 12:07:58'),(10,'Олеся','Пачулина','2001-01-09','pachulina@yandex.ru','+79218563241','2021-10-09 12:07:58','2021-10-09 12:07:58');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-09 12:27:54
