-- SELECT first_name, last_name, 10 AS points
-- FROM customers
-- ORDER BY points, first_name

SELECT order_id, product_id, quantity, unit_price
FROM order_items
WHERE order_id = 2
ORDER BY quantity * unit_price DESC