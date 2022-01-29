SET search_path = dannys_diner;
SELECT customer_id, COUNT(*) AS num_orders 
FROM sales
GROUP BY sales.customer_id;