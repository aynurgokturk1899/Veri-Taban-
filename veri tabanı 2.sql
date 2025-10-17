CREATE TABLE fakulte (
    fakulte_id SERIAL PRIMARY KEY,      
    ad VARCHAR(100) NOT NULL,           
    kod VARCHAR(10) UNIQUE NOT NULL,    
    kurulus_yili INT CHECK (kurulus_yili >= 1900),  
    dekan VARCHAR(100)                 
);

CREATE TABLE bolum (
    bolum_id SERIAL PRIMARY KEY,
    ad VARCHAR(100) NOT NULL,
    kod VARCHAR(10) UNIQUE NOT NULL,
    fakulte_id INT NOT NULL REFERENCES fakulte(fakulte_id),
    ogretim_turu VARCHAR(20) CHECK (ogretim_turu IN ('1. Öğretim', '2. Öğretim'))
);

CREATE TABLE ogrenci (
    ogrenci_id SERIAL PRIMARY KEY,
    ad VARCHAR(50) NOT NULL,
    soyad VARCHAR(50) NOT NULL,
    tc_no CHAR(11) UNIQUE CHECK (LENGTH(tc_no) = 11),
    yas INT CHECK (yas BETWEEN 17 AND 100),
    bolum_id INT NOT NULL REFERENCES bolum(bolum_id),
    kayit_tarihi DATE DEFAULT CURRENT_DATE,
    cinsiyet CHAR(1) CHECK (cinsiyet IN ('E', 'K'))
);

INSERT INTO fakulte (fakulte_id, ad, kod, kurulus_yili, dekan)
VALUES
(1,'Mühendislik Fakültesi', 'MF', 1995, 'Prof. Dr. Mehmet Kaya'),
(2,'Sağlık Bilimleri Fakültesi', 'SF', 2000, 'Prof. Dr. Ayşe Demir');

INSERT INTO fakulte (fakulte_id, ad, kod, kurulus_yili, dekan)
VALUES
(3,'Tıp Fakültesi', 'TF', 1995, 'Prof. Dr. Ahmet Kaya'),
(4,'Yabancı Dil Fakültesi', 'YDF', 2000, 'Prof. Dr. Ayşe Bulut');

INSERT INTO bolum (bolum_id, ad, kod, fakulte_id, ogretim_turu)
VALUES
(1,'Yazılım Mühendisliği', 'YM', 1, '1. Öğretim'),
(2,'Bilgisayar Mühendisliği', 'BM', 1, '2. Öğretim'),
(3,'Hemşirelik', 'HEM', 2, '1. Öğretim');

INSERT INTO bolum (bolum_id, ad, kod, fakulte_id, ogretim_turu)
VALUES
(4,'Tıp', 'T', 3, '1. Öğretim'),
(5,'İngilizce Öğretmenliği', 'İÖ', 4, '2. Öğretim'),
(6,'Kore Dili Eedebiyatı', 'KDE', 4, '1. Öğretim');

delete  from bolum where ad='Kore Dili Eedebiyatı'

select * from bolum

INSERT INTO ogrenci (ogrenci_id, ad, soyad, tc_no, yas, bolum_id, kayit_tarihi, cinsiyet)
VALUES
(1,'Aynur', 'Göktürk', '12345678901', 21, 1, Default, 'K'),
(2,'Ahmet', 'Kara', '12345678902', 22, 2,Default, 'E'),
(3,'Zeynep', 'Demir', '12345678903', 20, 3, Default, 'K');

INSERT INTO ogrenci (ogrenci_id, ad, soyad, tc_no, yas, bolum_id, kayit_tarihi, cinsiyet)
VALUES
(4,'Ahsen', 'Aydemir', '12343678901', 21, 1,'2023-09-28', 'K'),
(5,'Mizgin', 'Alp', '12345678102', 22, 2,'2020-10-20', 'K'),
(6,'Sakine', 'Alpay', '12345678923', 20, 3, '2019-05-21', 'K');

INSERT INTO ogrenci (ogrenci_id, ad, soyad, tc_no, yas, bolum_id, kayit_tarihi, cinsiyet)
VALUES
(7,'Zeynep', 'Aydemir', '12343678601', 21, 4,'2023-09-28', 'K'),
(8,'Meryem', 'Alp', '12345678103', 22, 3,'2020-10-20', 'K'),
(9,'Medine', 'Göktürk', '12345671923', 20, 3, '2019-05-21', 'K');

INSERT INTO ogrenci (ogrenci_id, ad, soyad, tc_no, yas, bolum_id, kayit_tarihi, cinsiyet)
VALUES
(10,'Mehmet', 'Aydemir', '12341678601', 18, 4,'2023-09-28', 'E'),
(11,'Alp', 'Alp', '13345678103', 28, 2,'2020-10-20', 'E'),
(12,'Zeki', 'Göktürk', '12445671923', 26, 1, '2019-05-21', 'E');


select * from ogrenci order by ogrenci_id

update ogrenci set yas=25 where ad='Medine'

alter table ogrenci rename column yas to age

alter table ogrenci add column dogum_tarihi date 

CREATE TABLE universite (
    uni_id SERIAL PRIMARY KEY,
    ad VARCHAR(100),
    sehir VARCHAR(50)
);

ALTER TABLE universite
ADD COLUMN sehir_id INT REFERENCES sehir(sehir_id);

select * from universite

alter table universite drop column sehir

delete from universite
insert into universite(uni_id,ad,sehir_id)
 values (1,'İnönü',5),
 (2,'Hacettepe',1),
 (3,'Ege',2),
 (4,'Artuklu',6),
 (5,'Bilkent',3),
 (6,'RTE',4);


CREATE TABLE sehir (
    sehir_id SERIAL PRIMARY KEY,
    ad VARCHAR(50) UNIQUE NOT NULL
);

INSERT INTO sehir (sehir_id,ad) VALUES
(1,'Ankara'),
(2,'İzmir'),
(3,'İstanbul'),
(4,'Trabzon'),
(5,'Malatya'),
(6,'Mardin')
;

select universite.uni_id, universite.ad, sehir.ad 
from universite 
inner join sehir 
on universite.sehir_id=sehir.sehir_id

