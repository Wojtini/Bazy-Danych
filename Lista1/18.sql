SELECT tra.Name
FROM album AS alb
JOIN track AS tra
WHERE(alb.Title LIKE "Battlestar Galactica%" AND alb.AlbumId = tra.AlbumId)