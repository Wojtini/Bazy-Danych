INSERT INTO album (Title,ArtistID)
VALUES ("Gigaton",
(
	SELECT art.ArtistID
	FROM artist AS art
	WHERE (art.Name = "Pearl Jam")
	)
)
