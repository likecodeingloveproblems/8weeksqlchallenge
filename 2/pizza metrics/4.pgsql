SELECT
    pizza_runner.pizza_names.pizza_name,
    count(runner_orders.status)
FROM
    (SELECT
        pizza_runner.runner_orders.*,
        CASE
            WHEN 
                cancellation = 'Customer Cancellation' OR
                cancellation = 'Restaurant Cancellation'
            THEN 
                'Cancelled'
            ELSE
                'Success'
        END AS status
    FROM
        pizza_runner.runner_orders) AS runner_orders
JOIN
    pizza_runner.customer_orders
ON
    runner_orders.order_id = pizza_runner.customer_orders.order_id
JOIN
    pizza_runner.pizza_names
ON
    pizza_names.pizza_id = pizza_runner.customer_orders.pizza_id
WHERE
    runner_orders.status = 'Success'
GROUP BY
    pizza_runner.pizza_names.pizza_name;