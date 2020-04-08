DELETE FROM Tarbijad WHERE tarbija_id IN
(SELECT tarbija_id FROM Tarbijad T
WHERE T.tarbija_id IN (SELECT DISTINCT perekonna_liige FROM Tarbijad WHERE perekonna_liige IS NOT NULL));

DELETE FROM Tarbijad WHERE tarbija_id IN
(SELECT T.tarbija_id FROM Tarbijad T WHERE T.tarbija_id NOT IN
(SELECT T_.tarbija_id FROM
(SELECT MIN(tarbija_id) as tarbija_id, aadress FROM Tarbijad T
GROUP BY aadress) T_));