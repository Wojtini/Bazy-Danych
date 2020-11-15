
DROP TRIGGER IF EXISTS albumCountUpdateAdd;
delimiter //
CREATE TRIGGER albumCountUpdateAdd AFTER INSERT ON music.album
FOR EACH ROW
BEGIN
	UPDATE zespol
	SET zespol.liczbaAlbumow=zespol.liczbaAlbumow+1
	WHERE NEW.zespol = zespol.id;
END //
delimiter ;

DROP TRIGGER IF EXISTS albumCountUpdateBef;
delimiter //
CREATE TRIGGER albumCountUpdateBef BEFORE UPDATE ON music.album
FOR EACH ROW
BEGIN
	UPDATE zespol
	SET zespol.liczbaAlbumow=zespol.liczbaAlbumow-1
	WHERE OLD.zespol = zespol.id;
END //
#CALL count_albums();
delimiter ;

DROP TRIGGER IF EXISTS albumCountUpdateAft;
delimiter //
CREATE TRIGGER albumCountUpdateAft AFTER UPDATE ON music.album
FOR EACH ROW
BEGIN
	UPDATE zespol
	SET zespol.liczbaAlbumow=zespol.liczbaAlbumow+1
	WHERE NEW.zespol = zespol.id;
END //
#CALL count_albums();
delimiter ;

DROP TRIGGER IF EXISTS albumCountUpdateSub;
delimiter //
CREATE TRIGGER albumCountUpdateSub AFTER DELETE ON music.album
FOR EACH ROW
BEGIN
	UPDATE zespol
	SET zespol.liczbaAlbumow=zespol.liczbaAlbumow-1
	WHERE OLD.zespol = zespol.id;
END //
#CALL count_albums();
delimiter ;


SHOW TRIGGERS