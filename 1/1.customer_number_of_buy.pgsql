SET search_path = dannys_diner;

SELECT members.customer_id, sum(menu.price)
FROM members
JOIN sales
ON sales.customer_id = members.customer_id
JOIN menu
ON menu.product_id = sales.product_id
GROUP BY members.customer_id;