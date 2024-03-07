CREATE DATABASE HRD;

USE HRD;

CREATE TABLE Employees
(
	id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR (20) NOT NULL,
    position VARCHAR (20) NOT NULL,
    birthday DATE,
    address VARCHAR (30),
    phone VARCHAR (15),
    email VARCHAR (30),
    salary INT,
    departmentID INT,
    PRIMARY KEY (id),
    FOREIGN KEY (departmentID) REFERENCES Departments(id)
);

INSERT INTO Employees
(name, position, birthday, address, phone, email, salary, departmentID)
VALUES
('Sidorov Oleh', 'Analyst', '1985-10-26', 'Kyiv, Schevchenko st. 110', +380982850295, 'oleg@example.com', 60000, 1),
('Petrova Irina', 'Manager', '1980-11-06', 'Kyiv, Petrenko st. 24', +380660295892, 'irina@example.com', 80000, 2);

CREATE TABLE Departments
(
	id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR (15),
    PRIMARY KEY (id)
);

INSERT INTO Departments
(name)
VALUES
('HR'),
('Finance'),
('IT');

SELECT * FROM Employees;
SELECT * FROM Departments;

-------------------------------------------

DROP TABLE Employees;
DROP TABLE Departments;

CREATE TABLE Employees
(
	id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR (20) NOT NULL,
    birthday DATE,
    address VARCHAR (30),
    phone VARCHAR (15),
    email VARCHAR (30),
    PRIMARY KEY (id)
);

INSERT INTO Employees
(name, birthday, address, phone, email)
VALUES
('Sidorov Oleh', '1985-10-26', 'Kyiv, Schevchenko st. 110', +380982850295, 'oleg@example.com'),
('Petrova Irina', '1980-11-06', 'Kyiv, Petrenko st. 24', +380660295892, 'irina@example.com');

CREATE TABLE Employment
(
	id INT AUTO_INCREMENT NOT NULL,
    employeeID INT,
    position VARCHAR (20) NOT NULL,
    salary INT,
    departmentID INT,
    PRIMARY KEY (id),
    FOREIGN KEY (employeeID) REFERENCES Employees(id),
    FOREIGN KEY (departmentID) REFERENCES Departments(id)
);

INSERT INTO Employment
(employeeID, position, salary, departmentID)
VALUES
(1, 'Analyst', 60000, 1),
(2, 'Manager', 80000, 2);

CREATE TABLE Departments
(
	id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR (15),
    PRIMARY KEY (id)
);

INSERT INTO Departments
(name)
VALUES
('HR'),
('Finance'),
('IT');

SELECT * FROM Employees;
SELECT * FROM Employment;
SELECT * FROM Departments;



