UPDATE customer AS mer
SET mer.FavGenre = NULL;

UPDATE
customer AS newcust,
	(
	#Tabela customerId(unique),max z licznika,genreName
	SELECT id AS id2,max(licznik),genreID
	FROM
	(
		#Tabela customerId,genre(typ),ile kupil tego typu
		SELECT cust.CustomerId AS id,gen.GenreId AS genreID,COUNT(tra.TrackId) AS licznik
		FROM customer AS cust
		JOIN invoice AS inv
		JOIN invoiceline AS invl
		JOIN track AS tra
		JOIN genre AS gen
		WHERE(
		cust.CustomerId = inv.CustomerId AND inv.InvoiceId = invl.InvoiceId AND invl.TrackId=tra.TrackId AND tra.GenreId = gen.GenreId
		)
		GROUP BY cust.CustomerId,gen.Name
		) AS tab
		
	GROUP BY id
	
	) AS newtab
SET
newcust.FavGenre = newtab.genreName
WHERE
newcust.CustomerId = newtab.id2;