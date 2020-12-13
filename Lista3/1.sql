DROP PROCEDURE IF EXISTS zad1;
delimiter //
CREATE PROCEDURE zad1 (IN tab VARCHAR(120),IN nrow VARCHAR(120))
BEGIN
	IF (nrow LIKE "%'%") OR (nrow LIKE "%;%") OR (nrow LIKE "%)%") OR (nrow LIKE "%--%") THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Zle argumenty';
	END IF;

	IF tab="zespol" THEN
		IF
		(SUBSTRING_INDEX(SUBSTRING_INDEX(nrow, "|", 1), "|", -1) LIKE "") OR
		(SUBSTRING_INDEX(SUBSTRING_INDEX(nrow, "|", 2), "|", -1) LIKE "")
		THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Pusty argument';
		END IF;
		
		INSERT INTO zespol (nazwa,liczbaAlbumow) VALUES 
		(
		SUBSTRING_INDEX(SUBSTRING_INDEX(nrow, "|", 1), "|", -1),
		SUBSTRING_INDEX(SUBSTRING_INDEX(nrow, "|", 2), "|", -1)
		);
	END IF;
	
	IF tab="album" THEN
		IF
		(SUBSTRING_INDEX(SUBSTRING_INDEX(nrow, "|", 1), "|", -1) LIKE "") OR
		(SUBSTRING_INDEX(SUBSTRING_INDEX(nrow, "|", 2), "|", -1) LIKE "") OR
		(SUBSTRING_INDEX(SUBSTRING_INDEX(nrow, "|", 3), "|", -1) LIKE "")
		THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Pusty argument';
		END IF;
		
		IF NOT EXISTS (SELECT id FROM zespol WHERE id=SUBSTRING_INDEX(SUBSTRING_INDEX(nrow, "|", 3), "|", -1) LIMIT 1) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Nie istnieje zespol o takim id';
		END IF;
		INSERT INTO album (tytul,gatunek,zespol) VALUES 
		(
		SUBSTRING_INDEX(SUBSTRING_INDEX(nrow, "|", 1), "|", -1),
		SUBSTRING_INDEX(SUBSTRING_INDEX(nrow, "|", 2), "|", -1),
		SUBSTRING_INDEX(SUBSTRING_INDEX(nrow, "|", 3), "|", -1)
		);
	END IF;
	
	IF tab="utwor" THEN
		IF
		(SUBSTRING_INDEX(SUBSTRING_INDEX(nrow, "|", 1), "|", -1) LIKE "") OR
		(SUBSTRING_INDEX(SUBSTRING_INDEX(nrow, "|", 2), "|", -1) LIKE "") OR
		(SUBSTRING_INDEX(SUBSTRING_INDEX(nrow, "|", 3), "|", -1) LIKE "") OR
		(SUBSTRING_INDEX(SUBSTRING_INDEX(nrow, "|", 4), "|", -1) LIKE "")
		THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Pusty argument';
		END IF;
		
		IF NOT EXISTS (SELECT id FROM zespol WHERE id=SUBSTRING_INDEX(SUBSTRING_INDEX(nrow, "|", 4), "|", -1) LIMIT 1) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Nie istnieje zespol o takim id';
		END IF;
		
		IF NOT EXISTS (SELECT * FROM album WHERE tytul=SUBSTRING_INDEX(SUBSTRING_INDEX(nrow, "|", 3), "|", -1) LIMIT 1) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Nie istnieje album o takiej nazwie';
		END IF;
		
		INSERT INTO utwor (tytul,czas,album,zespol) VALUES 
		(
		SUBSTRING_INDEX(SUBSTRING_INDEX(nrow, "|", 1), "|", -1),
		SUBSTRING_INDEX(SUBSTRING_INDEX(nrow, "|", 2), "|", -1),
		SUBSTRING_INDEX(SUBSTRING_INDEX(nrow, "|", 3), "|", -1),
		SUBSTRING_INDEX(SUBSTRING_INDEX(nrow, "|", 4), "|", -1)
		);
	END IF;
END//
delimiter ;
CALL zad1("utwor","asd|23|fajnyalbum|295");