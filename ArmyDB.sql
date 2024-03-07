CREATE DATABASE IF NOT EXISTS ArmyDB;

USE ArmyDB;

CREATE TABLE IF NOT EXISTS WeaponsDistribution
(
	Fullname VARCHAR (30),
    Platoon VARCHAR (10),
    Guns VARCHAR (10),
    GaveOut VARCHAR (50)
);

INSERT INTO WeaponsDistribution
(Fullname, Platoon, Guns, GaveOut)
VALUES
('Petrov V.A.', 222, 'AK-47', 'Burov O.S., Mayor'),
('Petrov V.A.', 222, 'Glock-20', 'Rybakov N.G., Mayor'),
('Lodarev P.S.', 232, 'AK-74', 'Derebanov V.Y., Lieutenant colonel'),
('Lodarev P.S.', 232, 'Glock-20', 'Rybakov N.G., Mayor'),
('Ivaschenko A.A.', 212, 'AK-47', 'Burov O.S., mayor'),
('Ivaschenko A.A.', 212, 'Glock-20', 'Rybakov N.G., Mayor'),
('Duhov R.M.', 200, 'AK-47', 'Burov O.S., mayor');

SELECT * FROM WeaponsDistribution;

-------------------------------------------------------------------------
--								Перша НФ
-------------------------------------------------------------------------

DROP TABLE WeaponsDistribution;

CREATE TABLE IF NOT EXISTS WeaponsDistribution
(
	SoldierNo INT NOT NULL,
    LineItem INT NOT NULL,
	LastName VARCHAR (30) NOT NULL,
	FirstName VARCHAR (30) NOT NULL,
	MiddleName VARCHAR (30) NOT NULL,
    Platoon INT NOT NULL,
    Guns VARCHAR (10) NOT NULL,
    GaveOut VARCHAR (50) NOT NULL,
    GaveOutRank VARCHAR (20) NOT NULL,
    PRIMARY KEY (SoldierNo, LineItem)
);

INSERT INTO WeaponsDistribution
(SoldierNo, LineItem, LastName, FirstName, MiddleName, Platoon, Guns, GaveOut, GaveOutRank)
VALUES
(1, 1, 'Petrov', 'Vladimir', 'Alexandrovich', 222, 'AK-47', 'Burov O.S.' , 'Mayor'),
(1, 2, 'Petrov', 'Vladimir', 'Alexandrovich', 222, 'Glock-20', 'Rybakov N.G.' , 'Mayor'),
(2, 1, 'Lodarev', 'Pavel', 'Silvestrovich', 232, 'AK-74', 'Derebanov V.Y.' , 'Lieutenant colonel'),
(2, 2, 'Lodarev', 'Pavel', 'Silvestrovich', 232, 'Glock-20', 'Rybakov N.G.' , 'Mayor'),
(3, 1, 'Ivaschenko', 'Alexey', 'Alexeevich', 212, 'AK-47', 'Burov O.S.' , 'Mayor'),
(3, 2, 'Ivaschenko', 'Alexey', 'Alexeevich', 212, 'Glock-20', 'Rybakov N.G.' , 'Mayor'),
(4, 1, 'Duhov', 'Roman', 'Mihailovich', 200, 'AK-47', 'Burov O.S.' , 'Mayor');

SELECT * FROM WeaponsDistribution;

-------------------------------------------------------------------------
--								Друга НФ
-------------------------------------------------------------------------

DROP TABLE WeaponsDistribution;
DROP TABLE Soldiers;
DROP TABLE Officers;
DROP TABLE Weapons;

CREATE TABLE IF NOT EXISTS Soldiers
(
	SoldierID INT AUTO_INCREMENT NOT NULL,
    LastName VARCHAR (30) NOT NULL,
	FirstName VARCHAR (30) NOT NULL,
	MiddleName VARCHAR (30) NOT NULL,
	Platoon INT NOT NULL,
    PRIMARY KEY (SoldierID)
);

INSERT INTO Soldiers
(LastName, FirstName, MiddleName, Platoon)
VALUES
('Petrov', 'Vladimir', 'Alexandrovich', 222),
('Lodarev', 'Pavel', 'Silvestrovich', 232),
('Ivaschenko', 'Alexey', 'Alexeevich', 212),
('Duhov', 'Roman', 'Mihailovich', 200);

CREATE TABLE IF NOT EXISTS Officers
(
	OfficerID INT AUTO_INCREMENT NOT NULL,
    LastName VARCHAR (30) NOT NULL,
	FirstName VARCHAR (30) NOT NULL,
	MiddleName VARCHAR (30) NOT NULL,
    OfficerRank VARCHAR (30) NOT NULL,
    PRIMARY KEY (OfficerID)
);

INSERT INTO Officers
(LastName, FirstName, MiddleName, OfficerRank)
VALUES
('Burov', 'Oleh', 'Sergeevich', 'Mayor'),
('Rybakov', 'Nikolay', 'Genadievich', 'Mayor'),
('Derebanov', 'Victor', 'Yosipovich', 'Lieutenant colonel');

CREATE TABLE IF NOT EXISTS Weapons

(
	WeaponID INT AUTO_INCREMENT NOT NULL,
    Name VARCHAR (10) NOT NULL,
    Type VARCHAR (10) NOT NULL,
    Caliber VARCHAR (20) NOT NULL,
    Capacity INT NOT NULL,
    PRIMARY KEY (WeaponID)
);

INSERT INTO Weapons
(Name, Type, Caliber, Capacity)
VALUES
('AK-47', 'Rifle', '7.62 * 39mm', '30'),
('AK-74', 'Rifle', '5.45 * 39mm', '30'),
('Glock-20', 'Pistol', '10mm auto', '15');

CREATE TABLE IF NOT EXISTS WeaponsDistribution
(
    WeaponID INT NOT NULL,
    IssuedBy INT NOT NULL,
    IssuedTo INT NOT NULL,
    PRIMARY KEY (WeaponID, IssuedTo),
    FOREIGN KEY (WeaponID) REFERENCES Weapons (WeaponID),
    FOREIGN KEY (IssuedBy) REFERENCES Officers (OfficerID),
    FOREIGN KEY (IssuedTo) REFERENCES Soldiers (SoldierID)
);

INSERT INTO WeaponsDistribution
(WeaponID, IssuedBy, IssuedTo)
VALUES
(1, 1, 1),
(3, 2, 1),
(2, 3, 2),
(3, 2, 2),
(1, 1, 3),
(3, 2, 3),
(1, 1, 4);

SELECT * FROM Soldiers;
SELECT * FROM Officers;
SELECT * FROM Weapons;
SELECT * FROM WeaponsDistribution;

-------------------------------------------------------------------------
--								Третя НФ
-------------------------------------------------------------------------

DROP TABLE WeaponsDistribution;

CREATE TABLE IF NOT EXISTS WeaponsDistribution
(
    DistributionID INT AUTO_INCREMENT NOT NULL,
    WeaponID INT NOT NULL,
    IssuedBy INT NOT NULL,
    IssuedTo INT NOT NULL,
    IssueDate DATE NOT NULL,
    PRIMARY KEY (DistributionID),
    FOREIGN KEY (WeaponID) REFERENCES Weapons (WeaponID),
    FOREIGN KEY (IssuedBy) REFERENCES Officers (OfficerID),
    FOREIGN KEY (IssuedTo) REFERENCES Soldiers (SoldierID)
);

INSERT INTO WeaponsDistribution
(WeaponID, IssuedBy, IssuedTo, IssueDate)
VALUES
(1, 1, 1, '2024-02-05'),
(3, 2, 1, '2024-01-04'),
(2, 3, 2, '2024-02-11'),
(3, 2, 2, '2024-01-14'),
(1, 1, 3, '2024-02-01'),
(3, 2, 3, '2024-02-03'),
(1, 1, 4, '2024-03-02');

SELECT * FROM WeaponsDistribution;




