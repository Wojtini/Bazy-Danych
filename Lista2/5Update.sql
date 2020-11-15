DROP TRIGGER IF EXISTS albumCountUpdateBef;
delimiter //
CREATE TRIGGER albumCountUpdateBef BEFORE UPDATE ON music.album
FOR EACH ROW
	UPDATE zespol
	SET zespol.liczbaAlbumow=zespol.liczbaAlbumow-1
	WHERE OLD.zespol = zespol.id;
END
delimiter ;
SHOW TRIGGERS