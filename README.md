# Netflix SQL Project

A beginner-friendly SQL project built using a Netflix-style database.  
This project demonstrates SQL skills including:

- Database creation
- Table relationships using primary and foreign keys
- Data insertion
- Filtering and sorting
- Aggregation and GROUP BY
- JOIN operations
- Subqueries
- Window functions
- Ranking and analytical queries

## Project Structure

- `database_setup.sql` → creates the database, tables, and inserts sample data
- `basic_queries.sql` → beginner to intermediate SQL queries
- `advanced_queries.sql` → JOINs, subqueries, and window function queries

## Database Schema

### Tables
1. **users**
   - user_id
   - user_name
   - country
   - subscription_type
   - join_date

2. **content**
   - content_id
   - title
   - genre
   - content_type
   - release_year
   - duration_mins

3. **watch_history**
   - watch_id
   - user_id
   - content_id
   - watch_date
   - watch_time_mins
   - rating

## SQL Concepts Used

- `CREATE DATABASE`
- `CREATE TABLE`
- `INSERT INTO`
- `SELECT`
- `WHERE`
- `ORDER BY`
- `GROUP BY`
- `HAVING`
- `JOIN`
- Subqueries
- `ROW_NUMBER()`
- `RANK()`
- `DENSE_RANK()`

## How to Run

1. Open MySQL Workbench / DB Browser / compatible SQL environment
2. Run `database_setup.sql`
3. Run `basic_queries.sql`
4. Run `advanced_queries.sql`

## Purpose

This project was built as part of my SQL learning journey to practice real interview-style database questions and strengthen my portfolio for data, analytics, and AI-related roles.

## Author

Ahmad Hassan