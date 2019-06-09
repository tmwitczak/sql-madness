-- /////////////////////////////////////////////////////////////////// Task 2 --
-- Author: Tomasz Witczak, 216920


-- ////////////////////////////////////////// Create database: biblioteka <   --
use master;
drop database if exists biblioteka;
create database biblioteka;

go


-- /////////////////////////////////////// Select database: test1_witczak <   --
use biblioteka;

go

-- ///////////////////////////////////////////// Create table: czytelnicy <   --
create table czytelnicy
(
    -- ---------------------------------------------------------- Data <<     --
    id       char(5)     not null,
    nazwisko varchar(15) not null,
    imie     varchar(15) not null,
    pesel    char(11)    not null,
    data_ur  date        not null,
    plec     char(1)     not null,
    telefon  varchar(15)

    -- --------------------------------------------------- Constraints <<     --
    constraint primary_key_czytelnicy_id
        primary key (id),

    constraint check_czytelnicy_id
        check (id like
		          '[a-zA-Z][a-zA-Z][0-9][0-9][0-9]'),

    constraint check_czytelnicy_pesel
        check (pesel like
                    '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),

    constraint check_czytelnicy_plec
        check (plec = 'K'
            or plec = 'M')
);

go

create table pracownicy
(
    id        int         not null identity(1, 1),
    nazwisko  varchar(15) not null,
    imie      varchar(15) not null,
    data_ur   date        not null,
    data_zatr date 	      not null,

    constraint primary_key_pracownicy_id
	    primary key (id),

    constraint check_pracownicy_data_ur_data_zatrz
    	check (data_ur < data_zatr)
);

go

create table wydawnictwa
(
    id int not null identity(1, 1),
    nazwa varchar(50) not null,
    miasto varchar(50) not null,
    telefon varchar(15),

    constraint primary_key_wydawnictwa_id
        primary key (id)
);

go


create table ksiazki
(
    sygn char(5) not null,
    id_wyd int not null,
    tytul varchar(50) not null,
    cena money not null,
    strony int not null,
    gatunek varchar(25) not null

    constraint primary_key_ksiazki_sygn
	    primary key (sygn),

    constraint foreign_key_ksiazki_id_wyd
    	foreign key (id_wyd)
    	    references wydawnictwa (id),

    constraint check_ksiazki_gatunek
        check (gatunek in ('powieść',
                           'powieść historyczna',
                           'dla dzieci',
                           'wiersze',
                           'kryminał',
                           'powieść science fiction',
                           'książka naukowa')),

    constraint check_ksiazki_cena
        check (cena > 0)
);

go

create table wypozyczenia
(
    id_w   int     not null identity(1, 1),
    sygn   char(5) not null,
    id_cz  char(5) not null,
    id_p   int     not null,
    data_w date    not null,
    data_z date,
    kara   money
           constraint default_wypozyczenia_kara
                default 0,

    constraint primary_key_wypozyczenia_id_w
        primary key (id_w),

    constraint foreign_key_wypozyczenia_id_cz
        foreign key (id_cz)
            references czytelnicy (id),

    constraint foreign_key_wypozyczenia_id_p
        foreign key (id_p)
            references pracownicy (id),

    constraint foreign_key_wypozyczenia_sygn
        foreign key (sygn)
            references ksiazki (sygn),

    constraint check_wypozyczenia_data_w_data_z
        check (data_w < data_z),

    constraint check_wypozyczenia_kara
        check (kara >= 0),

    
);

go


alter table pracownicy with nocheck
    add plec char(1);
go

alter table pracownicy with nocheck
    add constraint check_pracownicy_plec
            check (plec = 'K'
                or plec = 'M');
go

alter table czytelnicy with check
    add constraint unique_czytelnicy_pesel
            unique (pesel);
go

alter table wypozyczenia with check
    add constraint unique_wypozyczenia_sygn_data_w
            unique (sygn, data_w);
go


select czytelnicy.nazwisko + ' ' + czytelnicy.imie as 'czytelnik',
       ksiazki.tytul,
       wypozyczenia.data_w,
       wypozyczenia.data_z
    into #wypoz_lato
    from wypozyczenia
        inner join czytelnicy
            on wypozyczenia.id_cz = czytelnicy.id
        inner join ksiazki
            on wypozyczenia.sygn = ksiazki.sygn
    where month(wypozyczenia.data_w) in (6, 7, 8)
go

select czytelnik as 'Nazwisko i imię czytelnika',
       tytul     as 'Tytuł książki',
       data_w    as 'Data wypożyczenia',
       data_z    as 'Data zwrotu'
    from #wypoz_lato
    order by #wypoz_lato.data_w asc;