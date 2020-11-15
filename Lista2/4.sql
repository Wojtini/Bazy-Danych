DELIMITER //
DROP PROCEDURE IF EXISTS Test;

CREATE PROCEDURE Test()
BEGIN

UPDATE zespol AS ze
SET ze.liczbaAlbumow=0;

UPDATE zespol AS ze
SET ze.liczbaAlbumow = (SELECT COUNT(alb.tytul) FROM zespol AS zes JOIN album AS alb WHERE(alb.zespol=zes.id AND ze.id=zes.id) GROUP BY zes.nazwa LIMIT 1);


END //

DELIMITER ;


SHOW PROCEDURE STATUS;
CALL Test();