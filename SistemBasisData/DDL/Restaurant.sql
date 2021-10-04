CREATE DATABASE Restaurant
use Restaurant

CREATE TABLE Pegawai (
			ID_P char(5) NOT NULL PRIMARY KEY,
			Nama_P varchar(30) NOT NULL,
			Alamat_P varchar(40) NOT NULL,
			Email_P varchar(30),
			JobDesk_P varchar(16) NOT NULL  CHECK (JobDesk_P IN ('Pemimpin','Koki','Pelayan','Kasir','Cleaning service')),
			Telepon_P varchar(13),
			Gaji_P int
)


CREATE TABLE Penjualan (
			StrukJual varchar(6) NOT NULL PRIMARY KEY,
			ID_P char(5) NOT NULL FOREIGN KEY REFERENCES Pegawai(ID_P),
			WaktuJual varchar(8) NOT NULL,
			J_HargaTotal float
)

CREATE TABLE Meja (
			No_Meja char(3) NOT NULL PRIMARY KEY,
			M_Kuota varchar(8) NOT NULL default 4,
			Lantai char(1) NOT NULL
)
DROP TABLE Meja

CREATE TABLE Meja (
			No_Meja char(3) NOT NULL PRIMARY KEY,
			M_Kuota varchar(8) NOT NULL default 4,
			Lantai char(1) NOT NULL
)
CREATE INDEX Meja1 ON Meja (No_Meja)

DROP INDEX Meja.Meja1


CREATE VIEW GajiPegawai AS 
SELECT ID_P, Nama_P, JobDesk_P, Gaji_P FROM Pegawai 
WHERE Gaji_P > 5000000

DROP VIEW GajiPegawai


ALTER TABLE Pegawai 
ADD Telepon_P varchar(13)


ALTER TABLE Pegawai
ALTER COLUMN Email_P varchar(25) NOT NULL


ALTER TABLE Pegawai
DROP COLUMN Telepon_P


DROP DATABASE Restaurant

INSERT INTO Pegawai (ID_P,Nama_P,Alamat_P,Email_P,JobDesk_P,Telepon_P,Gaji_P)
VALUES ('12345','Ara','Jl. MT.Haryono, Malang','ararala95@gmail.com','Kasir',
'0838125930142',3000000)

INSERT INTO Pegawai (ID_P,Nama_P,Alamat_P,JobDesk_P,Gaji_P)
VALUES ('54321','Indra','Jl. Sigura-gura V, Malang','Koki',5000000)

INSERT INTO Pegawai
VALUES ('11111','Resti','Jl. Sumber Sari, Malang',NULL,'Pelayan',NULL,3500000)

UPDATE Pegawai
SET Telepon_P='0838565687931' 
WHERE Telepon_P = '0838125930142'; 

DELETE FROM Pegawai
WHERE Gaji_P>3500000; 

Select* from pegawai

DELETE FROM Pegawai

CREATE TABLE Pelayan (
			ID_P char(5) NOT NULL PRIMARY KEY,
			Nama_P varchar(30) NOT NULL,
			Alamat_P varchar(40) NOT NULL,
			Email_P varchar(30),
			JobDesk_P varchar(16) NOT NULL  CHECK (JobDesk_P IN ('Pemimpin','Koki','Pelayan','Kasir','Cleaning service')),
			Telepon_P varchar(13),
			Gaji_P int
)

INSERT INTO Pelayan
SELECT * FROM  Pegawai
WHERE JobDesk_P = 'Pelayan';

SELECT * FROM Pelayan

SELECT Nama_P, Gaji_P 
FROM Pegawai
WHERE Gaji_P < 5000000

SELECT TOP 50 PERCENT *  
FROM Pegawai

INSERT INTO Pegawai (ID_P,Nama_P,Alamat_P,Email_P,JobDesk_P,Telepon_P,Gaji_P)
VALUES ('13545','Rere','Jl. Ijen, Malang','rererara@gmail.com','Pelayan',
'0838525254682',3500000)

INSERT INTO Pegawai (ID_P,Nama_P,Alamat_P,Email_P,JobDesk_P,Telepon_P,Gaji_P)
VALUES ('43256','Lala','Jl. Kerto, Malang','Lalalala@gmail.com','Kasir',
'0898453565733',3000000)

INSERT INTO Pegawai (ID_P,Nama_P,Alamat_P,Email_P,JobDesk_P,Telepon_P,Gaji_P)
VALUES ('75456','Juna','Jl. Soekarno Hatta, Malang','Juna324@gmail.com','Koki',
'0856111143565',5500000)

INSERT INTO Pegawai (ID_P,Nama_P,Alamat_P,Email_P,JobDesk_P,Telepon_P,Gaji_P)
VALUES ('23468','Rumbi','Jl. Watu Gong, Malang','Rumbiramba@gmail.com','Cleaning Service',
'0878586935945',2500000)


SELECT JobDesk_P
FROM Pegawai

SELECT DISTINCT JobDesk_P
FROM Pegawai

Select*
from pegawai

SELECT *  
FROM Pegawai 
ORDER BY Nama_P ASC

SELECT *  
FROM Pegawai 
ORDER BY Nama_P DESC

SELECT * 
FROM Pegawai
WHERE JobDesk_P LIKE '%Cleaning%';