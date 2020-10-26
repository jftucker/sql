-- SELECT 
--   c.first_name AS customer,
--   p.name AS product
-- FROM customers c, products p
-- -- CROSS JOIN products p
-- ORDER BY c.first_name

SELECT
  s.name,
  p.name
-- FROM shippers s, products p
FROM shippers s
CROSS JOIN products p
ORDER BY s.name