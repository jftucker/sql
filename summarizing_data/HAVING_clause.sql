-- SELECT
--   client_id,
--   SUM(invoice_total) AS total_sales,
--   COUNT(*) AS number_of_invoices
-- FROM invoices
-- GROUP BY client_id
-- HAVING SUM(invoice_total) > 500 AND COUNT(*) > 5

\c sql_store
SELECT
  c.first_name,
  c.last_name,
  SUM(oi.unit_price * oi.quantity) AS total_sales
FROM customers c
JOIN orders o USING(customer_id)
JOIN order_items oi USING(order_id)
WHERE state = 'VA'
GROUP BY c.first_name, c.last_name
HAVING SUM(oi.unit_price * oi.quantity) > 100