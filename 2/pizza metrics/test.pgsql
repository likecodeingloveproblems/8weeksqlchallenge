SELECT
    *
from
    pizza_runner.customer_orders
WHERE
    extras = 'null' or
    extras is NULL or
    extras = '';