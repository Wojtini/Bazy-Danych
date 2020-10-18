INSERT INTO track (NAME,AlbumID,MediaTypeID,GenreID,Composer,Milliseconds,Bytes,UnitPrice)
VALUES (
#name
	"River Cross",
#AlbumID
	(
	SELECT alb.AlbumID
	FROM album AS alb
	WHERE (alb.Title = "Gigaton")
	),
#MediaTypeID
	1,
#GenreID
	(
	SELECT gen.GenreID
	FROM genre AS gen
	WHERE (gen.Name = "Rock")
	),
#Composer
	"",
#Miliseconds
	0,
#Bytes
	0,
#UnitPrice
	0.99
)