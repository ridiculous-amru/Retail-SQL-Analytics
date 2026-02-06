
-- =======================================
-- ANALYSIS QUERIES: Retail Sales Analytics
-- =======================================

-- 1. Total Orders & Total Revenue
SELECT 
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.total_amount) AS total_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id;

-- 2. Monthly Sales Trend
SELECT
    DATE_TRUNC('month', o.order_date) AS month,
    SUM(oi.total_amount) AS monthly_sales
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;

-- 3. Top 10 Customers by Revenue
SELECT
    c.customer_name,
    SUM(oi.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 10;

-- 4. Category-wise Sales
SELECT
    p.category,
    SUM(oi.total_amount) AS category_sales
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY category_sales DESC;

-- 5. Repeat Customers
SELECT
    customer_id,
    COUNT(order_id) AS order_count
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1;

-- 6. Top Product per Category (Window Function)
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

-- 7. Running Total of Sales
SELECT
    o.order_date,
    SUM(oi.total_amount) AS daily_sales,
    SUM(SUM(oi.total_amount)) OVER (ORDER BY o.order_date) AS running_total
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_date
ORDER BY o.order_date;

-- 8. Orders with Returns
SELECT
    o.order_id,
    r.return_reason,
    r.return_date
FROM orders o
JOIN returns r ON o.order_id = r.order_id;
