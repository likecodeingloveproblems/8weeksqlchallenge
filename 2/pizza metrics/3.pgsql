SELECT
    runner_id,
    count(DISTINCT order_id) AS order_count
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
WHERE
    status = 'Success'
GROUP BY
    runner_id;