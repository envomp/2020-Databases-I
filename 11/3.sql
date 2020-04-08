SELECT UCASE(ruumi_tüüp) as ruumi_tüüp, aveg  FROM
(SELECT ruumi_tüüp, AVG(average) as aveg FROM
(SELECT ruumi_tüüp, lopu_aeg - alguse_aeg AS average FROM Ruum Ru_
INNER JOIN Reserveerimine Re_
ON Ru_.ruumi_nr=Re_.ruumi_nr
WHERE lopu_aeg-alguse_aeg IS NOT NULL)
GROUP BY ruumi_tüüp)
WHERE aveg=(SELECT MAX(aveg)  FROM
(SELECT ruumi_tüüp, AVG(average) as aveg FROM
(SELECT ruumi_tüüp, lopu_aeg - alguse_aeg AS average FROM Ruum Ru_
INNER JOIN Reserveerimine Re_
ON Ru_.ruumi_nr=Re_.ruumi_nr
WHERE lopu_aeg-alguse_aeg IS NOT NULL)
GROUP BY ruumi_tüüp));