-- SELECT *
-- FROM customers
-- WHERE NOT (birth_date <= '1990-01-01' OR points > 1000)

--EQUIVILENT WHERE STATEMENT
-- WHERE birth_date <= '1990-01-01' AND points < 1000

SELECT *
FROM order_items
WHERE order_id = 6 and (unit_price * quantity > 30)