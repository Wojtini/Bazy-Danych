UPDATE customer AS cust
SET cust.FavGenre =
	(SELECT GenreID
	FROM genre
	ORDER BY RAND()
	LIMIT 1);