-- ============================================================
-- RetailIQ — Customer Intelligence & Revenue Optimization
-- SQL Analysis Queries
-- ============================================================


-- 1. Total Revenue
SELECT
    SUM(oi.quantity * p.price) AS total_revenue
FROM Order_Items oi
JOIN Products p
    ON oi.product_id = p.product_id;


-- 2. Total Orders
SELECT
    COUNT(DISTINCT order_id) AS total_orders
FROM Orders;


-- 3. Total Customers
SELECT
    COUNT(*) AS total_customers
FROM Customers;


-- 4. Average Order Value
SELECT
    SUM(oi.quantity * p.price) / COUNT(DISTINCT oi.order_id)
        AS average_order_value
FROM Order_Items oi
JOIN Products p
    ON oi.product_id = p.product_id;


-- 5. Top 10 Products by Revenue
SELECT
    p.product_name,
    SUM(oi.quantity * p.price) AS total_revenue
FROM Order_Items oi
JOIN Products p
    ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 10;


-- 6. Revenue by Category
SELECT
    p.category,
    SUM(oi.quantity * p.price) AS total_revenue
FROM Order_Items oi
JOIN Products p
    ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;


-- 7. Revenue by City
SELECT
    o.city,
    SUM(oi.quantity * p.price) AS total_revenue
FROM Orders o
JOIN Order_Items oi
    ON o.order_id = oi.order_id
JOIN Products p
    ON oi.product_id = p.product_id
GROUP BY o.city
ORDER BY total_revenue DESC;


-- 8. Monthly Revenue Trend
SELECT
    YEAR(o.order_date) AS order_year,
    MONTH(o.order_date) AS order_month,
    SUM(oi.quantity * p.price) AS monthly_revenue
FROM Orders o
JOIN Order_Items oi
    ON o.order_id = oi.order_id
JOIN Products p
    ON oi.product_id = p.product_id
GROUP BY
    YEAR(o.order_date),
    MONTH(o.order_date)
ORDER BY
    order_year,
    order_month;


-- 9. Revenue by Payment Method
SELECT
    o.payment_method,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM Orders o
GROUP BY o.payment_method
ORDER BY total_orders DESC;


-- 10. Customer Value Segments
SELECT
    customer_segment,
    COUNT(*) AS customer_count
FROM Customers
GROUP BY customer_segment
ORDER BY customer_count DESC;


-- ============================================================
-- End of RetailIQ SQL Analysis
-- ============================================================
