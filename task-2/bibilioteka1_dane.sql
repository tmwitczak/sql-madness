INSERT INTO biblioteka.dbo.czytelnicy
VALUES('TJ123','Tkaczyk','Jerzy','64101500456', '1964/10/15', 'M','0427650912');
INSERT INTO biblioteka.dbo.czytelnicy
VALUES('KM090','Krawczyk','Monika','76051900953','1976/05/19', 'K','0238651112');
INSERT INTO biblioteka.dbo.czytelnicy
VALUES('MM009','Maczyk','Marta','78070900953','1978/09/07', 'K','0427770822');
INSERT INTO biblioteka.dbo.czytelnicy
VALUES('BJ111','Balcerek','Janusz','62090200953','1962/02/09', 'M','0123310345');
INSERT INTO biblioteka.dbo.czytelnicy
VALUES('DM212','Daniec','Michał','67032000322','1967/03/20', 'M','0231510885');
GO
SELECT count(*) FROM biblioteka.dbo.czytelnicy;
GO
SELECT * FROM biblioteka.dbo.czytelnicy;
GO
INSERT INTO biblioteka.dbo.pracownicy
VALUES('Borsuk','Jan','1965/10/21','1999/06/11');
INSERT INTO biblioteka.dbo.pracownicy
VALUES('Kotecki','Adam','1968/11/21','1998/10/01');
INSERT INTO biblioteka.dbo.pracownicy
VALUES('Olek','Tadeusz','1975/10/23','2001/03/05');
INSERT INTO biblioteka.dbo.pracownicy
VALUES('Kraska','Adam','1975/06/02','2001/10/21');
INSERT INTO biblioteka.dbo.pracownicy
VALUES('Lisiak','Anna','1968/12/05','1998/01/01');
INSERT INTO biblioteka.dbo.pracownicy
VALUES('Kowalska','Ewa','1979/05/11','2001/09/05');
INSERT INTO biblioteka.dbo.pracownicy
VALUES('Nowaczyk','Maria','1963/08/14','1998/01/01');
INSERT INTO biblioteka.dbo.pracownicy
VALUES('Marczyk','Barbara','1984/03/18','2002/03/01');
INSERT INTO biblioteka.dbo.pracownicy
VALUES('Kraska','Katarzyna','1983/06/07','2002/09/15');
INSERT INTO biblioteka.dbo.pracownicy
VALUES('Michalak','Anna','1970/08/17','2001/03/04');
GO
SELECT COUNT(*) FROM biblioteka.dbo.pracownicy;
GO
SELECT * FROM biblioteka.dbo.pracownicy;
GO
INSERT INTO biblioteka.dbo.wydawnictwa
VALUES ('Wydawnictwo Naukowo-Techniczne','Warszawa','635-12-09');
INSERT INTO biblioteka.dbo.wydawnictwa
VALUES ('Helion', 'Gliwice','025-22-03');
INSERT INTO biblioteka.dbo.wydawnictwa
VALUES ('Państwowy Instytut Wydawniczy', 'Warszawa','635-42-11');
INSERT INTO biblioteka.dbo.wydawnictwa
VALUES ('Dom Książki', 'Poznań','775-24-92');
INSERT INTO biblioteka.dbo.wydawnictwa
VALUES ('Wydawnictwo Dzieciom', 'Kraków','305-32-34');
GO
SELECT COUNT(*) FROM biblioteka.dbo.wydawnictwa;
GO
SELECT * FROM biblioteka.dbo.wydawnictwa;
GO
INSERT INTO biblioteka.dbo.ksiazki
VALUES(1,1,'Fizyka dla dociekliwych',45.50,320,'książka naukowa');
INSERT INTO biblioteka.dbo.ksiazki
VALUES(2,2,'Bazy danych dla każdego',68.90, 240,'książka naukowa');
INSERT INTO biblioteka.dbo.ksiazki
VALUES(3,3,'Bajki na dobranoc',39.90, 120, 'dla dzieci');
INSERT INTO biblioteka.dbo.ksiazki
VALUES(4,3,'Potop', 62.70, 359,'powieść historyczna');
INSERT INTO biblioteka.dbo.ksiazki
VALUES(5,3,'Faraon', 55.20, 322,'powieść historyczna');
INSERT INTO biblioteka.dbo.ksiazki
VALUES(6,4,'Wojna światów',29.00, 102, 'powieść science fiction');
INSERT INTO biblioteka.dbo.ksiazki
VALUES(7,4,'Zagłada cyborgów', 21.30, 89, 'powieść science fiction');
INSERT INTO biblioteka.dbo.ksiazki
VALUES(8,5,'Na jagody', 19.20, 55, 'dla dzieci');
INSERT INTO biblioteka.dbo.ksiazki
VALUES(9,5,'Krasnoludki są na świecie', 15.90, 35, 'dla dzieci');
INSERT INTO biblioteka.dbo.ksiazki
VALUES(10,2,'SQL dla każdego', 85.90, 210, 'książka naukowa');
INSERT INTO biblioteka.dbo.ksiazki
VALUES(11,3,'Chłopi', 23.20, 384, 'powieść');
INSERT INTO biblioteka.dbo.ksiazki
VALUES(12,3,'Qvo vadis', 25.40, 245, 'powieść historyczna');
GO
SELECT COUNT(*) FROM biblioteka.dbo.ksiazki;
GO
SELECT * FROM biblioteka.dbo.ksiazki;
GO

INSERT INTO biblioteka.dbo.wypozyczenia
VALUES(1,'TJ123',4,'2008/03/01','2008/07/28', 25.50);
INSERT INTO biblioteka.dbo.wypozyczenia
VALUES(2,'KM090',2,'2008/03/04','2008/06/18',5.20);
INSERT INTO biblioteka.dbo.wypozyczenia (sygn , id_cz, id_p ,data_w, data_z)
VALUES(3,'MM009',2,'2008/03/04','2008/03/20');
INSERT INTO biblioteka.dbo.wypozyczenia (sygn , id_cz, id_p ,data_w, data_z)
VALUES(8,'MM009',1,'2008/03/20','2008/04/10');
INSERT INTO biblioteka.dbo.wypozyczenia (sygn , id_cz, id_p ,data_w, data_z)
VALUES(8,'KM090',1,'2008/04/12','2008/04/30');
INSERT INTO biblioteka.dbo.wypozyczenia (sygn , id_cz, id_p ,data_w, data_z)
VALUES(4,'BJ111',6,'2008/04/15','2008/06/12');
INSERT INTO biblioteka.dbo.wypozyczenia (sygn , id_cz, id_p ,data_w, data_z)
VALUES(5,'BJ111',6,'2008/04/15','2008/06/12');
INSERT INTO biblioteka.dbo.wypozyczenia
VALUES(12,'DM212',6,'2008/08/21','2008/12/21',12.1);
INSERT INTO biblioteka.dbo.wypozyczenia (sygn , id_cz, id_p ,data_w, data_z)
VALUES(5,'DM212',6,'2008/06/21','2008/07/29');
INSERT INTO biblioteka.dbo.wypozyczenia (sygn , id_cz, id_p ,data_w, data_z)
VALUES(10,'DM212',6,'2008/06/21','2008/08/08');
INSERT INTO biblioteka.dbo.wypozyczenia
VALUES(10,'TJ123',7,'2008/08/21','2008/11/09',8.80);
INSERT INTO biblioteka.dbo.wypozyczenia
VALUES(4,'MM009',7,'2008/08/22','2008/12/18',7.5);
INSERT INTO biblioteka.dbo.wypozyczenia (sygn , id_cz, id_p ,data_w, data_z)
VALUES(2,'DM212',8,'2008/11/16','2009/01/19');
INSERT INTO biblioteka.dbo.wypozyczenia (sygn , id_cz, id_p ,data_w, data_z)
VALUES(2,'DM212',8,'2008/11/17', NULL);
INSERT INTO biblioteka.dbo.wypozyczenia (sygn , id_cz, id_p ,data_w, data_z)
VALUES(11,'KM090',9,'2008/11/21', NULL);
GO
SELECT COUNT(*) FROM biblioteka.dbo.wypozyczenia;
GO
SELECT * FROM biblioteka.dbo.wypozyczenia;
GO
