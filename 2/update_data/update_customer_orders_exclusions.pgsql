UPDATE
    pizza_runner.customer_orders
SET
    exclusions = null
WHERE
    exclusions is null or
    exclusions = 'null'or
    exclusions = '';