SELECT 
    dannys_diner.menu.product_name,
    count(dannys_diner.sales.product_id)
FROM 
    dannys_diner.sales, dannys_diner.menu
WHERE
    dannys_diner.sales.product_id = dannys_diner.menu.product_id
GROUP BY 
    dannys_diner.menu.product_name
LIMIT 1;