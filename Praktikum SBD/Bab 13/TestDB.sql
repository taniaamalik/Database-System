CREATE DATABASE TestDB
use TestDB

CREATE TABLE Inventory (
id			INT, 
name		NVARCHAR(50), 
quantity	INT
);

INSERT INTO Inventory VALUES (1, 'banana', 150); 
INSERT INTO Inventory VALUES (2, 'orange', 154);

CREATE TABLE Mahasiswa (
NIM		varchar(15) PRIMARY KEY,
Nama	varchar(40)
)

CREATE TABLE Nilai (
NIM		varchar(15) FOREIGN KEY REFERENCES Mahasiswa(NIM),
Nilai	float
)

INSERT INTO Mahasiswa VALUES ('175150201111045', 'ERLINA ROHMAWATI')
INSERT INTO Mahasiswa VALUES ('175150201111053', 'TANIA MALIK IRYANA')
INSERT INTO Mahasiswa VALUES ('175150201111016', 'FILAN MAULA ANDINI')
INSERT INTO Mahasiswa VALUES ('175150207111029', 'JEOWANDHA RIA WIYANI')
INSERT INTO Mahasiswa VALUES ('175150207111034', 'ASRINA FITRI')
INSERT INTO Mahasiswa VALUES ('175150200111067', 'YUFITA BERLIANA')

INSERT INTO Nilai VALUES ('175150201111045', 99)
INSERT INTO Nilai VALUES ('175150201111053', 95)
INSERT INTO Nilai VALUES ('175150201111016', 94)
INSERT INTO Nilai VALUES ('175150207111029', 92)
INSERT INTO Nilai VALUES ('175150207111034', 96)
INSERT INTO Nilai VALUES ('175150200111067', 93)

SELECT m.NIM, m.Nama, n.nilai FROM Mahasiswa m
JOIN Nilai n ON m.NIM = n.NIM