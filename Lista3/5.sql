DELIMITER //
DROP PROCEDURE IF EXISTS zad5;

CREATE PROCEDURE zad5(IN nazwazespolu VARCHAR(120))
BEGIN	
	DECLARE finished INT DEFAULT 0;
	DECLARE pom INT;
	DECLARE pom2 INT;
	DECLARE kursor CURSOR FOR
	SELECT muzycy.id,muzycy.gaza
	FROM zespol
	JOIN muzycy
	WHERE (zespol.id = muzycy.zespol AND zespol.nazwa=nazwazespolu);
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
	
	OPEN kursor;
	
	loop_label: LOOP
		FETCH kursor INTO pom2,pom;
		SELECT pom2 AS id,pom AS gaza;
		IF finished = 1 THEN
			LEAVE loop_label;
		END IF;
	END LOOP loop_label;
	
	CLOSE kursor;
	
	
END //

DELIMITER ;
CALL zad5("ZespolNumer2")