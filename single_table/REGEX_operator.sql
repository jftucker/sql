-- SELECT *
-- FROM customers
-- -- WHERE last_name LIKE '%field%'
-- -- WHERE last_name ~* 'field$|mac|rose'
-- WHERE last_name ~* '[a-h]e'

-- ^ beginning
-- $ end
-- | logical or
-- [abcd]
-- [a-f]

SELECT *
FROM customers
-- WHERE first_name ~* 'elka|ambur'
-- WHERE last_name ~* 'ey$|on$'
-- WHERE last_name ~* '^my|se'
WHERE last_name ~* 'b[ru]'