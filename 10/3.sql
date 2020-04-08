
SELECT K.külalise_nr, eesnimi, perenimi, aadress, Temp.arv FROM

(SELECT * FROM
(SELECT * FROM (
SELECT K.külalise_nr, COUNT(*) as arv FROM Külaline K
LEFT JOIN Reserveerimine R
ON K.külalise_nr = R.külalise_nr
GROUP BY K.külalise_nr)
WHERE arv > 0)
WHERE arv >(
SELECT AVG(arv) FROM
(SELECT * FROM (
SELECT K.külalise_nr, COUNT(*) as arv FROM Külaline K
LEFT JOIN Reserveerimine R
ON K.külalise_nr = R.külalise_nr
GROUP BY K.külalise_nr)
WHERE arv > 0)
)) as Temp
LEFT JOIN Külaline K
ON Temp.külalise_nr=K.külalise_nr
ORDER BY arv DESC, K.külalise_nr