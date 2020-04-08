SELECT konto_id, SUM(summa) as kontojääk FROM Kanne
GROUP BY konto_id;

SELECT K.kanne_id, K.konto_id, K.kande_aeg, K.summa, SUM(K_.summa) as kontojääk FROM
(SELECT * FROM Kanne K
LEFT JOIN
(SELECT * FROM Kanne) AS K_
ON K.konto_id=K_.konto_id AND K_.kanne_id <= K.kanne_id) as KK
GROUP BY K.kanne_id, K.konto_id, K.kande_aeg, K.summa;
