
DROP TRIGGER IF EXISTS albumDelete;
delimiter //
CREATE TRIGGER albumDelete BEFORE DELETE ON music.album
FOR EACH ROW
BEGIN

	DELETE FROM utwor WHERE (utwor.album = OLD.tytul);
	
END //
#CALL count_albums();
delimiter ;