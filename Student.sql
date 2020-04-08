SELECT matrikli_nr FROM
(SELECT matrikli_nr, COUNT(*) AS amount FROM YliopAine
WHERE aine_kood IN (SELECT * FROM Uuritav)
GROUP BY matrikli_nr) as mna
WHERE amount = (SELECT COUNT(*) FROM Uuritav);

SELECT matrikli_nr FROM
(SELECT matrikli_nr, COUNT(*) AS amount FROM YliopAine
WHERE aine_kood IN (SELECT * FROM Uuritav) GROUP BY matrikli_nr) as m
WHERE amount = (SELECT COUNT(*) FROM Uuritav) AND
matrikli_nr IN (SELECT matrikli_nr FROM
(SELECT matrikli_nr, COUNT(*) AS amount FROM YliopAine GROUP BY matrikli_nr) as mna
WHERE amount = (SELECT COUNT(*) FROM Uuritav));
