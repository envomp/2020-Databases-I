SELECT AVG(boonuspunktid) as keskmine FROM Klient
WHERE klient_id IN
(SELECT klient_id FROM
(SELECT klient_id, COUNT(toode_id) AS arv FROM
(SELECT DISTINCT klient_id, toode_id FROM Tellimus T
RIGHT JOIN Tellimuse_rida R ON T.tellimus_id=R.tellimus_id) as kiti
GROUP BY klient_id) as kia
WHERE arv=(SELECT COUNT(*) FROM Toode));