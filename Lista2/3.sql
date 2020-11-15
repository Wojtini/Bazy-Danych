INSERT INTO music.zespol(id,nazwa)
SELECT DISTINCT Cart.ArtistId,Cart.Name FROM
chinookautoinc.artist AS Cart
JOIN chinookautoinc.album AS Calb
JOIN chinookautoinc.track AS Ctra
WHERE(
	Calb.ArtistId=Cart.ArtistId AND Ctra.AlbumID=Calb.AlbumID
	AND
	Ctra.MediaTypeId<>3
);

INSERT INTO music.album(tytul,gatunek,zespol)
SELECT DISTINCT Calb.Title,Cgen.Name,Cart.ArtistId FROM
chinookautoinc.artist AS Cart
JOIN chinookautoinc.album AS Calb
JOIN chinookautoinc.track AS Ctra
JOIN chinookautoinc.genre AS Cgen
JOIN chinookautoinc.mediatype AS Cmt
WHERE(
	Calb.ArtistId=Cart.ArtistId AND Ctra.AlbumID=Calb.AlbumID AND Cmt.MediaTypeId=Ctra.MediaTypeId AND Cgen.GenreId = Ctra.GenreId
	AND
	Ctra.MediaTypeId<>3
)
GROUP BY Calb.AlbumId
;

INSERT INTO music.utwor(id,tytul,czas,album,zespol)
SELECT DISTINCT Ctra.TrackId,Ctra.Name,floor(Ctra.Milliseconds/1000),Calb.Title,Cart.ArtistId FROM
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