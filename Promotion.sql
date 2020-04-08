SELECT  B.kampaania_id, nimetus, müüja_id, best AS müügi_summa FROM

(SELECT kampaania_id, MAX(total) as best FROM
(SELECT kampaania_id, müüja_id, SUM(kogus) AS total FROM Reklaamikampaania R
RIGHT JOIN Müük M
ON R.alguse_kp <= M.müügi_kp AND R.lopu_kp >= M.müügi_kp
WHERE kampaania_id IS NOT NULL
GROUP BY kampaania_id, müüja_id) as B_
GROUP BY kampaania_id) AS B

LEFT JOIN

(SELECT kampaania_id, nimetus, müüja_id, SUM(kogus) AS total FROM Reklaamikampaania R
RIGHT JOIN Müük M
ON R.alguse_kp <= M.müügi_kp AND R.lopu_kp >= M.müügi_kp
WHERE kampaania_id IS NOT NULL
GROUP BY kampaania_id, nimetus, müüja_id) AS T

ON B.best=T.total
ORDER BY best DESC;
