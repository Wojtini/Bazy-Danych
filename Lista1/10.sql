SELECT art.Name,COUNT(alb.Title) AS "Liczba albumów"
FROM artist AS art
JOIN album AS alb
WHERE art.ArtistId = alb.ArtistId
GROUP BY art.ArtistID