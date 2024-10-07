-- Overall Sales Performance Over Time
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(quantity * unit_price_usd) AS total_sales
FROM global_electronics
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

-- top performers in terms of quantity sold and revenue generated
SELECT
    productkey, 
    product_name,  
    subcategory, 
    SUM(quantity) AS total_units_sold,
    SUM(quantity * unit_price_usd) AS total_revenue
FROM global_electronics
GROUP BY productkey, product_name, subcategory
ORDER BY total_revenue DESC
LIMIT 10;

-- Sales by Currency 
SELECT 
    currency_code,                          
    SUM(quantity * unit_price_usd) AS total_sales_local_currency,  
    SUM(quantity * unit_price_usd * exchange) AS total_sales_usd   
FROM global_electronics
GROUP BY currency_code
ORDER BY total_sales_usd DESC;

-- Top 10 Stores by Total Sales
SELECT 
    storekey, 
    country, 
    state, 
    SUM(quantity) AS total_units_sold,
    SUM(quantity * unit_price_usd) AS total_sales
FROM global_electronics
GROUP BY storekey, country, state
ORDER BY total_sales DESC
LIMIT 10;
