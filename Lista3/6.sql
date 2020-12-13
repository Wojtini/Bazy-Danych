DELIMITER //
DROP PROCEDURE IF EXISTS zad6;

CREATE PROCEDURE zad6(IN nazwazespolu VARCHAR(120),IN kwota INT)
BEGIN	
	DECLARE msg VARCHAR(120);
	DECLARE iloscMuzykow INT;
	DECLARE aktMuzyk INT;
	DECLARE aktGaza INT;
	DECLARE ileOsob INT;
	SET iloscMuzykow = (
		SELECT COUNT(muzycy.id)
		FROM zespol
		JOIN muzycy
		WHERE (zespol.id = muzycy.zespol AND zespol.nazwa=nazwazespolu)
		LIMIT 1
	);
	SET ileOsob = iloscMuzykow;
	SET iloscMuzykow = iloscMuzykow - 1;
	START TRANSACTION;
	WHILE iloscMuzykow > -1 DO
		#GET MUZYK
		SET aktMuzyk = (
			SELECT muzycy.id
			FROM zespol
			JOIN muzycy
			WHERE (zespol.id = muzycy.zespol AND zespol.nazwa=nazwazespolu)
			ORDER BY muzycy.id
			LIMIT iloscMuzykow,1
		);
		#GET GAZA OF MUZYK
		SET aktGaza = (
			SELECT muzycy.gaza FROM muzycy WHERE muzycy.id=aktMuzyk LIMIT 1
		);
		#SELECT aktMuzyk,aktGaza;
		SET iloscMuzykow = iloscMuzykow -1;
		#PAY GAZA
		UPDATE muzycy
		SET muzycy.gaza=0
		WHERE muzycy.id=aktMuzyk;
		SET kwota = kwota - aktGaza;
		IF kwota < 0 THEN
			ROLLBACK;
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Za mala kwota';
		END IF;
		
	END WHILE;
	
	COMMIT;
	SET msg = CONCAT("Wyplacono ",ileOsob," Zostalo: ",kwota,"zl");
	SELECT msg;
END //

DELIMITER ;
CALL zad6("ZespolNumer5",3000)