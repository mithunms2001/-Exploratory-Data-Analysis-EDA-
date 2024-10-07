-- Demographic Distribution
SELECT 
    gender,                                
    COUNT(customerkey) AS customer_count,       
    FLOOR(DATEDIFF(CURDATE(), birthday) / 365) AS age, 
    city,                                       
    state,                                      
    country,                                    
    continent                                 
FROM global_electronics
GROUP BY gender, age, city, state, country, continent
ORDER BY customer_count DESC;

-- Frequency of Purchases (Number of Orders per Customer)
SELECT 
    customerkey, 
    COUNT(DISTINCT order_number) AS total_orders,  
    AVG(COUNT(DISTINCT order_number)) OVER () AS avg_order_frequency
FROM   global_electronics
GROUP BY customerkey
ORDER BY total_orders DESC;
