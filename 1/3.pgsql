SET search_path = dannys_diner;

SELECT customer_id, product_id
FROM sales
WHERE order_date = 
    (
        -- this script query the first day of purchase from the store
        -- but the correct answer is to query the first purchase date of any customer
        SELECT order_date
        FROM sales
        order by order_date
        LIMIT 1
        );