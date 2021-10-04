CREATE DATABASE mydatabase2
use mydatabase2

create table Sekolah(
	IdSekolah	int NOT NULL PRIMARY KEY,
	NoSekolah	int,
	Kelas		varchar (50)
);

INSERT INTO Sekolah VALUES(12345,123,'I,II,III,IV,V,VI')
INSERT INTO Sekolah VALUES(23456,234,'VII,VIII,IX')
INSERT INTO Sekolah VALUES(34567,345,'X IPA, XI IPA, XII IPA')
INSERT INTO Sekolah VALUES(34568,346,'X IPS, XI IPS, XII IPS')
INSERT INTO Sekolah VALUES(34566,347,'X BAHASA, XI BAHASA, XII BAHASA')
INSERT INTO Sekolah VALUES(34561,346,'X BAHASA, XI BAHASA, XII BAHASA')


SELECT Kelas FROM Sekolah WHERE IdSekolah = 12345

UPDATE Sekolah 
SET Kelas = 'X BHS, XI BHS, XII BHS' 
WHERE Kelas = 'X BAHASA, XI BAHASA, XII BAHASA'; 

DELETE FROM Sekolah
WHERE IdSekolah = 34561

create table Teacher(
	ID			varchar(5) NOT NULL PRIMARY KEY, 
	name			varchar(20) NOT NULL, 
	course		varchar(20), 
	salary			numeric(8,2) check (salary > 29000),
	IdSekolah	int NOT NULL foreign key (IdSekolah) references Sekolah
);

INSERT INTO Teacher VALUES(9876,'Tono','Matematika',70000,34567)
INSERT INTO Teacher VALUES(5432,'Rana','Ipa',65000,12345)
INSERT INTO Teacher VALUES(2679,'Alex','Inggris',75000,34566)
INSERT INTO Teacher VALUES(9638,'Siti','Agama Islam',85000,23456)
INSERT INTO Teacher VALUES(5205,'Rolan','IPS',55000,34568)

SELECT * 
FROM Sekolah left outer join Teacher
ON Sekolah.IdSekolah=Teacher.IdSekolah

SELECT * 
FROM Sekolah right outer join Teacher
ON Sekolah.IdSekolah=Teacher.IdSekolah

SELECT * 
FROM Sekolah full outer join Teacher
ON Sekolah.IdSekolah=Teacher.IdSekolah

SELECT name, course, salary
FROM teacher
WHERE salary > ALL (SELECT salary 
					FROM teacher
					WHERE course = 'Inggris');