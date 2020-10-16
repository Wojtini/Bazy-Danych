SELECT inv.BillingCity,AVG(Total) AS average
FROM invoice AS inv
GROUP BY inv.BillingCity