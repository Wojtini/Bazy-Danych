DELIMITER //
DROP PROCEDURE IF EXISTS zad7;

CREATE PROCEDURE zad7(k INT)
BEGIN
	DECLARE pom CHAR(120);
	DECLARE utwGen INT;
	DECLARE aktZes VARCHAR(120);
	DECLARE aktZesIndex INT;
	DECLARE aktAlb VARCHAR(120);
	WHILE k > 0 DO
		SET utwGen = FLOOR(RAND()*10)+6;
		#Tworzenie zespolu
		IF k <> 0 THEN
			SET aktZes = CONCAT("ZespolNumer",k);
			INSERT INTO zespol (nazwa,liczbaAlbumow) VALUES (aktZes,0);
			SET aktZesIndex = (SELECT id FROM zespol WHERE (nazwa = aktZes) LIMIT 1);
		END IF;
		#Tworzenie albumu
		SET aktAlb = CONCAT("AlbumNumer",k);
		INSERT INTO album (tytul,zespol) VALUES (aktAlb,aktZesIndex);
		#Uzupelnianie utworow albumu
		WHILE utwGen > 0 DO
			INSERT INTO utwor (tytul,czas,album,zespol) VALUES (CONCAT("Utwor",utwGen," A",aktZesIndex),FLOOR(RAND()*1000),aktAlb,aktZesIndex);
			SET utwGen = utwGen-1;
		END WHILE;
		
		SET k = k-1;	
	END WHILE;
END //

DELIMITER ;
CALL zad7(5)