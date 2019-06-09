use master;
drop database if exists biblioteka;
create database biblioteka;

go

use biblioteka;

go

create table czytelnicy
(
    id       char(5) not null,
    nazwisko varchar(15) not null,
    imie     varchar(15) not null,
    pesel char(11) not null,
    data_ur date not null,
    plec char not null,
    telefon varchar(15)

    constraint primary_key_id
        primary key (id),
    constraint check_id
        check (id like '[a-zA-Z][a-zA-Z][0-9][0-9][0-9]'),
    constraint check_pesel
        check (pesel like
                    '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    constraint check_plec
        check (plec = 'K' or plec = 'M')
);

go
insert into czytelnicy (id, nazwisko, imie, pesel, data_ur, plec, telefon)
    values ('aG645', 'Witczak', 'Tomasz', '98042406393', '1998-04-24', 'M', '12');

select * from czytelnicy;

create table pracownicy
(
    id,
    nazwisko,
    imie,
    data_ur,
    data_zatr
);

go

create table wypozyczenia
(
    id_w,
    sygn,
    id_cz,
    id_p,
    data_w,
    data_z,
    kara
);

go

create table wydawnictwa
(
    id,
    nazwa,
    miasto,
    telefon
);

go

create table ksiazki
(
    sygn,
    id_wyd,
    tytul,
    cena,
    strony,
    gatunek
)