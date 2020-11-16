DELIMITER //
DROP PROCEDURE IF EXISTS zad8;

CREATE PROCEDURE zad8(nazwaZespolu VARCHAR(120))
BEGIN
	IF NOT EXISTS (SELECT nazwa FROM zespol WHERE nazwaZespolu=nazwa LIMIT 1) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Nie istnieje taki zespol';
	END IF;

	SELECT zespol.nazwa,album.tytul,SUM(utwor.czas) AS SUMA
	FROM zespol
	JOIN album
	JOIN utwor
	WHERE(
	zespol.id=album.zespol AND album.tytul=utwor.album AND zespol.id = utwor.zespol
	AND
	zespol.nazwa = nazwaZespolu
	)
	GROUP BY album.tytul
	ORDER BY SUMA DESC
	LIMIT 1;
END //

DELIMITER ;
CALL zad8("Led Zeppdsaelin")