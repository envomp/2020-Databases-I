INSERT INTO Ruum_koopia (ruumi_nr, hotelli_nr, ruumi_tüüp, hind)
SELECT R.ruumi_nr, R.hotelli_nr, ruumi_tüüp, hind FROM Ruum R
RIGHT JOIN
(SELECT ruumi_nr, hotelli_nr, COUNT(*) as total FROM Reserveerimine GROUP BY ruumi_nr, hotelli_nr HAVING COUNT(*) IN
(SELECT LAST(total) FROM (SELECT DISTINCT TOP 2 ruumi_nr, hotelli_nr, COUNT(*) as total FROM Reserveerimine GROUP BY ruumi_nr, hotelli_nr ORDER BY COUNT(*) DESC) as Thnt)) Calc
ON R.ruumi_nr=Calc.ruumi_nr AND R.hotelli_nr=Calc.hotelli_nr;

SELECT * INTO Reserveerimine_koopia FROM Reserveerimine;