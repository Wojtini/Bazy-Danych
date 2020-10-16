SELECT emp.FirstName,emp.LastName
FROM employee AS emp
WHERE emp.EmployeeID NOT IN
(
SELECT DISTINCT cust.SupportRepId
FROM customer AS cust
)