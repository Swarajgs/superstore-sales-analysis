-- CREATE TABLE SuperStore (
--     row_id         VARCHAR(30) PRIMARY KEY,
--     order_id       VARCHAR(30),
--     order_date     DATE,
--     ship_date      DATE,
--     ship_mode      VARCHAR(50),
--     customer_id    VARCHAR(30),
--     customer_name  VARCHAR(100),
--     segment        VARCHAR(50),
--     country        VARCHAR(50),
--     city           VARCHAR(100),
--     state          VARCHAR(100),
--     postal_code    VARCHAR(20),
--     region         VARCHAR(50),
--     product_id     VARCHAR(30),
--     category       VARCHAR(50),
--     sub_category   VARCHAR(50),
--     product_name   VARCHAR(255),
--     sales          DECIMAL(10, 2),
--     quantity       INT,
--     discount       DECIMAL(5, 2),
--     profit         DECIMAL(10, 2)
-- );
-- LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Datasets/SuperStore.csv'
-- INTO TABLE SuperStore
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\r\n'
-- IGNORE 1 ROWS
-- (
--   row_id,
--   order_id,
--   @order_date_var,
--   @ship_date_var,
--   ship_mode,
--   customer_id,
--   customer_name,
--   segment,
--   country,
--   city,
--   state,
--   postal_code,
--   region,
--   product_id,
--   category,
--   sub_category,
--   product_name,
--   @sales_var,
--   @quantity_var,
--   @discount_var,
--   @profit_var
-- )
-- SET
--   -- If the date variable is blank, insert NULL; otherwise, convert it
--   order_date = IF(@order_date_var = '', NULL, STR_TO_DATE(@order_date_var, '%m/%d/%Y')),
--   ship_date = IF(@ship_date_var = '', NULL, STR_TO_DATE(@ship_date_var, '%m/%d/%Y')),

--   -- If the numeric variable is blank, insert NULL; otherwise, use its value
--   sales = IF(@sales_var = '', NULL, @sales_var),
--   quantity = IF(@quantity_var = '', NULL, @quantity_var),
--   discount = IF(@discount_var = '', NULL, @discount_var),
--   profit = IF(@profit_var = '', NULL, @profit_var);
--   
SELECT COUNT(*) FROM superstore;
  
SELECT 
	SUM(sales) AS TotalSales,
	SUM(profit) AS TotalProfit,
	(SUM(profit)/SUM(sales)) * 100 AS OverallProfitMargin
FROM superstore;
SELECT
	region,
    SUM(sales) AS TotalSales,
    SUM(profit) AS TotalProfits
FROM superstore
GROUP BY region
ORDER BY TotalSales DESC;
SELECT
    state,
    SUM(sales) AS TotalSales,
    SUM(profit) AS TotalProfit
FROM SuperStore
GROUP BY state
ORDER BY TotalSales DESC
LIMIT 10; -- Showing top 10 states

SELECT 
	category,
    sub_category,
    SUM(sales) AS TOtalSales,
    SUM(profit) AS TotalProfit,
    AVG(discount) * 100 AS AverageDiscount
FROM superstore
GROUP BY category, sub_category
ORDER BY TotalProfit DESC;

SELECT 
	segment,
    SUM(sales) AS TotalSales,
    SUM(profit) AS TotalProfits
FROM superstore
GROUP BY segment
ORDER BY TotalSales DESC;
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS SalesMonth,
    SUM(sales) AS MonthlySales
FROM SuperStore
GROUP BY SalesMonth
ORDER BY SalesMonth ASC;
