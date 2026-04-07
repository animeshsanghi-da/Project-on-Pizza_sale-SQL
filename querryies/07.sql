-- Determine the distribution of orders by hour of the day.
 
SELECT 
    HOUR(order_time) AS hour, COUNT(order_id) AS no_of_orders
FROM
    orders
GROUP BY hour
ORDER BY no_of_orders DESC;