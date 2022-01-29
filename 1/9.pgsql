SELECT
    dannys_diner.sales.customer_id,
    sum(menu.point)
FROM
    (    
    SELECT
        dannys_diner.menu.*,
        CASE
            WHEN dannys_diner.menu.product_name = 'sushi' THEN dannys_diner.menu.price * 20
            ELSE dannys_diner.menu.price * 10
        END AS point
    FROM
        dannys_diner.menu
    ) AS menu, 
    dannys_diner.sales
WHERE
    dannys_diner.sales.product_id = menu.product_id
GROUP BY
    dannys_diner.sales.customer_id;
