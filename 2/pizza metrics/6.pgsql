SELECT
    max(order_pizza_count.count_pizza) as max_count_pizza
FROM
    (SELECT
        pizza_runner.customer_orders.order_id,
        count(pizza_runner.customer_orders.order_id) as count_pizza
    FROM
        pizza_runner.customer_orders
    LEFT OUTER JOIN
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
            pizza_runner.runner_orders) as runner_orders_status
    ON
        pizza_runner.customer_orders.order_id = runner_orders_status.order_id
    WHERE
        runner_orders_status.status = 'Success'
    GROUP BY
        pizza_runner.customer_orders.order_id) as order_pizza_count;