DROP VIEW IF EXISTS widok9;
CREATE VIEW widok9 AS
SELECT zespol.nazwa,album.tytul,album.gatunek
FROM zespol
JOIN album
WHERE (zespol.id = album.zespol);