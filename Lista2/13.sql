CREATE VIEW widok13 AS

SELECT zespol.nazwa,COUNT(zespol.id) AS "Utwory pow 120s"
FROM zespol
JOIN album
JOIN utwor
WHERE(zespol.id=album.zespol AND album.tytul=utwor.tytul
AND czas>120000
)
GROUP BY zespol.nazwa;