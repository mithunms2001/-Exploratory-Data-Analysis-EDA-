-- Profitability Analysis
SELECT 
    productkey, 
    product_name, 
    subcategory, 
    unit_cost_usd, 
    unit_price_usd, 
    (unit_price_usd - unit_cost_usd) AS profit_per_unit,
    ((unit_price_usd - unit_cost_usd) / unit_price_usd) * 100 AS profit_margin_percentage,
    SUM(quantity) AS total_units_sold,
    SUM(quantity * (unit_price_usd - unit_cost_usd)) AS total_profit
FROM global_electronics
GROUP BY productkey, product_name, subcategory, unit_cost_usd, unit_price_usd
ORDER BY profit_margin_percentage DESC
LIMIT 10;

-- Catagory and sub catagory analysis
SELECT 
    category, 
    subcategory, 
    SUM(quantity) AS total_units_sold, 
    SUM(quantity * unit_price_usd) AS total_sales
FROM global_electronics
GROUP BY category, subcategory
ORDER BY total_sales DESC;

-- Top 10 Most and Least Popular Products:
SELECT 
    productkey, 
    subcategory, 
    product_name, 
    SUM(quantity) AS total_quantity_sold
FROM global_electronics
GROUP BY productkey, subcategory, product_name
ORDER BY total_quantity_sold DESC
LIMIT 10;

SELECT 
    productkey, 
    subcategory, 
    product_name, 
    SUM(quantity) AS total_quantity_sold
FROM global_electronics
GROUP BY productkey, subcategory, product_name
ORDER BY total_quantity_sold ASC
LIMIT 10;
