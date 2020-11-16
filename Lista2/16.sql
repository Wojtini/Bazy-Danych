DROP PROCEDURE IF EXISTS zadanie16;
DELIMITER $$
CREATE PROCEDURE zadanie16(IN t varchar(90), IN k varchar(90))
BEGIN
	#sprawdzenie
	IF
		NOT EXISTS (
		SELECT * FROM information_schema.columns
		WHERE TABLE_SCHEMA = "music" AND TABLE_NAME = t AND COLUMN_NAME = k
		)
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Blad';
	END IF;

    PREPARE stmt FROM
        concat('SELECT ', k ,' FROM ', t, ' ORDER BY ', k, ' DESC LIMIT 1');
    EXECUTE stmt;
END $$
DELIMITER ;

CALL zadanie16('album', 'tytul');