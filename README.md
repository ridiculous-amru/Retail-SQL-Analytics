📊 Retail Sales Analytics using PostgreSQL (Large Dataset)
📌 Project Overview

This project focuses on end-to-end analysis of a large-scale retail / e-commerce dataset using PostgreSQL.
The goal is to simulate a real-world data analyst workflow, from database design to business-driven insights.

The project uses multiple relational tables and 10,000+ records to analyze sales performance, customer behavior, and product trends.

🎯 Business Objectives

Analyze overall and monthly sales performance

Identify top customers and products

Understand category-wise revenue contribution

Detect repeat customers

Apply advanced SQL concepts for analytics

🛠 Tools & Technologies

Database: PostgreSQL

Language: SQL

Concepts Used:

JOINS (INNER, LEFT)

GROUP BY & HAVING

Subqueries

CASE WHEN

Window Functions (RANK, PARTITION BY)

CTEs (WITH clause)

🗂 Database Schema

The project uses a normalized schema with the following tables:

1️⃣ customers

customer_id (PK)

customer_name

gender

city

state

signup_date

2️⃣ products

product_id (PK)

product_name

category

price

3️⃣ orders

order_id (PK)

customer_id (FK)

order_date

payment_mode

4️⃣ order_items (Fact Table)

order_item_id (PK)

order_id (FK)

product_id (FK)

quantity

total_amount

5️⃣ returns

return_id (PK)

order_id (FK)

return_reason

return_date

📈 Dataset Size

Customers: ~2,000

Products: ~200

Orders: ~5,000

Order Items: ~12,000

Total Records: 10,000+

Data is generated using PostgreSQL functions to simulate realistic business scenarios.

🔍 Key Business Questions Answered
✔ Total & Monthly Sales Trend

Analyze overall revenue

Track month-over-month sales growth

✔ Top Customers by Revenue

Identify high-value customers contributing most to sales

✔ Category-wise Sales Analysis

Understand which product categories drive revenue

✔ Repeat Customer Analysis

Detect customers with multiple purchases

✔ Top Product per Category

Rank products using Window Functions

🧠 Sample Advanced Query
SELECT category, product_name, sales
FROM (
    SELECT
        p.category,
        p.product_name,
        SUM(oi.total_amount) AS sales,
        RANK() OVER (PARTITION BY p.category ORDER BY SUM(oi.total_amount) DESC) AS rnk
    FROM products p
    JOIN order_items oi ON p.product_id = oi.product_id
    GROUP BY p.category, p.product_name
) t
WHERE rnk = 1;

📊 Key Insights

A small percentage of customers generate a large share of total revenue

Electronics and Fashion categories dominate sales

Repeat customers play a critical role in revenue stability

Window functions simplify complex ranking problems

📁 Project Structure
Retail-SQL-Analytics
│
├── README.md
├── schema.sql
├── data_generation.sql
├── analysis_queries.sql
└── insights.md

🚀 What This Project Demonstrates

✔ Ability to work with large datasets
✔ Strong understanding of relational databases
✔ Real-world SQL problem-solving skills
✔ Clean, readable, and optimized SQL queries
✔ Portfolio-ready project for Data Analyst roles

🔮 Future Enhancements

Create Power BI dashboard using this dataset

Add query performance optimization & indexing

Extend analysis to returns & profitability

Deploy database on cloud (AWS / Azure)

👤 Author

Amardeep Gautam
Aspiring Data Analyst
Skills: Excel | SQL | Power BI | PostgreSQL | Data Analysis
