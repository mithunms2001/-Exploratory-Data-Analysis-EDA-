-- Analyze sales by store location
SELECT
  storekey,Country,Continent,State,
  ROUND(SUM((unit_price_usd)*quantity),2) AS total_revenue_USD
FROM
  global_electronics
GROUP BY
  storekey,Country,Continent,State
order by total_revenue_USD desc

-- Evaluate Store Performance based on Sales, Size (Square Meters), and Open Date
SELECT 
    storekey,
    SUM(quantity * unit_price_usd) AS total_sales,
    square_meters,
    open_date
FROM  global_electronics
GROUP BY storekey, square_meters, open_date
ORDER BY total_sales DESC;
