SELECT K.tootaja_id, perenimi, summa FROM
Konsultant K
INNER JOIN
(SELECT TT.tootaja_id, SUM(tootunde*tunnitasu) AS summa FROM
(SELECT T.tootaja_id, kuupaev, tootunde, MAX(alguse_aeg) as aeg FROM Tootund T
LEFT JOIN Tasumaar Ta
ON T.kuupaev>=Ta.alguse_aeg AND T.tootaja_id=Ta.tootaja_id
GROUP BY T.tootaja_id, kuupaev, tootunde) TT
LEFT JOIN Tasumaar T_
ON TT.tootaja_id=T_.tootaja_id AND TT.aeg=T_.alguse_aeg
GROUP BY TT.tootaja_id) A
ON K.tootaja_id=A.tootaja_id;
