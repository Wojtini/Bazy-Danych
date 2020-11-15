DELIMITER //
DROP PROCEDURE IF EXISTS GenreCheck;

CREATE PROCEDURE GenreCheck()
BEGIN

UPDATE album
SET gatunek = (SELECT NAME FROM chinookautoinc.genre ORDER BY GenreID ASC LIMIT 1)
WHERE (gatunek NOT IN (SELECT DISTINCT Name FROM chinookautoinc.genre));


END //

DELIMITER ;


SHOW PROCEDURE STATUS;
CALL GenreCheck();