DELIMITER $$
CREATE PROCEDURE zadanie16(IN t varchar(90), IN k varchar(90))
BEGIN
    PREPARE stmt FROM
        concat('SELECT ', k ,' FROM ', t, ' ORDER BY ', k, ' DESC LIMIT 1');
    EXECUTE stmt;
END $$
DELIMITER ;

CALL zadanie16('album', 'tytul');