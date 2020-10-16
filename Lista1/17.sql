SELECT art.Name,COUNT(art.ArtistId)
FROM artist AS art
JOIN album AS alb
JOIN track AS tra
JOIN genre AS gen
WHERE(art.ArtistId=alb.ArtistId AND tra.AlbumId=alb.AlbumId 
AND gen.GenreId=tra.GenreId
AND (gen.Name="Metal" OR gen.Name="Heavy Metal")
)
GROUP BY art.Name