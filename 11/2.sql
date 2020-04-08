SELECT * INTO Hotell_koopia FROM Hotell;

DELETE FROM Hotell_koopia WHERE hotelli_nr IN
(SELECT hotelli_nr FROM
(SELECT COUNT(hotelli_nr) as cnt, hotelli_nr FROM Ruum
WHERE ruumi_tüüp='Äriklassi tuba' AND hind <= 500 OR NOT(ruumi_tüüp='Äriklassi tuba')
GROUP BY hotelli_nr
HAVING COUNT(hotelli_nr) > 5));