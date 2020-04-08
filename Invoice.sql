SELECT * FROM
(SELECT DISTINCT O.kauba_id as kaup1, O2.kauba_id as kaup2, COUNT(*) AS arv FROM Ost O
LEFT JOIN Ost O2
ON O.kauba_id < O2.kauba_id AND O.arve_id=O2.arve_id
GROUP BY O.kauba_id, O2.kauba_id
HAVING O2.kauba_id IS NOT NULL) as k1k2a
ORDER BY arv DESC;
