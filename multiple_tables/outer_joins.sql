-- SELECT 
--   c.customer_id,
--   c.first_name,
--   o.order_id
-- FROM orders o
-- RIGHT JOIN customers c
--   ON c.customer_id = o.customer_id
-- ORDER BY c.customer_id

SELECT
  p.product_id,
  p.name,
  oi.quantity
FROM products p
LEFT JOIN order_items oi
  ON p.product_id = oi.product_id
ORDER BY p.product_id