INSERT IGNORE INTO music.album(tytul,gatunek,zespol)
SELECT DISTINCT Calb.Title,Cgen.Name,Cart.ArtistId FROM
chinookautoinc.artist AS Cart
JOIN chinookautoinc.album AS Calb
JOIN chinookautoinc.track AS Ctra
JOIN chinookautoinc.genre AS Cgen
JOIN chinookautoinc.mediatype AS Cmt
WHERE(
	Calb.ArtistId=Cart.ArtistId AND Ctra.AlbumID=Calb.AlbumID AND Cgen.GenreId=Ctra.GenreId AND Cmt.MediaTypeId=Ctra.MediaTypeId
	AND
	Ctra.MediaTypeId<>3
);