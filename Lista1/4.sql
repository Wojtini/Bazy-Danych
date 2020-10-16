SELECT alb.Title
FROM album AS alb
JOIN artist AS art
WHERE (alb.ArtistId = art.ArtistId AND art.Name = "Various Artists")