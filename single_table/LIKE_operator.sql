-- SELECT *
-- FROM customers
-- WHERE last_name SIMILAR TO '(B|b)____y'

-- SELECT *
-- FROM customers
-- WHERE address SIMILAR TO '%(Trail|Avenue)%'

-- SELECT *
-- FROM customers
-- WHERE address LIKE '%Trail%' OR
--     address LIKE '%Avenue%'

SELECT * 
FROM customers
WHERE phone NOT LIKE '%9'