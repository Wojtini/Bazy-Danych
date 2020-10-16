DELETE FROM customer
WHERE CustomerId NOT IN
(
SELECT DISTINCT cus.CustomerId
FROM customer AS cus
JOIN invoice AS inv
WHERE(cus.CustomerId = inv.CustomerId)
ORDER BY cus.CustomerId ASC
)