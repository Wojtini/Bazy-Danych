PREPARE zad18 FROM
'
WITH RECURSIVE rec AS (
	SELECT 0 as recNum,? AS n, ? AS k,1 AS sum, 0 AS final
	UNION ALL
	SELECT recNum+1,n-1,k,sum*k,0 FROM rec			WHERE n > k AND n-1 >= 0 AND final=0
	UNION ALL
	SELECT recNum+1,n-1,k-1,sum,0 FROM rec			WHERE k-1 >= 0 AND n<>k AND final = 0
	UNION ALL
	SELECT recNum+1,n,k,sum,1 FROM rec 				WHERE n = k AND final = 0
)
SELECT SUM(sum) FROM rec WHERE final=1
';
EXECUTE zad18 USING 18,9;

#18 9
#20 10 almost (int)

