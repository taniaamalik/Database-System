CREATE DATABASE mydatabase
use mydatabase

CREATE TABLE mahasiswa(
nim int,
nama varchar(500),
angkatan varchar(5)
)

SELECT * FROM mahasiswa;

insert into mahasiswa values(5,'tania',2017)
insert into mahasiswa values(6,'asa',2016)
insert into mahasiswa values(7,'difa',2016)

select nim, nama, angkatan from mahasiswa where angkatan = 2016

DROP TABLE mahasiswa;