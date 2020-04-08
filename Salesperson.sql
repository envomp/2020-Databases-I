SELECT müügi_id, piirkonna_id, müüja_id, kogus FROM
(SELECT M.M1.müügi_id, M.M1.piirkonna_id,  M.M1.müüja_id, M.M1.kogus, COUNT(*) as amount FROM
(SELECT * FROM
(SELECT * FROM Müük) M1
RIGHT JOIN
(SELECT DISTINCT piirkonna_id, kogus FROM Müük) M2
ON M1.kogus <= M2.kogus AND M1.piirkonna_id=M2.piirkonna_id) M
GROUP BY M.M1.müügi_id, M.M1.piirkonna_id,  M.M1.müüja_id, M.M1.kogus) as M3
WHERE amount <= 3
ORDER BY piirkonna_id, kogus DESC;