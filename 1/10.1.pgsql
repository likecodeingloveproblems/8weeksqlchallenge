-- first write to the two condition selects
-- then i use them in the main condition

-- SELECT
--     dannys_diner.menu.*,
--     dannys_diner.menu.price * 20 AS point
-- FROM
--     dannys_diner.menu;


-- SELECT
--     dannys_diner.menu.*,
--     CASE
--         WHEN dannys_diner.menu.product_name = 'sushi' THEN dannys_diner.menu.price * 20
--         ELSE dannys_diner.menu.price * 10
--     END AS point
-- FROM
--     dannys_diner.menu;

-- but why is this code soo slow?

SELECT
    dannys_diner.sales.customer_id,
    sum(CASE
        WHEN dannys_diner.sales.order_date - dannys_diner.members.join_date >= 7 
        THEN 
            (SELECT
                dannys_diner.menu.price * 20 AS point
            FROM
                dannys_diner.menu
            WHERE
                dannys_diner.menu.product_id = dannys_diner.sales.product_id)
        ELSE 
            (SELECT
                CASE
                    WHEN dannys_diner.menu.product_name = 'sushi' THEN dannys_diner.menu.price * 20
                    ELSE dannys_diner.menu.price * 10
                END AS point
            FROM
                dannys_diner.menu
            WHERE
                dannys_diner.menu.product_id = dannys_diner.sales.product_id)
    END) AS point
FROM
    dannys_diner.sales
right outer join
    dannys_diner.members
on
    dannys_diner.sales.customer_id = dannys_diner.members.customer_id
LEFT OUTER JOIN
    dannys_diner.menu
on
    dannys_diner.sales.product_id = dannys_diner.menu.product_id
GROUP BY
    dannys_diner.sales.customer_id;