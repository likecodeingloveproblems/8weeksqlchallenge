SELECT
    dannys_diner.members.customer_id,
    count(dannys_diner.sales.customer_id) AS total_items,
    sum(dannys_diner.menu.price) as total_price
FROM
    dannys_diner.members
LEFT OUTER JOIN
    dannys_diner.sales 
ON 
    dannys_diner.sales.customer_id = dannys_diner.members.customer_id
LEFT OUTER JOIN
    dannys_diner.menu
ON
    dannys_diner.menu.product_id = dannys_diner.sales.product_id
WHERE
    dannys_diner.sales.order_date < dannys_diner.members.join_date
GROUP BY
    dannys_diner.members.customer_id;