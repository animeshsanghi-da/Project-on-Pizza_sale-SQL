-- Join relevant tables to find the category-wise distribution of pizzas.

SELECT 
    category, COUNT(name) AS category_count
FROM
    pizza_types
GROUP BY category
ORDER BY category_count DESC;