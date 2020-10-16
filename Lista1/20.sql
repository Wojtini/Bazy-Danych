SELECT art.Name,tra.Name
FROM artist AS art
JOIN album AS alb
JOIN track AS tra
WHERE(
art.ArtistId = alb.ArtistId AND alb.AlbumId = tra.AlbumId
AND art.Name LIKE "Santana%"
) 