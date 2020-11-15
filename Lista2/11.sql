DELIMITER //
DROP PROCEDURE IF EXISTS zad11;

CREATE PROCEDURE zad11(str VARCHAR(120))
BEGIN
IF str<>"" THEN
	DROP TABLE IF EXISTS pomtable11;
	CREATE TEMPORARY TABLE IF NOT EXISTS pomtable11 AS (
	SELECT alb.tytul FROM album AS alb
	JOIN zespol AS zes
	WHERE(zes.id = alb.zespol AND zes.nazwa LIKE CONCAT('%',str,'%'))
	);
	
	DELETE alb FROM album AS alb
	JOIN pomtable11 AS pom
	WHERE (pom.tytul = alb.tytul);
END IF;

END //

DELIMITER ;
CALL zad11("V")