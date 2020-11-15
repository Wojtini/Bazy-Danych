PREPARE testStatement15 FROM
"
SELECT album.tytul,utwor.tytul,utwor.czas
FROM zespol
JOIN album
JOIN utwor
WHERE(zespol.id=album.zespol AND utwor.album = album.tytul
AND album.gatunek=?
AND utwor.czas<?
)
ORDER BY utwor.czas DESC
LIMIT 1
";