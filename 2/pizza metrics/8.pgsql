
SELECT
    count(*)
FROM
    (
        SELECT
            customer_orders_status.order_id,
            CASE
                WHEN exclusions ISNULL AND extras ISNULL
                THEN 0
                ELSE 1
            END AS change
        FROM
            (
                SELECT
                    pizza_runner.customer_orders.*,
                    runner_orders_status.status
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
            ) AS customer_orders_status
    ) AS cos
WHERE
    change = 0;