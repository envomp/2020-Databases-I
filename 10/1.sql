SELECT * INTO Reserveerimine_koopia2 FROM Reserveerimine;

UPDATE Reserveerimine_koopia2 SET Reserveerimine_koopia2.kommentaar = Null
WHERE (((Reserveerimine_koopia2.külalise_nr) In (SELECT DISTINCT K.külalise_nr FROM
(SELECT * FROM Külaline K
LEFT JOIN Reserveerimine R ON R.külalise_nr=K.külalise_nr) as KR
LEFT JOIN Hotell H ON KR.hotelli_nr=H.hotelli_nr
WHERE K.aadress LIKE 'Tallinn%'
)) AND ((Reserveerimine_koopia2.hotelli_nr) In (SELECT DISTINCT KR.hotelli_nr FROM
(SELECT * FROM Külaline K
LEFT JOIN Reserveerimine R ON R.külalise_nr=K.külalise_nr) as KR
LEFT JOIN Hotell H ON KR.hotelli_nr=H.hotelli_nr
WHERE H.linn NOT LIKE 'Tallinn'
)));
