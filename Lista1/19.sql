SELECT DISTINCT art.Name,alb.Title,art2.Name
FROM artist AS art
JOIN album AS alb
JOIN album AS alb2
JOIN artist AS art2
WHERE(alb.Title = alb2.Title AND alb.ArtistId!=alb2.ArtistID AND alb2.ArtistId > alb.ArtistId AND art2.ArtistId = alb2.ArtistId AND art.ArtistId = alb.ArtistId)