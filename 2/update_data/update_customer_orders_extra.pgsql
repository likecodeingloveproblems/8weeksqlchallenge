UPDATE
    pizza_runner.customer_orders
SET
    extras = null
WHERE
    extras is null or
    extras = 'null'or
    extras = '';