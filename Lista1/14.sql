SELECT empt.FirstName,empt.LastName
FROM employee AS empt
WHERE empt.EmployeeID NOT IN
(
SELECT emp.EmployeeID
FROM employee AS emp
JOIN customer AS cust
WHERE (cust.SupportRepId = emp.EmployeeId AND cust.City != emp.City)
)