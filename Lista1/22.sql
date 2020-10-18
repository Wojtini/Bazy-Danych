SELECT SUBSTRING_INDEX(Email,"@",-1) AS domain,COUNT(customerId) AS liczba
FROM customer
GROUP BY domain
ORDER BY liczba DESC

#SUBSTRING_INDEX(Email,"@",-1) apple.at and apple.be are two different
#SUBSTRING_INDEX(SUBSTRING_INDEX(Email,"@",-1),".",1) apple.at and apple.be are the same and stored in "apple"