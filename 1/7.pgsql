SELECT
    DISTINCT ON (dannys_diner.members.customer_id) dannys_diner.members.customer_id,
    dannys_diner.menu.product_name,
    dannys_diner.sales.order_date
FROM
    dannys_diner.members, dannys_diner.sales, dannys_diner.menu
WHERE
    dannys_diner.members.customer_id = dannys_diner.sales.customer_id AND
    dannys_diner.members.join_date > dannys_diner.sales.order_date AND
    dannys_diner.sales.product_id = dannys_diner.menu.product_id
ORDER BY
    dannys_diner.members.customer_id,
    dannys_diner.sales.product_id,
    (dannys_diner.members.join_date - dannys_diner.sales.order_date);
