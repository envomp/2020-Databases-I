SELECT tootaja_id, perenimi, arv FROM Tootaja T_ RIGHT JOIN
(SELECT T1.ylemus, COUNT(*) as arv FROM (Tootaja_seos T1
LEFT JOIN Tootaja_seos T2 ON T1.alluv=T2.ylemus)
WHERE T2.alluv IS NOT NULL
GROUP BY T1.ylemus
HAVING COUNT(*) > 2) T
ON T_.tootaja_id=T.ylemus;

SELECT tootaja_id, perenimi, tase_1 AS 1_tase, tase_2 AS 2_tase, summa FROM Tootaja T_ RIGHT JOIN
(SELECT Tase1.ylemus, tase_1, NZ(tase_2, 0) AS tase_2, tase_1+NZ(tase_2, 0) AS summa FROM
(SELECT ylemus, COUNT(*) as tase_1 FROM Tootaja_seos
GROUP BY ylemus) Tase1
LEFT JOIN
(SELECT T1.ylemus, COUNT(*) as tase_2 FROM (Tootaja_seos T1
LEFT JOIN Tootaja_seos T2 ON T1.alluv=T2.ylemus)
WHERE T2.alluv IS NOT NULL
GROUP BY T1.ylemus) Tase2
ON Tase1.ylemus=Tase2.ylemus) T
ON T_.tootaja_id=T.ylemus
WHERE summa>2;