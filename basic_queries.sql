USE netflix_db;

-- Q1: List all users
SELECT * FROM users;

-- Q2: Show all content released after 2020
SELECT * 
FROM content
WHERE release_year > 2020;

-- Q3: Find all movies only
SELECT * 
FROM content
WHERE content_type = 'Movie';

-- Q4: Show all users from India
SELECT * 
FROM users
WHERE country = 'India';

-- Q5: Count total number of users
SELECT COUNT(user_id) AS total_users
FROM users;

-- Q6: Count total number of content titles
SELECT COUNT(title) AS total_titles
FROM content;

-- Q7: Find the average duration of all content
SELECT AVG(duration_mins) AS avg_duration
FROM content;

-- Q8: Find the longest movie
SELECT title, duration_mins
FROM content
WHERE content_type = 'Movie'
ORDER BY duration_mins DESC
LIMIT 1;

-- Q9: Count how many users belong to each subscription type
SELECT subscription_type, COUNT(*) AS subscription_count
FROM users
GROUP BY subscription_type;

-- Q10: Count how many content titles exist in each genre
SELECT genre, COUNT(*) AS content_title_count
FROM content
GROUP BY genre
ORDER BY content_title_count DESC;

-- Q11: Find total watch time per user
SELECT user_id, SUM(watch_time_mins) AS total_watch_time
FROM watch_history
GROUP BY user_id;

-- Q12: Find total watch count per content title
SELECT c.title, COUNT(*) AS watch_count
FROM watch_history w
INNER JOIN content c
    ON w.content_id = c.content_id
GROUP BY c.content_id, c.title
ORDER BY watch_count DESC;

-- Q13: Find average rating for each content title
SELECT c.title, AVG(w.rating) AS avg_rating
FROM watch_history w
INNER JOIN content c
    ON w.content_id = c.content_id
GROUP BY c.content_id, c.title
ORDER BY avg_rating DESC;

-- Q14: Show genres with more than 1 content title
SELECT genre, COUNT(*) AS total_titles
FROM content
GROUP BY genre
HAVING COUNT(*) > 1;

-- Q15: Find the most watched genre
SELECT c.genre, COUNT(*) AS watch_count
FROM watch_history w
INNER JOIN content c
    ON w.content_id = c.content_id
GROUP BY c.genre
ORDER BY watch_count DESC
LIMIT 1;