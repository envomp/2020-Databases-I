INSERT INTO Külaline_varu (külalise_nr, nimi, aadress, külastuste_arv)

SELECT K.külalise_nr, eesnimi & ' ' & perenimi as nimi, aadress, korda as külastuste_arv FROM
(SELECT * FROM

(SELECT * FROM
(
SELECT külalise_nr, COUNT(külalise_nr) as korda FROM Reserveerimine R
RIGHT JOIN
(SELECT * FROM Hotell H_
WHERE H_.nimi = 'Viru') AS H
ON R.hotelli_nr=H.hotelli_nr
GROUP BY külalise_nr)
WHERE korda < 3
)

UNION

(SELECT külalise_nr, 0 FROM
(
SELECT külalise_nr, COUNT(külalise_nr) as korda FROM Reserveerimine R
LEFT JOIN
(SELECT * FROM Hotell H_
WHERE H_.nimi = 'Viru') AS H
ON R.hotelli_nr=H.hotelli_nr
GROUP BY külalise_nr)
WHERE korda < 3
)
) AS KR


LEFT JOIN Külaline K
ON KR.külalise_nr = K.külalise_nr
