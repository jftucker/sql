-- SELECT
--   state,
--   city,
--   SUM(invoice_total) AS total_sales
-- FROM invoices i
-- JOIN clients c USING (client_id)
-- GROUP BY state, city

SELECT
  p.date,
  pm.name AS payment_method,
  SUM(amount) AS total_payments
FROM payments p
JOIN payment_methods pm
  ON pm.payment_method_id = p.payment_method

GROUP BY p.date, pm.name
ORDER BY p.date