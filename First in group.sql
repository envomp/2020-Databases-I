SELECT DISTINCT jump FROM
(SELECT M1.mootmine_id, MIN(M2.mootmine_id) as jump FROM
(SELECT * FROM Mootmine ORDER BY mootmine_id) M1
RIGHT JOIN Mootmine M2
ON M2.mootmine_id > M1.mootmine_id
WHERE M2.seisund=1 AND (M1.seisund=0 OR M1.seisund IS NULL)
GROUP BY M1.mootmine_id) A;
