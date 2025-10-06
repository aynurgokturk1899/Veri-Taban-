

--select sehir,count(*) as kisi from musteri group by sehir order by sehir

--select sehir,sum(bakiye),count(*) from musteri group by sehir order by sehir

--select * from musteri

--select sehir,count(*) from musteri group by sehir having count(*)>1order by sehir

--select avg(bakiye) as ortalama,sehir from musteri group by sehir having avg(bakiye)>5000 order by sehir

--select * from musteri order by id

--select max(bakiye) from musteri group by sehir order by max(bakiye)

--select * from musteri where bakiye=(select max(bakiye) from musteri)

--select * from musteri where bakiye=(select max(bakiye) from musteri where sehir='ankara')