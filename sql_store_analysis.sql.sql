-- Always Use the USE Function to Activate a Database
USE Sql_store;

-- Check the tables in the sql_store database
SHOW tables;

-- Display the Customers Table
SELECT*
FROM customers;

-- Display the Order_item_notes Table
SELECT*
FROM order_item_notes;

-- Display the order_items Table
SELECT*
FROM order_items;

-- Display the order_statuses Table
SELECT*
FROM order_statuses;

-- Display the orders Table
SELECT*
FROM orders;

-- Display the products Table
SELECT*
FROM products;

-- Display the shippers Table
SELECT*
FROM shippers;

-- Retrieving Customers Basic Information
SELECT first_name, last_name, birth_date, points
FROM customers
ORDER BY points DESC
LIMIT 10;

-- Retrieving High Value Customers
SELECT first_name, last_name, birth_date, points
FROM customers
WHERE birth_date BETWEEN '1990-01-01' AND '2000-12-31' AND points > 1000
ORDER BY birth_date ASC, points DESC
LIMIT 5;

-- Retrieving Order Volume Analysis and Performing Agrregate Functions
SELECT COUNT(order_id) AS Count_order_id
FROM orders;

SELECT Avg(order_id) AS Avg_order_id
FROM orders;

SELECT Min(order_id) AS Min_order_id
FROM orders;

SELECT Max(order_id) AS Min_order_id
FROM orders;

-- Product Pricing Insights
SELECT MAX(unit_price) AS Most_expensive_price, MIN(unit_price) AS Cheapest_price, Avg(unit_price) AS Avg_price, std(Unit_price) AS Std_unit_price
FROM products;

-- Identifying Low stock alert
SELECT name, quantity_in_stock, unit_price
FROM products
WHERE quantity_in_stock < 50
ORDER BY quantity_in_stock ASC
LIMIT 5;

-- Identifying Order Item Analysis
SELECT SUM(quantity) AS Total_quantity, SUM(quantity*unit_price) AS Total_revenue
FROM order_items;

-- Identifying Recent High Value Orders
SELECT order_id, product_id, quantity, unit_price
FROM order_items
WHERE unit_price BETWEEN 4 AND 8
ORDER BY unit_price DESC
LIMIT 5;

-- Identifying Customer Loyalty Deep Dive
(
SELECT first_name, last_name, points
FROM customers
ORDER BY points DESC
LIMIT 1
)
UNION
(
SELECT first_name, last_name, points
FROM customers
ORDER BY points ASC
LIMIT 1
);

-- Displaying Comprehensive Business Report
SELECT
(SELECT COUNT(customer_id) FROM customers) AS Total_customers,
(SELECT COUNT(order_id) FROM orders) AS total_orders,
(SELECT AVG(points) FROM customers) AS Avg_customer_points,
(SELECT MAX(unit_price) FROM products) AS Highest_product_price,
(SELECT MIN(unit_price) FROM products) AS Earliest_order_date
LIMIT 1;

