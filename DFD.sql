
SELECT S.diagramm, S.sisend FROM

(SELECT diagramm, sisend, COUNT(protsess) as cnt FROM
(SELECT DISTINCT diagramm, protsess, sisend  FROM DFD) as dps
GROUP BY diagramm, sisend) S

INNER JOIN

(SELECT diagramm, COUNT(protsess) as cnt FROM
(SELECT DISTINCT diagramm, protsess  FROM DFD) as dp
GROUP BY diagramm) P

ON P.diagramm=S.diagramm
WHERE NOT(S.cnt=P.cnt);
