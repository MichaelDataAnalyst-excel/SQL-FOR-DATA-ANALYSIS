SELECT *
FROM salesdata;

-- Regional performance


-- Total sales per Region
SELECT Region, ROUND(SUM(Sales), 2) AS total_sales
FROM salesdata
GROUP BY Region
ORDER BY total_sales DESC;

-- Total profit for each Region
SELECT Region, ROUND(Sum(Profit) ,2) AS total_profit
FROM salesdata
GROUP BY Region
ORDER BY total_profit DESC;
-- Insight: Western region with the highest total profit and strong sales contribution is the best candidate for expansion.


-- Shipping mod Analysis


-- Number of orders
SELECT `Ship Mode`, COUNT(`Order ID`) AS number_of_orders
FROM salesdata
GROUP BY `Ship Mode`
ORDER BY number_of_orders DESC;

-- Average sales per order for each shipping mode
SELECT (`Ship Mode`), AVG(sales) AS avg_sales_per_orders
FROM orders
GROUP BY (`Ship Mode`)
ORDER BY avg_sales_per_orders DESC;
-- Insight: The standerd class shipping mode with the highest number of orders is the most popular, while same day shipping mode the one with the highest average sales per order generates the most value.




-- Customer Segment Insights

-- total profit for each segment
SELECT Segment, SUM(Profit) AS total_profit
FROM salesdata
GROUP BY Segment
ORDER BY total_profit DESC;

-- Average discount for each customer Segment.
SELECT Segment, AVG(Discount) AS avg_discount
FROM salesdata
GROUP BY Segment
ORDER BY avg_discount DESC;
-- Insight: consumer segment with the hightest average discount and Home office with lowest profit indecate that discounts are too generous and harming margins.




-- Loss-Making Sub-Categories


-- finding sub-categories where total profit is negative
SELECT `Sub-Category`, SUM(Profit) AS total_profit
FROM salesdata
GROUP BY `Sub-Category`
HAVING SUM(profit) >0
ORDER BY total_profit ASC;
-- -- Insight: 14 sub-category are losing money,"These sub-categories are losing money, and the business should consider reducing discounts, renegotiating supplier costs, or discontinuing weak products"




-- Top 5 States by Sales


-- find the top 5 states by total sales, ordered from highest to the lowest
SELECT State, SUM(sales) AS total_sales
FROM salesdata
GROUP BY State
ORDER BY total_sales DESC
LIMIT 5;
-- insight: California is the top revenue generators,Most revenue and should receive focused attention from regional managers to maximize growth.


-- High-Discount Categories


-- finding categories where the average discount is above 15%.
SELECT category,AVG(discount) AS avg_discount
FROM salesdata
GROUP BY category
HAVING AVG(Discount) > 0.15
ORDER BY avg_discount DESC;
-- Insight: Furniture and office supplies have the highest discount above 15%, this may be at risk of reduced profitability and may need discount policy review.





-- West Region Sub-Category Analysis

-- Including total sales, total profit, average profit per order, and order count for each sub-category
-- Only include sub-categories where total profit > 1000
-- Order results by total profit descending


SELECT `Sub-Category`,
round(SUM(Sales),2) AS total_sales,
ROUND(SUM(Profit),2) AS total_profit,
ROUND(AVG(Profit),2) AS avg_profit_per_order,
COUNT(`Order ID`) AS order_count
FROM salesdata
WHERE Region = 'West'
GROUP BY `Sub-Category`
HAVING SUM(Profit) >200
ORDER BY total_profit DESC;
-- insigh: Accessories is the most profitable sub-categories in the West region should be prioritized for strategic investment and growth initiatives.