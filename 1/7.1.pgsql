SELECT
    dannys_diner.sales.customer_id,
    dannys_diner.sales.order_date,
    dannys_diner.menu.product_name
FROM
    dannys_diner.sales
RIGHT OUTER JOIN   
    (SELECT
        DISTINCT ON (dannys_diner.members.customer_id) dannys_diner.members.customer_id,
        dannys_diner.sales.order_date
    FROM
        dannys_diner.members, dannys_diner.sales
    WHERE
        dannys_diner.members.customer_id = dannys_diner.sales.customer_id AND
        dannys_diner.members.join_date > dannys_diner.sales.order_date
    ORDER BY
        dannys_diner.members.customer_id,
        dannys_diner.sales.product_id,
        (dannys_diner.members.join_date - dannys_diner.sales.order_date)
        ) AS sales_join
ON 
    sales_join.customer_id = dannys_diner.sales.customer_id AND
    sales_join.order_date = dannys_diner.sales.order_date
LEFT OUTER JOIN
    dannys_diner.menu
ON
    dannys_diner.sales.product_id = dannys_diner.menu.product_id;