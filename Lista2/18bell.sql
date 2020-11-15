PREPARE zad18 FROM
'
WITH RECURSIVE rec AS (
	SELECT ? AS n, 0 AS k,1 AS sum, 0 AS final, 1 AS sumPart
	UNION ALL
	SELECT n,k+1,1,0,1 FROM rec 				WHERE n > k AND sumPart = 1
	UNION ALL
	SELECT n-1,k,sum*k,0,0 FROM rec 			WHERE n > k AND n-1 >= 0 AND final=0
	UNION ALL
	SELECT n-1,k-1,sum,0,0 FROM rec			WHERE k-1 >= 0 AND n<>k AND final = 0
	UNION ALL
	SELECT n,k,sum,1,0 FROM rec 				WHERE n = k AND final = 0
)
SELECT SUM(sum) FROM rec WHERE final=1
';
EXECUTE zad18 USING 18;


#18...
