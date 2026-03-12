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


The project uses a relational schema with three tables:

Users → stores user information  
Content → stores movies and series metadata  
Watch_History → stores viewing activity and ratings

Relationships:

Users (1) → (Many) Watch_History  
Content (1) → (Many) Watch_History

## How to Run

1. Open MySQL Workbench / DB Browser / compatible SQL environment
2. Run `database_setup.sql`
3. Run `basic_queries.sql`
4. Run `advanced_queries.sql`

## Purpose

This project was built as part of my SQL learning journey to practice real interview-style database questions and strengthen my portfolio for data, analytics, and AI-related roles.

## Key Insights

Using SQL queries on the Netflix-style dataset, several insights were discovered:

• Premium users generate the highest total watch time.
• Sci-Fi and Action genres appear among the most watched categories.
• A small group of users contributes a large portion of watch activity.
• Certain titles consistently receive higher ratings across viewers.

These types of analyses demonstrate how SQL can be used to extract meaningful insights from relational databases.

## Example Analysis Questions

This project answers real analytics questions such as:

• What are the most watched titles?
• Which users spend the most time watching content?
• Which genre has the highest engagement?
• What content receives the highest ratings?
• Which users watch more content than average?

## Author

Ahmad Hassan
