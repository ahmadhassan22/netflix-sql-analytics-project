CREATE DATABASE netflix_db;
USE netflix_db;

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(50),
    country VARCHAR(50),
    subscription_type VARCHAR(20),
    join_date DATE
);

CREATE TABLE content (
    content_id INT PRIMARY KEY,
    title VARCHAR(100),
    genre VARCHAR(50),
    content_type VARCHAR(20),   -- Movie or Series
    release_year INT,
    duration_mins INT
);

CREATE TABLE watch_history (
    watch_id INT PRIMARY KEY,
    user_id INT,
    content_id INT,
    watch_date DATE,
    watch_time_mins INT,
    rating INT,                 -- rating given by user: 1 to 5
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (content_id) REFERENCES content(content_id)
);

INSERT INTO users VALUES
(1, 'Alice', 'USA', 'Premium', '2023-01-15'),
(2, 'Bob', 'India', 'Basic', '2023-02-10'),
(3, 'Charlie', 'UK', 'Standard', '2023-03-05'),
(4, 'David', 'Canada', 'Premium', '2023-01-25'),
(5, 'Emma', 'India', 'Premium', '2023-04-12'),
(6, 'Frank', 'USA', 'Basic', '2023-05-20'),
(7, 'Grace', 'Germany', 'Standard', '2023-02-18'),
(8, 'Hannah', 'India', 'Premium', '2023-06-01');

INSERT INTO content VALUES
(101, 'Stranger Things', 'Sci-Fi', 'Series', 2016, 50),
(102, 'Money Heist', 'Thriller', 'Series', 2017, 45),
(103, 'The Irishman', 'Crime', 'Movie', 2019, 209),
(104, 'Wednesday', 'Fantasy', 'Series', 2022, 48),
(105, 'Extraction', 'Action', 'Movie', 2020, 116),
(106, 'Dark', 'Sci-Fi', 'Series', 2017, 53),
(107, 'Lupin', 'Mystery', 'Series', 2021, 42),
(108, 'Red Notice', 'Action', 'Movie', 2021, 118),
(109, 'The Crown', 'Drama', 'Series', 2016, 58),
(110, 'All Quiet on the Western Front', 'War', 'Movie', 2022, 147);

INSERT INTO watch_history VALUES
(1, 1, 101, '2024-01-05', 50, 5),
(2, 1, 102, '2024-01-07', 45, 4),
(3, 2, 105, '2024-01-08', 116, 5),
(4, 2, 108, '2024-01-10', 118, 4),
(5, 3, 101, '2024-01-12', 50, 5),
(6, 3, 106, '2024-01-13', 53, 5),
(7, 4, 103, '2024-01-14', 209, 4),
(8, 4, 109, '2024-01-15', 58, 5),
(9, 5, 104, '2024-01-16', 48, 4),
(10, 5, 105, '2024-01-17', 116, 5),
(11, 5, 101, '2024-01-19', 50, 5),
(12, 6, 108, '2024-01-20', 118, 3),
(13, 6, 102, '2024-01-21', 45, 4),
(14, 7, 106, '2024-01-22', 53, 5),
(15, 7, 107, '2024-01-23', 42, 4),
(16, 8, 101, '2024-01-24', 50, 5),
(17, 8, 104, '2024-01-25', 48, 4),
(18, 8, 110, '2024-01-26', 147, 5),
(19, 2, 101, '2024-01-27', 50, 4),
(20, 3, 102, '2024-01-28', 45, 5),
(21, 4, 105, '2024-01-29', 116, 4),
(22, 1, 109, '2024-01-30', 58, 5),
(23, 5, 106, '2024-02-01', 53, 4),
(24, 6, 103, '2024-02-02', 209, 4),
(25, 7, 104, '2024-02-03', 48, 5);