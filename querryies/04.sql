-- Identify the most common pizza size ordered.

SELECT 
    pizzas.size, SUM(order_details.quantity) AS total_orders
FROM
    order_details
        JOIN
    pizzas ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizzas.size
ORDER BY total_orders DESC
LIMIT 1;