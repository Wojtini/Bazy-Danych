SELECT tra.Name,tra.UnitPrice
FROM track AS tra
JOIN genre AS gen
WHERE(tra.GenreId=gen.GenreId AND gen.Name="Sci Fi & Fantasy")