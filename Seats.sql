SELECT * FROM Reserveerimine R1
LEFT JOIN Reserveerimine R2
ON NOT(R1.omanik=R2.omanik)
WHERE NOT(R1.algus > R2.lõpp OR R2.algus > R1.lõpp);

SELECT * FROM Reserveerimine R1
LEFT JOIN Reserveerimine R2
ON NOT(R1.omanik=R2.omanik)
WHERE R1.algus > R2.lõpp OR R2.algus > R1.lõpp;