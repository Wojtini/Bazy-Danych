PREPARE testStatement FROM
"
SELECT utwor.tytul
FROM zespol
JOIN album
JOIN utwor
WHERE(zespol.id=album.zespol AND utwor.album = album.tytul
AND zespol.nazwa=?
AND album.gatunek=?
)";