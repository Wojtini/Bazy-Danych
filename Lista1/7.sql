SELECT tr.Name,alb.Title,gen.Name,art.Name
FROM playlist AS pl
JOIN playlisttrack AS plt
JOIN track AS tr
JOIN album AS alb
JOIN genre AS gen
JOIN artist AS art
WHERE (plt.PlaylistID=pl.PlaylistID AND pl.Name = "90’s Music" AND tr.TrackId = plt.TrackId AND alb.AlbumId = tr.AlbumId AND gen.GenreId = tr.GenreId AND art.ArtistId = alb.ArtistId)