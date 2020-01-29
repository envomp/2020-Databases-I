CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255),
    StudentID int
);

CREATE TABLE Persons2 (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255),
    StudentID int
);

CREATE TABLE Student (
    StudentID int,
    StudentName varchar(255)
);

INSERT INTO Persons(PersonID,LastName,FirstName,Address,City, StudentID) VALUES (1, 'Vompa','Enrico1','Kodu','Tallinn', 1);

INSERT INTO Persons(PersonID,LastName,FirstName,Address,City, StudentID) VALUES (2, 'Vompa','Enrico2','Kodu','Tallinn', 2);

INSERT INTO Persons(PersonID,LastName,FirstName,Address,City, StudentID) VALUES (3, 'Vompa','Enrico3','Kodu','Tallinn', 3);

INSERT INTO Persons(PersonID,LastName,FirstName,Address,City, StudentID) VALUES (4, 'Vompa','Enrico4','Kodu','Tallinn', 4);

INSERT INTO Persons(PersonID,LastName,FirstName,Address,City, StudentID) VALUES (5, 'Vompa','Enrico5','Kodu','Tallinn', 5);

INSERT INTO Persons(PersonID,LastName,FirstName,Address,City, StudentID) VALUES (6, 'Vompa','Enrico6','Kodu','Tallinn', 6);

INSERT INTO Persons(PersonID,LastName,FirstName,Address,City, StudentID) VALUES (7, 'Vompa','Enrico7',NULL,'Tallinn', 7);

INSERT INTO Persons(PersonID,LastName,FirstName,Address,City, StudentID) VALUES (8, 'Vompa','Enrico8','Kodu',NULL, 8);

INSERT INTO Persons(PersonID,LastName,FirstName,Address,City, StudentID) VALUES (9, 'Vompa2','Enrico8','Kodu',NULL, 9);


INSERT INTO Persons2(PersonID,LastName,FirstName,Address,City) VALUES (1, 'Vompa3','Enrico',NULL,'Tallinn');

INSERT INTO Persons2(PersonID,LastName,FirstName,Address,City) VALUES (2, 'Vompa2','Enrico',NULL,'Tallinn');

INSERT INTO Persons2(PersonID,LastName,FirstName,Address,City) VALUES (3, 'Vompa1','Enrico',NULL,'Tallinn');

INSERT INTO Persons2(PersonID,LastName,FirstName,Address,City) VALUES (4, 'Vompa','Enrico',NULL,NULL);

INSERT INTO Student(StudentID, StudentName) VALUES (1, 'envomp1');

INSERT INTO Student(StudentID, StudentName) VALUES (2, 'envomp2');

INSERT INTO Student(StudentID, StudentName) VALUES (3, 'envomp3');

INSERT INTO Student(StudentID, StudentName) VALUES (4, 'envomp4');

INSERT INTO Student(StudentID, StudentName) VALUES (0, 'envomp0');


SELECT * FROM Persons; # Select all

SELECT DISTINCT FirstName FROM Persons; # Select all distinct firstnames

SELECT LastName FROM Persons WHERE FirstName = 'Enrico'; # Select all lastnames where firstname is Enrico

SELECT DISTINCT LastName FROM Persons WHERE FirstName = 'Enrico'; # Select all distinct lastnames where firstname is Enrico

SELECT PersonID FROM Persons WHERE NOT FirstName = 'Enrico'; # Select all id's where firstname is not Enrico

SELECT PersonID FROM Persons ORDER BY FirstName; # Select all id's sorted by first name

SELECT PersonID FROM Persons order by FirstName DESC; # Select all id's sorted reversed by first name

SELECT * FROM Persons order by FirstName DESC, PersonID DESC; # Select all sorted  by decreasing first name and then by decreasing ID's

SELECT * FROM Persons WHERE Address IS NULL; # Select all fields, where address is null

SELECT * FROM Persons WHERE Address IS NOT NULL AND City IS NOT NULL; # Select all fields, where address is null

UPDATE Persons SET City = 'Eesti' WHERE City IS NULL; # Set City to Eesti where it's NULL

UPDATE Persons SET Address = 'Mets', FirstName = 'Metslane' WHERE Address IS NULL and City = 'Tallinn'; # Update all people from Tallinn to Address Mets and FirstName Metslane if Address is null

DELETE FROM Persons WHERE FirstName = 'Metslane'; # Delete all firstname = metslane

SELECT MIN(PersonID) FROM Persons; # Minimum from id's

SELECT MAX(FirstName) FROM Persons; # Last Name when ordered by FirstName ASC

SELECT COUNT(DISTINCT City)  FROM Persons WHERE LastName = 'Vompa'; # Count distinct Citys with lastName Vompa

SELECT AVG(PersonID) FROM Persons WHERE LastName = 'Vompa'; # average with lastName Vompa

SELECT SUM(PersonID) FROM Persons WHERE LastName = 'Vompa'; # sum with lastName Vompa

SELECT AVG(DISTINCT PersonID) INTO @average FROM Persons; # get average of distinct id's

SELECT * FROM Persons WHERE PersonID <= (@average) + 1 AND PersonID >= (@average) - 1; #  Select +- 1 from average distinct id's

SELECT * FROM Persons WHERE FirstName LIKE 'E%1'; # get all where FirstName starts with E and ends with 1

SELECT * FROM Persons WHERE FirstName LIKE '%1%'; # get all where FirstName contains 1

SELECT * FROM Persons WHERE FirstName LIKE '__rico%'; # get all where FirstName spaces 2 to 6 are rico

SELECT * FROM Persons WHERE FirstName REGEXP '[a-zA-Z].+'; # get all where FirstName starts with letter

SELECT * FROM Persons WHERE FirstName NOT LIKE '%1'; # Doesnt match regex

SELECT * FROM Persons WHERE FirstName IN ('Enrico1', 'Enrico2'); # in set

SELECT * FROM Persons WHERE PersonID BETWEEN 2 AND 5; # between 2 and 5 inclusive

SELECT * FROM Persons WHERE City BETWEEN 'Aafrika' AND 'Egiptus';

SELECT FirstName, LastName AS FamilyName, City FROM Persons; # Create Alias for LastName column to be seen as FamilyName instead

SELECT * FROM Persons AS Students; # Create Alias for Persons table to be seen as Students

SELECT * FROM Persons JOIN Student ON Persons.StudentID = Student.StudentID;

SELECT * FROM Persons LEFT JOIN Student ON Persons.StudentID = Student.StudentID UNION SELECT * FROM Persons RIGHT JOIN Student ON Persons.StudentID = Student.StudentID; # Outer join

SELECT COUNT(*), LastName from Persons GROUP BY LastName; # Count of people with lastname

SELECT COUNT(*), LastName from Persons GROUP BY LastName ORDER BY COUNT(*) DESC; # Count of people with lastname sorted increasing

ALTER TABLE Persons ADD Length INT NOT NULL AUTO_INCREMENT UNIQUE; # Alter table to create new field Length that is unique and auto_increments

ALTER TABLE Persons DROP COLUMN Length; # Delete column Length

ALTER TABLE Persons2 ADD COLUMN Auto INT UNIQUE AUTO_INCREMENT;

INSERT INTO Persons2(FirstName) VALUES ('Enrico2');

SELECT COUNT(*), FirstName FROM Persons2 GROUP BY FirstName;

SELECT * FROM Persons2 LEFT JOIN Persons ON Persons2.Auto=Persons.PersonID UNION SELECT * FROM Persons2 RIGHT JOIN Persons ON Persons2.Auto=Persons.PersonID; # get all

DROP TABLE Persons;