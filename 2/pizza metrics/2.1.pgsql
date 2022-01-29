SELECT
    DISTINCT customer_id, count(customer_id) as count_customer_orders
FROM
    pizza_runner.customer_orders
GROUP BY pizza_runner.customer_orders.customer_id;