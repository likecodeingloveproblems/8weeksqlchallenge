SELECT
    EXTRACT(hour from order_time::time),
    count(DISTINCT order_id)
FROM
    pizza_runner.customer_orders
GROUP BY
    EXTRACT(hour from order_time::time);