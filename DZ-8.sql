-- 1. Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).

USE vk;
SHOW TABLES;

SELECT 	from_user_id, 
CONCAT(u.first_name, ' ', u.last_name) AS name, 
COUNT(*) AS 'messages count'
FROM messages m
JOIN users u ON u.id = m.from_user_id
WHERE to_user_id = 1
GROUP BY from_user_id
ORDER BY count(*) DESC LIMIT 1;

-- 2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..

SHOW TABLES;
SELECT * FROM users;
SELECT * FROM likes;

SELECT COUNT(*) FROM likes l
JOIN users u ON l.user_id = u.id
WHERE  (YEAR(NOW()) - YEAR (u.birthday)) < 10;

-- 3. Определить кто больше поставил лайков (всего): мужчины или женщины.

SELECT  (SELECT gender FROM users WHERE id=likes.user_id) AS gender, 
COUNT(1) AS total FROM likes 
JOIN profiles ON likes.user_id = profiles.user_id 
GROUP BY gender
ORDER BY total DESC LIMIT 1;