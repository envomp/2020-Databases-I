SELECT kulu_kategooria, SUM(lubatud_kulu), SUM(tegelik_kulu) FROM Eelarve E
LEFT JOIN Tegelik_kulu T
ON E.kulu_alamkategooria=T.kulu_alamkategooria
GROUP BY kulu_kategooria;
