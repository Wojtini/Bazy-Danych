DELIMITER //
DROP PROCEDURE IF EXISTS zad4;

CREATE PROCEDURE zad4(IN dimie VARCHAR(120),IN dhaslo VARCHAR(120))
BEGIN
	DECLARE zmienna INT;
	DECLARE haslohash VARCHAR(160);
	
	SET haslohash = SHA1(dhaslo);
	#SELECT muzycy.id FROM muzycy JOIN hasla WHERE (muzycy.id = hasla.id AND imie=dimie AND haslohash = hasla.haslo);
	
	IF NOT EXISTS (SELECT muzycy.id FROM muzycy JOIN hasla WHERE (muzycy.id = hasla.id AND imie=dimie AND haslohash = hasla.haslo)) THEN
		#SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Nope';
		#Zwroc random zespol
		SELECT nazwa FROM zespol ORDER BY RAND() LIMIT 1;
	ELSE
		#SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Yes';
		SET zmienna = (SELECT muzycy.id FROM muzycy JOIN hasla WHERE (muzycy.id = hasla.id AND imie=dimie AND haslohash = hasla.haslo));
		SELECT nazwa
		FROM muzycy
		JOIN zespol
		WHERE muzycy.zespol = zespol.id AND muzycy.id = zmienna;
	END IF;
	
	
	
END //

DELIMITER ;
CALL zad4("MuzykImie1asdas","haslo")