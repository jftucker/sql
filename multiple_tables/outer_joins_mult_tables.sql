-- SELECT 
--   c.customer_id,
--   c.first_name,
--   o.order_id,
--   sh.name AS shipper
-- FROM customers c
-- LEFT JOIN orders o 
--   ON c.customer_id = o.customer_id
-- LEFT JOIN shippers sh
--   ON o.shipper_id = sh.shipper_id
-- ORDER BY c.customer_id

SELECT
  o.order_id,
  o.order_date,
  c.first_name AS customer,
  sh.name AS shipper,
  os.name AS status
FROM
  orders o
JOIN customers c
  ON o.customer_id = c.customer_id
LEFT JOIN shippers sh
  ON o.shipper_id = sh.shipper_id
LEFT JOIN order_statuses os
  ON o.status = os.order_status_id