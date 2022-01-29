SELECT
    DISTINCT on (dannys_diner.sales.customer_id) dannys_diner.sales.customer_id,
    dannys_diner.sales.product_id,
    count(dannys_diner.sales.product_id) as sc
FROM
    dannys_diner.sales
GROUP BY
    dannys_diner.sales.customer_id, dannys_diner.sales.product_id
ORDER BY
    dannys_diner.sales.customer_id, sc DESC;

SELECT
    DISTINCT on (dannys_diner.sales.customer_id) dannys_diner.sales.customer_id,
    dannys_diner.menu.product_name,
    count(dannys_diner.sales.product_id) as sc
FROM
    dannys_diner.sales, dannys_diner.menu
WHERE
    dannys_diner.sales.product_id = dannys_diner.menu.product_id
GROUP BY
    dannys_diner.sales.customer_id, dannys_diner.menu.product_name
ORDER BY
    dannys_diner.sales.customer_id, sc DESC;