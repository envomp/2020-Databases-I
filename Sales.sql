SELECT * FROM
(SELECT kliendi_id, AVG(delta) AS keskmine FROM
(SELECT M.kliendi_id, M.müügi_kuupäev, MIN(M2.müügi_kuupäev-M.müügi_kuupäev) as delta
FROM Müük M LEFT JOIN Müük M2
ON M2.müügi_kuupäev > M.müügi_kuupäev AND M2.kliendi_id=M.kliendi_id
GROUP BY M.kliendi_id, M.müügi_kuupäev) as D
GROUP BY kliendi_id) as kik
WHERE keskmine IS NOT NULL;