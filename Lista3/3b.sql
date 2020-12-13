DELIMITER //
DROP PROCEDURE IF EXISTS genMuzycy;

CREATE PROCEDURE genMuzycy()
BEGIN
	DECLARE iloscZespolow INT;
	DECLARE currzespol INT;
	DECLARE ileMuzykow INT;
	
	DECLARE numerMuzyka INT;
	DECLARE aktMuzykImie VARCHAR(70);
	DECLARE aktMuzykNazw VARCHAR(90);
	
	SET numerMuzyka = 1;
	
	SET iloscZespolow = (SELECT COUNT(*) FROM zespol);
	SET iloscZespolow = iloscZespolow - 1;
	
	WHILE iloscZespolow >= 0 DO
		#Get currzespol id
		SET currzespol = (SELECT id FROM zespol ORDER BY id LIMIT iloscZespolow,1);
		
		#generowanie muzykow
		SET ileMuzykow = FLOOR(RAND()*10)%5+2;
		WHILE ileMuzykow > 0 DO
			SET aktMuzykImie = CONCAT("MuzykImie",numerMuzyka);
			SET aktMuzykNazw = CONCAT("MuzykNazwisko",numerMuzyka);
			
			INSERT INTO muzycy (imie,nazwisko,zespol,gaza) VALUES (aktMuzykImie,aktMuzykNazw,currzespol, FLOOR(RAND()*1000));
		
			SET ileMuzykow = ileMuzykow - 1;
			SET numerMuzyka = numerMuzyka + 1;
		END WHILE;
		
		SET iloscZespolow = iloscZespolow - 1;
	END WHILE;
END //

DELIMITER ;
CALL genMuzycy()