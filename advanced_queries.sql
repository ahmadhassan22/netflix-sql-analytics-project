USE netflix_db;

-- Q16: Show user names and titles they watched
SELECT u.user_name, c.title
FROM watch_history w
INNER JOIN users u
    ON w.user_id = u.user_id
INNER JOIN content c
    ON w.content_id = c.content_id;

-- Q17: Show each watch record with user_name, title, genre, watch_date, rating
SELECT u.user_name, c.title, c.genre, w.watch_date, w.rating
FROM watch_history w
INNER JOIN users u
    ON w.user_id = u.user_id
INNER JOIN content c
    ON w.content_id = c.content_id;

-- Q18: Find all users who watched Stranger Things
SELECT u.user_name, c.title
FROM watch_history w
INNER JOIN users u
    ON w.user_id = u.user_id
INNER JOIN content c
    ON w.content_id = c.content_id
WHERE c.title = 'Stranger Things';

-- Q19: Find all Premium users and the titles they watched
SELECT u.user_name AS premium_user, c.title
FROM watch_history w
INNER JOIN users u
    ON w.user_id = u.user_id
INNER JOIN content c
    ON w.content_id = c.content_id
WHERE u.subscription_type = 'Premium';

-- Q20: Show total watch time by subscription type
SELECT u.subscription_type, SUM(w.watch_time_mins) AS total_watch_time
FROM watch_history w
INNER JOIN users u
    ON w.user_id = u.user_id
GROUP BY u.subscription_type;

-- Q21: Find the top 3 most watched content titles
SELECT c.title, COUNT(*) AS watch_count
FROM watch_history w
INNER JOIN content c
    ON w.content_id = c.content_id
GROUP BY c.content_id, c.title
ORDER BY watch_count DESC
LIMIT 3;

-- Q22: Top 3 users by total watch time
SELECT u.user_name, SUM(w.watch_time_mins) AS total_watch_time
FROM watch_history w
INNER JOIN users u
    ON w.user_id = u.user_id
GROUP BY u.user_id, u.user_name
ORDER BY total_watch_time DESC
LIMIT 3;

-- Q23: Country with highest total watch activity
SELECT u.country, SUM(w.watch_time_mins) AS total_watch_activity
FROM watch_history w
INNER JOIN users u
    ON w.user_id = u.user_id
GROUP BY u.country
ORDER BY total_watch_activity DESC
LIMIT 1;

-- Q24: Content titles whose average rating is above overall average rating
SELECT c.title, AVG(w.rating) AS avg_title_rating
FROM watch_history w
INNER JOIN content c
    ON w.content_id = c.content_id
GROUP BY c.content_id, c.title
HAVING AVG(w.rating) > (
    SELECT AVG(rating)
    FROM watch_history
);

-- Q25: Find users who watched more content than the average user
SELECT u.user_name, COUNT(*) AS watched_count
FROM watch_history w
INNER JOIN users u
    ON w.user_id = u.user_id
GROUP BY u.user_id, u.user_name
HAVING COUNT(*) > (
    SELECT AVG(user_watch_count)
    FROM (
        SELECT COUNT(*) AS user_watch_count
        FROM watch_history
        GROUP BY user_id
    ) t
);

-- Q26: Rank all content titles by total watch count
SELECT c.title,
       COUNT(*) AS watch_count,
       DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS rank_by_watch_count
FROM watch_history w
INNER JOIN content c
    ON w.content_id = c.content_id
GROUP BY c.content_id, c.title;

-- Q27: Rank users by total watch time
SELECT u.user_name,
       SUM(w.watch_time_mins) AS total_watch_time,
       DENSE_RANK() OVER (ORDER BY SUM(w.watch_time_mins) DESC) AS watch_time_rank
FROM watch_history w
INNER JOIN users u
    ON w.user_id = u.user_id
GROUP BY u.user_id, u.user_name;

-- Q28: Most watched title within each genre
SELECT genre, title, watch_count, genre_rank
FROM (
    SELECT c.genre,
           c.title,
           COUNT(*) AS watch_count,
           RANK() OVER (
               PARTITION BY c.genre
               ORDER BY COUNT(*) DESC
           ) AS genre_rank
    FROM watch_history w
    INNER JOIN content c
        ON w.content_id = c.content_id
    GROUP BY c.genre, c.title
) t
WHERE genre_rank = 1;

-- Q29: Show each user’s watch history with a row number ordered by watch_date
SELECT u.user_name,
       c.title,
       w.watch_date,
       ROW_NUMBER() OVER (
           PARTITION BY u.user_id
           ORDER BY w.watch_date
       ) AS row_num
FROM watch_history w
INNER JOIN users u
    ON w.user_id = u.user_id
INNER JOIN content c
    ON w.content_id = c.content_id;

-- Q30: Second most watched content title
SELECT title, watch_count
FROM (
    SELECT c.title,
           COUNT(*) AS watch_count,
           DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS rnk
    FROM watch_history w
    INNER JOIN content c
        ON w.content_id = c.content_id
    GROUP BY c.content_id, c.title
) t
WHERE rnk = 2;