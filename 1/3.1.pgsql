SET search_path = dannys_diner;

SELECT DISTINCT on (customer_id) customer_id, product_id
FROM sales
ORDER by customer_id, order_date;