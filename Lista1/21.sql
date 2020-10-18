SELECT nazwa,srednia AS sre
FROM (

	SELECT art.Name AS nazwa,COUNT(tra.TrackId) AS licznik,AVG(tra.Milliseconds) AS srednia
	FROM artist AS art
	JOIN album AS alb
	JOIN track AS tra
	JOIN genre AS gen
	WHERE(
	art.ArtistId = alb.ArtistId AND tra.AlbumId = alb.AlbumId AND gen.GenreId = tra.GenreId AND gen.Name="Rock"
	)
	GROUP BY nazwa
	
) AS test

WHERE licznik > 12
ORDER BY sre DESC;