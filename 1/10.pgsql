SELECT
    sales.customer_id,
    sum(sales.point) as point
FROM
    (SELECT
        dannys_diner.sales.*,
        CASE
            WHEN dannys_diner.sales.order_date - dannys_diner.members.join_date >= 7 THEN dannys_diner.menu.price * 20
            WHEN 
                dannys_diner.sales.order_date - dannys_diner.members.join_date < 7 AND dannys_diner.menu.product_name = 'sushi'
            THEN dannys_diner.menu.price * 20
            ELSE dannys_diner.menu.price * 10
        END AS point
    FROM
        dannys_diner.sales
    right outer join
        dannys_diner.members
    on
        dannys_diner.sales.customer_id = dannys_diner.members.customer_id
    LEFT OUTER JOIN
        dannys_diner.menu
    on
        dannys_diner.sales.product_id = dannys_diner.menu.product_id) as sales
GROUP by sales.customer_id;