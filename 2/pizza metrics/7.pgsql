SELECT
    coc.customer_id,
    coc.change,
    count(coc.change)
FROM
    (
        SELECT
            customer_id,
            CASE
                WHEN exclusions ISNULL and extras ISNULL
                THEN 0
                ELSE 1
            END AS change
        FROM
            (SELECT
                *
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
                runner_orders_status.status = 'Success') AS customer_orders_status
    ) AS coc 
GROUP BY
    coc.customer_id,
    coc.change
order by
    coc.customer_id,
    coc.change;
