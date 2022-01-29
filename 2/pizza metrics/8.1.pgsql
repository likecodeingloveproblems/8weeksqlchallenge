SELECT
    COUNT(*)
FROM
    pizza_runner.customer_orders
RIGHT OUTER JOIN
    pizza_runner.runner_orders
ON
    pizza_runner.runner_orders.order_id = pizza_runner.customer_orders.order_id
WHERE
    pizza_runner.runner_orders.cancellation ISNULL AND
    pizza_runner.customer_orders.exclusions NOTNULL AND
    pizza_runner.customer_orders.extras NOTNULL;