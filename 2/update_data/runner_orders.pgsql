UPDATE
    pizza_runner.runner_orders
SET
    pickup_time = null
WHERE
    pickup_time is null or
    pickup_time = 'null'or
    pickup_time = '';

UPDATE
    pizza_runner.runner_orders
SET
    distance = null
WHERE
    distance is null or
    distance = 'null'or
    distance = '';

UPDATE
    pizza_runner.runner_orders
SET
    duration = null
WHERE
    duration is null or
    duration = 'null'or
    duration = '';

UPDATE
    pizza_runner.runner_orders
SET
    cancellation = null
WHERE
    cancellation is null or
    cancellation = 'null'or
    cancellation = '';