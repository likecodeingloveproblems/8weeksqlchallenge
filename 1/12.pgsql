SELECT
    dannys_diner.sales.customer_id, 
    dannys_diner.sales.order_date,
    dannys_diner.menu.product_name,
    dannys_diner.menu.price,
    CASE
        WHEN 
            dannys_diner.sales.customer_id = dannys_diner.members.customer_id AND
            dannys_diner.sales.order_date >= dannys_diner.members.join_date
        THEN 'Y'
        ELSE 'N'
    END AS member,
    CASE
        WHEN 
            dannys_diner.sales.customer_id = dannys_diner.members.customer_id AND
            dannys_diner.sales.order_date >= dannys_diner.members.join_date
        THEN RANK() OVER (ORDER BY dannys_diner.sales.order_date)
        ELSE 0
    END AS ranking
FROM
    dannys_diner.sales
LEFT OUTER JOIN
    dannys_diner.members
ON
    dannys_diner.sales.customer_id = dannys_diner.members.customer_id
LEFT OUTER JOIN
    dannys_diner.menu
ON
    dannys_diner.menu.product_id = dannys_diner.sales.product_id
ORDER BY 
    dannys_diner.sales.customer_id,
    dannys_diner.sales.order_date,
    dannys_diner.menu.product_name;

SELECT
    DISTINCT dannys_diner.sales.order_date, 
    RANK() OVER (ORDER BY dannys_diner.sales.order_date) ranking
FROM
    dannys_diner.sales, dannys_diner.members
WHERE
    dannys_diner.sales.order_date >= dannys_diner.members.join_date AND
    dannys_diner.sales.customer_id = 'A';