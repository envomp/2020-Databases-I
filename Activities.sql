(SELECT arv MOD 31 as päev, INT(arv / 31) as kuu FROM
(SELECT * FROM Arv A
RIGHT JOIN Tegevus T
ON A.arv >= (DAY(T.alguse_kp) + 31 * MONTH(T.alguse_kp)) AND A.arv <= (DAY(T.lõpu_kp) + 31 * MONTH(T.lõpu_kp)))
GROUP BY arv HAVING COUNT(*) = (SELECT MAX(amount) FROM
(SELECT arv, COUNT(*) AS amount FROM
(SELECT * FROM Arv A
RIGHT JOIN Tegevus T
ON A.arv >= (DAY(T.alguse_kp) + 31 * MONTH(T.alguse_kp)) AND A.arv <= (DAY(T.lõpu_kp) + 31 * MONTH(T.lõpu_kp)))
GROUP BY arv)));
