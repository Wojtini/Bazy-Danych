SELECT art.Name,alb.Title
FROM album AS alb
JOIN artist AS art
WHERE (art.ArtistId = alb.ArtistId)