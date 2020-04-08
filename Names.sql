SELECT I.id, I.eesnimi, I.perenimi FROM
(SELECT DISTINCT TOP 3 perenimi FROM Isik
WHERE perenimi IS NOT NULL
ORDER BY perenimi) A
RIGHT JOIN ISIK I ON A.perenimi=I.perenimi
WHERE A.perenimi IS NOT NULL
ORDER BY I.perenimi;