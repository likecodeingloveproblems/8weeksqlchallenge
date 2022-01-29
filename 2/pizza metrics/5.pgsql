SELECT
    pizza_runner.customer_orders.customer_id,
    pizza_runner.pizza_names.pizza_name,
    count(pizza_runner.pizza_names.pizza_name)
FROM
    pizza_runner.customer_orders
LEFT OUTER JOIN
    pizza_runner.pizza_names
ON
    pizza_runner.customer_orders.pizza_id = pizza_runner.pizza_names.pizza_id
GROUP BY
    pizza_runner.customer_orders.customer_id,
    pizza_runner.pizza_names.pizza_name
ORDER BY
    pizza_runner.customer_orders.customer_id,
    pizza_runner.pizza_names.pizza_name;