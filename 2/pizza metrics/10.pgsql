SELECT
    To_Char(order_time, 'Day'),
    count(order_id)
FROM
    pizza_runner.customer_orders
GROUP BY
    To_Char(order_time, 'Day')
