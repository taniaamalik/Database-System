CREATE DATABASE UAP
USE UAP

CREATE TABLE dokter_053 (
	id_dokter int NOT NULL PRIMARY KEY,
	nama_dokter varchar(50) NOT NULL,
	spesialisasi varchar(50) NOT NULL
)

CREATE TABLE pasien_053 (
	id_pasien int NOT NULL PRIMARY KEY,
	nama_pasien varchar(50) NOT NULL,
	jenis_kelamin varchar(10) NOT NULL,
	penyakit varchar(50) NOT NULL,
	id_dokter int FOREIGN KEY REFERENCES dokter_053(id_dokter)
)

CREATE TABLE ruang_053 (
	no_ruang int NOT NULL PRIMARY KEY,
	nama_ruang varchar(50) NOT NULL,
	kelas varchar(50) NOT NULL,
	harga int NOT NULL
)

CREATE TABLE petugas_053 (
	id_petugas int NOT NULL PRIMARY KEY,
	nama_petugas varchar(50) NOT NULL
)

CREATE TABLE pembayaran_053 (
	id_pembayaran int NOT NULL PRIMARY KEY,
	no_ruang int FOREIGN KEY REFERENCES ruang_053(no_ruang),
	id_pasien int FOREIGN KEY REFERENCES pasien_053(id_pasien),
	id_petugas int FOREIGN KEY REFERENCES petugas_053(id_petugas)
)

INSERT INTO dokter_053 VALUES(1111,'Cahyo','Penyakit dalam')
INSERT INTO dokter_053 VALUES(1112,'Juni','Kesehata gigi dan mulut')
INSERT INTO dokter_053 VALUES(1113,'Robi','THT')
INSERT INTO dokter_053 VALUES(1114,'Difa','Kulit')

INSERT INTO pasien_053 VALUES(111,'Aang','L','Herpes',1114)
INSERT INTO pasien_053 VALUES(112,'Asa','P','Radang Gusi',1112)
INSERT INTO pasien_053 VALUES(113,'Delarta','L','Sinusitis',1113)
INSERT INTO pasien_053 VALUES(114,'Desy','P','Hipertensi',1111)
INSERT INTO pasien_053 VALUES(115,'Nabila','P','Alergi Kulit',1114)
INSERT INTO pasien_053 VALUES(116,'Sigit','L','Gigi sensitive',1112)

INSERT INTO petugas_053 VALUES(2111,'Rizky')
INSERT INTO petugas_053 VALUES(2112,'Arda')

INSERT INTO ruang_053 VALUES(211,'Mawar','A',250000)
INSERT INTO ruang_053 VALUES(212,'Lili','B',200000)
INSERT INTO ruang_053 VALUES(213,'Melati','C',150000)
INSERT INTO ruang_053 VALUES(214,'Kamboja','D',100000)

INSERT INTO pembayaran_053 VALUES(001,214,111,2111)
INSERT INTO pembayaran_053 VALUES(002,212,112,2112)
INSERT INTO pembayaran_053 VALUES(003,213,113,2111)
INSERT INTO pembayaran_053 VALUES(004,211,114,2112)
INSERT INTO pembayaran_053 VALUES(005,214,115,2111)
INSERT INTO pembayaran_053 VALUES(006,212,116,2112)

SELECT p.id_pasien, p.nama_pasien, p.jenis_kelamin, p.penyakit, p.id_dokter FROM pasien_053 p WHERE nama_pasien LIKE '%a%'
INTERSECT
SELECT p.id_pasien, p.nama_pasien, p.jenis_kelamin, p.penyakit, p.id_dokter FROM pasien_053 p WHERE jenis_kelamin = 'P'
EXCEPT
SELECT p.id_pasien, p.nama_pasien, p.jenis_kelamin, p.penyakit, p.id_dokter FROM pasien_053 p 
JOIN pembayaran_053 b ON p.id_pasien = b.id_pasien
WHERE b.id_petugas = (SELECT id_petugas FROM petugas_053 WHERE nama_petugas = 'Arda')

SELECT nama_dokter FROM dokter_053
JOIN pasien_053 ON pasien_053.id_dokter = dokter_053.id_dokter
JOIN pembayaran_053 ON pasien_053.id_pasien = pembayaran_053.id_pasien
WHERE pembayaran_053.no_ruang = (SELECT no_ruang FROM ruang_053 WHERE kelas = 'A' AND kelas = 'B')

BEGIN TRANSACTION 
UPDATE pasien_053 SET id_pasien = (SELECT id_pasien FROM pasien_053
JOIN pembayaran_053 ON pasien_053.id_pasien = pembayaran_053.id_pasien
WHERE pembayaran_053.no_ruang = (SELECT no_ruang, MAX(harga) FROM ruang_053))


CREATE PROCEDURE getData
AS
SELECT DISTINCT d.nama_dokter, d.id_dokter, (SELECT COUNT(*) FROM pasien_053 p WHERE p.jenis_kelamin = 'P')  AS jumlah_pasien_perempuan, (SELECT COUNT(*) FROM pasien_053 p WHERE p.jenis_kelamin = 'L')  AS jumlah_pasien_lakilaki
FROM dokter_053 d
JOIN pasien_053 p ON d.id_dokter = p.id_dokter
ORDER BY d.nama_dokter asc, jumlah_pasien_perempuan desc, jumlah_pasien_lakilaki desc
GO
EXEC getData