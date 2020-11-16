PREPARE zad17 FROM
'
WITH RECURSIVE rec AS (
	SELECT 0 AS oldn,0 AS oldk,? AS n, ? AS k,1 AS sum, 0 AS final, 0 as recCount
	UNION ALL
	SELECT n,k, n-1,k-1,sum,0,recCount+1 FROM rec 				WHERE k-1 > 0 AND final = 0 AND n<>k
	UNION ALL
	SELECT n,k, n-1,k,(n-1)*sum,0,recCount+1 FROM rec 			WHERE n > k AND final = 0 AND n<>k
	UNION ALL
	SELECT n,k, n,k,sum,1,recCount+1 FROM rec 						WHERE n=k AND final = 0
)
SELECT SUM(sum) AS wynik FROM rec WHERE final = 1
';
EXECUTE zad17 USING 16,8;

#16 8
#18 9 almost


#
#