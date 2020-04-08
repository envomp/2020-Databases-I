TRANSFORM FIRST(Syndmus.kuupaev)
SELECT Syndmus.tellimus_id
FROM Syndmus
GROUP BY Syndmus.tellimus_id
PIVOT Syndmus.seisund;