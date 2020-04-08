SELECT element FROM (
SELECT element, Count(*) AS cnt FROM Sets
GROUP BY element) as ec
WHERE cnt=(SELECT COUNT(*) FROM (SELECT DISTINCT id FROM Sets) as Si);