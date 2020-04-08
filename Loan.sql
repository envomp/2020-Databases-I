
SELECT DISTINCT L1.laenu_nbr FROM
(SELECT * FROM
(SELECT laenu_nbr, COUNT(makse_staatus) AS status FROM
(SELECT DISTINCT laenu_nbr, makse_staatus FROM Laen) as lnms
GROUP BY laenu_nbr) as lns WHERE status=1) L1
LEFT JOIN Laen L2
ON L1.laenu_nbr=L2.laenu_nbr
WHERE makse_staatus='F';
