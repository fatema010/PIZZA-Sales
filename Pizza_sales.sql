create database pizzadb;
use pizzadb;
select * from pizza_sales_data;
#Total Revenue:
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales_data;

#Average Order Value:

SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales_data;

# Total Pizzas Sold
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales_data;

#Total Orders:
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales_data;

#Average Pizzas Per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales_data;

# Daily total orders:

SELECT DATE(order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales_data
WHERE MONTH(order_date) = 4
GROUP BY DATE(order_date);

#Hourly Trend for Orders:

SELECT DATEPART(order_time) as order_hours, COUNT(DISTINCT order_id) as total_orders
from pizza_sales_data
group by DATE(order_time)
order by DATE(order_time);


# % of Sales by Pizza Category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales_data) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales_data
GROUP BY pizza_category;

# % of Sales by Pizza Size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales_data) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales_data
GROUP BY pizza_size
ORDER BY pizza_size;

#Total Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales_data
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

#Top 5 Best Sellers by Total Pizzas Sold
SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales_data
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC;

# Bottom 5 Best Sellers by Total Pizzas Sold
SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales_data
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC;


select * from pizza_sales_data;


















