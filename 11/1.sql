SELECT * INTO Hotell_koopia FROM Hotell
WHERE hotelli_nr IN
(SELECT hotelli_nr FROM Hotell
WHERE hotelli_nr NOT IN
(SELECT DISTINCT hotelli_nr FROM Ruum
WHERE ruumi_tüüp = 'Äriklassi tuba'));

ALTER TABLE Hotell_koopia
ADD CONSTRAINT pk_hotell PRIMARY KEY (hotelli_nr);

ALTER TABLE Hotell_koopia
ADD CONSTRAINT ak_hotell UNIQUE (nimi);

DROP TABLE hotell_koopia;