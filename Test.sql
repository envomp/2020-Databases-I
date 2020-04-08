CREATE TABLE Persons
(
    PersonID  int,
    LastName  varchar(255),
    FirstName varchar(255),
    Address   varchar(255),
    City      varchar(255),
    StudentID int
);

CREATE TABLE Persons2
(
    PersonID  int,
    LastName  varchar(255),
    FirstName varchar(255),
    Address   varchar(255),
    City      varchar(255),
    StudentID int
);

CREATE TABLE Student
(
    StudentID   int,
    StudentName varchar(255)
);


INSERT INTO Persons(PersonID, LastName, FirstName, Address, City, StudentID)
VALUES (1, 'Vompa', 'Enrico1', 'Kodu', 'Tallinn', 1);

INSERT INTO Persons(PersonID, LastName, FirstName, Address, City, StudentID)
VALUES (2, 'Vompa', 'Enrico2', 'Kodu', 'Tallinn', 2);

INSERT INTO Persons(PersonID, LastName, FirstName, Address, City, StudentID)
VALUES (3, 'Vompa', 'Enrico3', 'Kodu', 'Tallinn', 3);

INSERT INTO Persons(PersonID, LastName, FirstName, Address, City, StudentID)
VALUES (4, 'Vompa', 'Enrico4', 'Kodu', 'Tallinn', 4);

INSERT INTO Persons(PersonID, LastName, FirstName, Address, City, StudentID)
VALUES (5, 'Vompa', 'Enrico5', 'Kodu', 'Tallinn', 5);

INSERT INTO Persons(PersonID, LastName, FirstName, Address, City, StudentID)
VALUES (6, 'Vompa', 'Enrico6', 'Kodu', 'Tallinn', 6);

INSERT INTO Persons(PersonID, LastName, FirstName, Address, City, StudentID)
VALUES (7, 'Vompa', 'Enrico7', NULL, 'Tallinn', 7);

INSERT INTO Persons(PersonID, LastName, FirstName, Address, City, StudentID)
VALUES (8, 'Vompa', 'Enrico8', 'Kodu', NULL, 8);

INSERT INTO Persons(PersonID, LastName, FirstName, Address, City, StudentID)
VALUES (9, 'Vompa2', 'Enrico8', 'Kodu', NULL, 9);


INSERT INTO Persons2(PersonID, LastName, FirstName, Address, City)
VALUES (1, 'Vompa3', 'Enrico', NULL, 'Tallinn');

INSERT INTO Persons2(PersonID, LastName, FirstName, Address, City)
VALUES (2, 'Vompa2', 'Enrico', NULL, 'Tallinn');

INSERT INTO Persons2(PersonID, LastName, FirstName, Address, City)
VALUES (3, 'Vompa1', 'Enrico', NULL, 'Tallinn');

INSERT INTO Persons2(PersonID, LastName, FirstName, Address, City)
VALUES (4, 'Vompa', 'Enrico', NULL, NULL);

INSERT INTO Student(StudentID, StudentName)
VALUES (1, 'envomp1');

INSERT INTO Student(StudentID, StudentName)
VALUES (2, 'envomp2');

INSERT INTO Student(StudentID, StudentName)
VALUES (3, 'envomp3');

INSERT INTO Student(StudentID, StudentName)
VALUES (4, 'envomp4');

INSERT INTO Student(StudentID, StudentName)
VALUES (0, 'envomp0');


SELECT *
FROM Persons; # Select all

SELECT DISTINCT FirstName
FROM Persons; # Select all distinct firstnames

SELECT LastName
FROM Persons
WHERE FirstName = 'Enrico'; # Select all lastnames where firstname is Enrico

SELECT DISTINCT LastName
FROM Persons
WHERE FirstName = 'Enrico'; # Select all distinct lastnames where firstname is Enrico

SELECT PersonID
FROM Persons
WHERE NOT FirstName = 'Enrico'; # Select all id's where firstname is not Enrico

SELECT PersonID
FROM Persons
ORDER BY FirstName; # Select all id's sorted by first name

SELECT PersonID
FROM Persons
order by FirstName DESC; # Select all id's sorted reversed by first name

SELECT *
FROM Persons
order by FirstName DESC, PersonID DESC; # Select all sorted  by decreasing first name and then by decreasing ID's

SELECT *
FROM Persons
WHERE Address IS NULL; # Select all fields, where address is null

SELECT *
FROM Persons
WHERE Address IS NOT NULL
  AND City IS NOT NULL; # Select all fields, where address is null

UPDATE Persons
SET City = 'Eesti'
WHERE City IS NULL; # Set City to Eesti where it's NULL

UPDATE Persons
SET Address   = 'Mets',
    FirstName = 'Metslane'
WHERE Address IS NULL
  and City = 'Tallinn'; # Update all people from Tallinn to Address Mets and FirstName Metslane if Address is null

DELETE
FROM Persons
WHERE FirstName = 'Metslane'; # Delete all firstname = metslane

SELECT MIN(PersonID)
FROM Persons; # Minimum from id's

SELECT MAX(FirstName)
FROM Persons; # Last Name when ordered by FirstName ASC

SELECT COUNT(DISTINCT City)
FROM Persons
WHERE LastName = 'Vompa'; # Count distinct Citys with lastName Vompa

SELECT AVG(PersonID)
FROM Persons
WHERE LastName = 'Vompa'; # average with lastName Vompa

SELECT SUM(PersonID)
FROM Persons
WHERE LastName = 'Vompa'; # sum with lastName Vompa

SELECT AVG(DISTINCT PersonID)
INTO @average
FROM Persons; # get average of distinct id's

SELECT *
FROM Persons
WHERE PersonID <= (@average) + 1
  AND PersonID >= (@average) - 1; #  Select +- 1 from average distinct id's

SELECT *
FROM Persons
WHERE FirstName LIKE 'E%1'; # get all where FirstName starts with E and ends with 1

SELECT *
FROM Persons
WHERE FirstName LIKE '%1%'; # get all where FirstName contains 1

SELECT *
FROM Persons
WHERE FirstName LIKE '__rico%'; # get all where FirstName spaces 2 to 6 are rico

SELECT *
FROM Persons
WHERE FirstName REGEXP '[a-zA-Z].+'; # get all where FirstName starts with letter

SELECT *
FROM Persons
WHERE FirstName NOT LIKE '%1'; # Doesnt match regex

SELECT *
FROM Persons
WHERE FirstName IN ('Enrico1', 'Enrico2'); # in set

SELECT *
FROM Persons
WHERE PersonID BETWEEN 2 AND 5; # between 2 and 5 inclusive

SELECT *
FROM Persons
WHERE City BETWEEN 'Aafrika' AND 'Egiptus';

SELECT FirstName, LastName AS FamilyName, City
FROM Persons; # Create Alias for LastName column to be seen as FamilyName instead

SELECT *
FROM Persons AS Students; # Create Alias for Persons table to be seen as Students

SELECT *
FROM Persons
         JOIN Student ON Persons.StudentID = Student.StudentID;

SELECT *
FROM Persons
         LEFT JOIN Student ON Persons.StudentID = Student.StudentID
UNION
SELECT *
FROM Persons
         RIGHT JOIN Student ON Persons.StudentID = Student.StudentID; # Outer join

SELECT COUNT(*), LastName
from Persons
GROUP BY LastName; # Count of people with lastname

SELECT COUNT(*), LastName
from Persons
GROUP BY LastName
ORDER BY COUNT(*) DESC; # Count of people with lastname sorted increasing

ALTER TABLE Persons
    ADD Length INT NOT NULL AUTO_INCREMENT UNIQUE; # Alter table to create new field Length that is unique and auto_increments

ALTER TABLE Persons
    DROP COLUMN Length; # Delete column Length

ALTER TABLE Persons2
    ADD COLUMN Auto INT UNIQUE AUTO_INCREMENT;

INSERT INTO Persons2(FirstName)
VALUES ('Enrico2');

SELECT COUNT(*), FirstName
FROM Persons2
GROUP BY FirstName;

SELECT *
FROM Persons2
         LEFT JOIN Persons ON Persons2.Auto = Persons.PersonID
UNION
SELECT *
FROM Persons2
         RIGHT JOIN Persons ON Persons2.Auto = Persons.PersonID; # get all

SET FOREIGN_KEY_CHECKS = 0;
drop table if exists Persons;
drop table if exists Persons2;
drop table if exists Student;
SET FOREIGN_KEY_CHECKS = 1;

#######################

SELECT Count(*) AS arv
FROM Reserveerimine
         LEFT JOIN Hotell ON Hotell.hotelli_nr = Reserveerimine.hotelli_nr
WHERE (Year(alguse_aeg) = 2004 AND on_aktuaalne = TRUE AND Hotell.nimi = 'Viru');

########################

SELECT K.külalise_nr, K.perenimi
FROM Külaline K
         INNER JOIN Reserveerimine R
                    ON K.külalise_nr = R.külalise_nr
WHERE (SELECT COUNT(*) FROM Reserveerimine WHERE külalise_nr = K.külalise_nr) >= 2
GROUP BY K.külalise_nr, K.perenimi
ORDER BY K.perenimi DESC;

#########################

SELECT hotelli_nr, MAX(repetitions) as
FROM
    (
    SELECT H.hotelli_nr, Count (*) as repetitions FROM Reserveerimine R
    RIGHT JOIN Hotell H
    ON R.hotelli_nr=H.hotelli_nr
    GROUP BY H.hotelli_nr
    )
;

#########################

SELECT H.hotelli_nr, H.nimi FROM (

SELECT H.hotelli_nr, H.nimi from Hotell H
RIGHT JOIN

(SELECT hotelli_nr FROM
(
SELECT R.hotelli_nr, Count(Temp.külalise_nr) AS amount
FROM Reserveerimine AS R LEFT JOIN (SELECT K.külalise_nr, COUNT(*)
FROM (SELECT külalise_nr
      FROM (SELECT külalise_nr, COUNT(*) as rep
            FROM Reserveerimine R
            GROUP BY külalise_nr)

      WHERE rep = (
          SELECT MAX(rep)
          FROM (
                   SELECT külalise_nr, COUNT(*) as rep
                   FROM Reserveerimine R
                   GROUP BY külalise_nr))) AS K
    GROUP BY K.külalise_nr
)  AS Temp ON R.külalise_nr = Temp.külalise_nr
GROUP BY R.hotelli_nr
) as Visited
 WHERE
Visited.amount = 0

UNION

(SELECT H.hotelli_nr FROM Hotell H
LEFT JOIN Reserveerimine R
ON H.hotelli_nr = R.hotelli_nr
WHERE R.hotelli_nr is NULL
)) as Temp

ON H.hotelli_nr = Temp.hotelli_nr
WHERE Temp.hotelli_nr IS NOT NULL)
ORDER BY H.hotelli_nr ASC


SELECT DISTINCT  S.tellimus_id as tellimus, S1.kuupaev as loodud, S2.kuupaev as kinnitatud, S3.kuupaev as täidetud  FROM ((Syndmus S
LEFT JOIN
(SELECT kuupaev, tellimus_id, seisund FROM Syndmus) S1
ON S.tellimus_id=S1.tellimus_id)
LEFT JOIN
(SELECT kuupaev, tellimus_id, seisund FROM Syndmus) S2
ON S.tellimus_id=S2.tellimus_id)
LEFT JOIN
(SELECT kuupaev, tellimus_id, seisund FROM Syndmus) S3
ON S.tellimus_id=S3.tellimus_id

WHERE S1.kuupaev < S2.kuupaev AND S1.seisund=1 AND S2.seisund=2 AND S3.seisund=3


SELECT DISTINCT S.tellimus_id as tellimus, S1.kuupaev as loodud, S2.kuupaev as kinnitatud, S3.kuupaev as täidetud  FROM ((Syndmus S
LEFT JOIN
(SELECT kuupaev, tellimus_id, seisund FROM Syndmus UNION ALL (SELECT NULL, S.tellimus_id, 1)) S1
ON S.tellimus_id=S1.tellimus_id)
LEFT JOIN
(SELECT kuupaev, tellimus_id, seisund FROM Syndmus) S2
ON S.tellimus_id=S2.tellimus_id)
LEFT JOIN
(SELECT kuupaev, tellimus_id, seisund FROM Syndmus) S3
ON S.tellimus_id=S3.tellimus_id

WHERE S1.kuupaev < S2.kuupaev AND S1.seisund=1 AND S2.seisund=2 AND S3.seisund=3

TRANSFORM FIRST(Syndmus.kuupaev)
SELECT Syndmus.tellimus_id
FROM Syndmus
GROUP BY Syndmus.tellimus_id
PIVOT Syndmus.seisund


SELECT * FROM

(SELECT V1.varustaja_nr AS varustaja_1, V2.varustaja_nr AS varustaja_2, COUNT(*) as amount FROM VarustajaOsad V1
LEFT JOIN VarustajaOsad V2
ON V1.osa_nr=V2.osa_nr AND V1.varustaja_nr < V2.varustaja_nr
GROUP BY V1.varustaja_nr, V2.varustaja_nr) V

LEFT JOIN

(SELECT V.varustaja_nr, COUNT(*) AS amount FROM VarustajaOsad V
GROUP BY V.varustaja_nr) V_

ON V.varustaja_1 = V_.varustaja_nr

WHERE V.amount=V_.amount




SELECT * FROM

(SELECT V1.varustaja_nr AS varustaja_1, V2.varustaja_nr AS varustaja_2, COUNT(*) as amount FROM VarustajaOsad V1
LEFT JOIN VarustajaOsad V2
ON V1.osa_nr=V2.osa_nr
GROUP BY V1.varustaja_nr, V2.varustaja_nr) V

LEFT JOIN

(SELECT V.varustaja_nr, COUNT(*) AS amount FROM VarustajaOsad V
GROUP BY V.varustaja_nr) V_

ON V.varustaja_1 = V_.varustaja_nr

WHERE V.amount=V_.amount and NOT(varustaja_1 = varustaja_2)



SELECT DISTINCT * FROM

(SELECT V1.varustaja_nr AS varustaja_1, V2.varustaja_nr AS varustaja_2, COUNT(*) as amount FROM VarustajaOsad V1
LEFT JOIN VarustajaOsad V2
ON V1.osa_nr=V2.osa_nr AND V1.varustaja_nr < V2.varustaja_nr
GROUP BY V1.varustaja_nr, V2.varustaja_nr) V

LEFT JOIN

(SELECT V1.varustaja_nr AS varustaja_1, V2.varustaja_nr AS varustaja_2, COUNT(*) as amount FROM VarustajaOsad V1
LEFT JOIN VarustajaOsad V2
ON V1.osa_nr=V2.osa_nr AND V1.varustaja_nr > V2.varustaja_nr
GROUP BY V1.varustaja_nr, V2.varustaja_nr) V_

ON V.amount=V_.amount AND V.varustaja_1=V_.varustaja_2 AND V.varustaja_2=V_.varustaja_1
WHERE V_.varustaja_1 IS NOT NULL





SELECT tootaja_id, perenimi, arv FROM Tootaja T_ RIGHT JOIN
(SELECT T1.alluv, COUNT(*) as arv FROM ((Tootaja_seos T1
LEFT JOIN Tootaja_seos T2 ON T1.alluv=T2.ylemus)
LEFT JOIN Tootaja_seos T3 ON T2.alluv=T3.ylemus)
WHERE T3.alluv IS NOT NULL
GROUP BY T1.alluv) T
ON T_.tootaja_id=T.alluv


SELECT ruumi_nr, COUNT(*) as total FROM Reserveerimine GROUP BY ruumi_nr HAVING COUNT(*) IN
(SELECT LAST(ruumi_nr) as ruumi_nr FROM (SELECT DISTINCT TOP 2 ruumi_nr, COUNT(*) as total FROM Reserveerimine GROUP BY ruumi_nr ORDER BY COUNT(*) DESC))



SELECT * FROM Ruum
WHERE
ruumi_nr IN (SELECT LAST(ruumi_nr) FROM (SELECT DISTINCT TOP 2 ruumi_nr, hotelli_nr, COUNT(*) as total FROM Reserveerimine GROUP BY ruumi_nr, hotelli_nr ORDER BY COUNT(*) DESC))
AND hotelli_nr IN (SELECT LAST(hotelli_nr) FROM (SELECT DISTINCT TOP 2 ruumi_nr, hotelli_nr, COUNT(*) as total FROM Reserveerimine GROUP BY ruumi_nr, hotelli_nr ORDER BY COUNT(*) DESC))


-- ZERO DAWN
SELECT DAY(MIN(alguse_kp)) + 31 * MONTH(MIN(alguse_kp)) + 31*12*YEAR(MIN(alguse_kp)) FROM Tegevus

SELECT (DAY(alguse_kp) + 31 * MONTH(alguse_kp) + 31*12*YEAR(alguse_kp)) - (SELECT DAY(MIN(alguse_kp)) + 31 * MONTH(MIN(alguse_kp)) + 31*12*YEAR(MIN(alguse_kp)) FROM Tegevus) FROM Tegevus


+ 31*12*(YEAR(T.alguse_kp) - (SELECT MIN(YEAR(alguse_kp)) FROM Tegevus))
+ 31*12*(YEAR(T.lõpu_kp) - (SELECT MIN(YEAR(alguse_kp)) FROM Tegevus))

SELECT * FROM Arv A
RIGHT JOIN Tegevus T
ON A.arv >= (
    DAY(T.alguse_kp)
    + 31 * MONTH(T.alguse_kp)
    + 31 * 12 * (
        YEAR(T.alguse_kp) - (SELECT MIN(YEAR(alguse_kp)) FROM Tegevus)
    )
) AND A.arv <= (
    DAY(T.lõpu_kp)
    + 31 * MONTH(T.lõpu_kp)
    + 31 * 12 * (
        YEAR(T.lõpu_kp) - (SELECT MIN(YEAR(alguse_kp)) FROM Tegevus)
    )
)





SELECT * FROM Arv A
RIGHT JOIN (SELECT tegevus_id, kirjeldus, alguse_kp, lõpu_kp, (SELECT MIN(YEAR(alguse_kp)) FROM Tegevus) as minimum  FROM Tegevus) T
ON A.arv >= (
    DAY(T.alguse_kp)
    + 31 * MONTH(T.alguse_kp)
    + 31 * 12 * (YEAR(T.alguse_kp) - T.minimum)
) AND A.arv <= (
    DAY(T.lõpu_kp)
    + 31 * MONTH(T.lõpu_kp)
    + 31 * 12 * (YEAR(T.lõpu_kp) - T.minimum)
)


SELECT * FROM
(SELECT * FROM Arv A
RIGHT JOIN Tegevus T
ON A.arv >= (
    DAY(T.alguse_kp)
    + 31 * MONTH(T.alguse_kp)
) AND A.arv <= (
    DAY(T.lõpu_kp)
    + 31 * MONTH(T.lõpu_kp)))



(SELECT arv, COUNT(*) AS amount FROM
(SELECT * FROM Arv A
RIGHT JOIN Tegevus T
ON A.arv >= (DAY(T.alguse_kp) + 31 * MONTH(T.alguse_kp)) AND A.arv <= (DAY(T.lõpu_kp) + 31 * MONTH(T.lõpu_kp)))
GROUP BY arv)
HAVING COUNT(*) = (SELECT MAX(amount) FROM
(SELECT arv, COUNT(*) AS amount FROM
(SELECT * FROM Arv A
RIGHT JOIN Tegevus T
ON A.arv >= (DAY(T.alguse_kp) + 31 * MONTH(T.alguse_kp)) AND A.arv <= (DAY(T.lõpu_kp) + 31 * MONTH(T.lõpu_kp)))
GROUP BY arv))


SELECT * FROM
(SELECT M1.mootmine_id, MIN(M2.mootmine_id) as jump FROM
(SELECT * FROM Mootmine ORDER BY mootmine_id) M1
RIGHT JOIN Mootmine M2
ON M2.mootmine_id > M1.mootmine_id
WHERE M2.seisund=1 AND M1.seisund=0
GROUP BY M1.mootmine_id) A

RIGHT JOIN

(SELECT jump FROM
(SELECT M1.mootmine_id, MIN(M2.mootmine_id) as jump FROM
(SELECT * FROM Mootmine ORDER BY mootmine_id) M1
RIGHT JOIN Mootmine M2
ON M2.mootmine_id > M1.mootmine_id
WHERE M2.seisund=1 AND M1.seisund=0
GROUP BY M1.mootmine_id)) B

ON A.mootmine_id=B.jump
