SELECT M.müügiaruanne_id, M.müügimees, M.piirkond, M.läbimüük, M_.place AS asetus FROM MüügiAruanne M
LEFT JOIN
(SELECT M1.piirkond, M1.läbimüük, COUNT(*) AS place FROM
(SELECT DISTINCT piirkond, läbimüük FROM MüügiAruanne) M1
RIGHT JOIN
(SELECT DISTINCT piirkond, läbimüük FROM MüügiAruanne) M2
ON M2.piirkond=M1.piirkond AND M2.läbimüük >= M1.läbimüük
GROUP BY M1.piirkond, M1.läbimüük) M_
ON M.läbimüük=M_.läbimüük AND M.piirkond=M_.piirkond;