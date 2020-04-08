
SELECT T1.eesnimi, T1.perenimi, T1.lopu_aeg + 1 AS algus, MIN(T2.alguse_aeg - 1) AS lopp, MIN(T2.alguse_aeg - T1.lopu_aeg - 2) AS pikkus
FROM Tootamine T1 LEFT JOIN Tootamine T2
ON T1.eesnimi=T2.eesnimi AND T1.perenimi=T2.perenimi AND T2.alguse_aeg > T1.lopu_aeg
WHERE T2.alguse_aeg IS NOT NULL
GROUP BY T1.eesnimi, T1.perenimi, T1.lopu_aeg + 1;