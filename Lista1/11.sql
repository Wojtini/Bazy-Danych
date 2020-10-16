SELECT inv.BillingCity,SUM(Total) AS suma
FROM invoice AS inv
GROUP BY inv.BillingCity
ORDER BY suma DESC
LIMIT 1