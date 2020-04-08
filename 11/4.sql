ALTER TABLE Hotell
ADD kommentaar VARCHAR(255);

UPDATE Hotell
SET kommentaar = (kommentaar & 'Kustutamise kandidaat')
WHERE hotelli_nr NOT IN
(SELECT hotelli_nr FROM Reserveerimine
WHERE YEAR(alguse_aeg) = YEAR(DATE())
GROUP BY hotelli_nr
HAVING COUNT(*) > 1)
