-- /////////////////////////////////////////////////////////////////// Task 1 --
-- Author: Tomasz Witczak, 216920


-- /////////////////////////////////////// Create database: test1_witczak <   --
use master;
drop database if exists test1_witczak;
create database test1_witczak;

go


-- /////////////////////////////////////// Select database: test1_witczak <   --
use test1_witczak;

go


-- ////////////////////////////////////////////// Create schema: zadanie1 <   --
create schema zadanie1;

go


-- ///////////////////////////////////////// Create table: zadanie1.osoby <   --
create table zadanie1.osoby
(
    -- ---------------------------------------------------------- Data <<     --
    nr_osoby int       not null identity(1, 1),
    imie     char(40)  not null,
    nazwisko char(40)  not null,
    adres    char(500) not null,
    wiek     int       not null,

    -- --------------------------------------------------- Constraints <<     --
    constraint primary_key_osoby
        primary key (nr_osoby)
);

go


-- //////////////////// Verify number of records in table: zadanie1.osoby <   --
select count(*)
    as 'Ilość rekordów w tabeli: zadanie1.osoby'
    from zadanie1.osoby;

go


-- /////////////////////////////// Insert data into table: zadanie1.osoby <   --
insert into zadanie1.osoby (imie, nazwisko, adres, wiek)
    values ('Baba', 'Jaga', 'Domek z Piernika 100', 154);

go


-- ///////////////////////////////// Show data from table: zadanie1.osoby <   --
select nr_osoby as 'Numer osoby',
       imie     as 'Imię',
       nazwisko as 'Nazwisko',
       adres    as 'Adres',
       wiek     as 'Wiek'
    from zadanie1.osoby;

go


-- //////////////////// Verify number of records in table: zadanie1.osoby <   --
select count(*) as 'Ilość rekordów w tabeli: zadanie1.osoby'
    from zadanie1.osoby;

go


-- //////////////////////////////////////// Create table: zadanie1.dzieci <   --
create table zadanie1.dzieci
(
    -- ---------------------------------------------------------- Data <<     --
    nr_dziecka int         not null identity(100, 1),
    nr_osoby   int         not null,
    imie       varchar(40) not null

    -- --------------------------------------------------- Constraints <<     --
    constraint primary_key_dzieci
        primary key (nr_dziecka),

    constraint foreign_key_dzieci_osoby
        foreign key (nr_osoby)
            references zadanie1.osoby (nr_osoby)
);

go


-- ////////////////////////////// Insert data into table: zadanie1.dzieci <   --
insert into zadanie1.dzieci (nr_osoby, imie)
    values (1, 'Jaś'),
           (1, 'Małgosia');

go


-- //////////////////////////////// Show data from table: zadanie1.dzieci <   --
select nr_dziecka as 'Numer dziecka',
       nr_osoby   as 'Number osoby',
       imie       as 'Imię'
    from zadanie1.dzieci;

go


-- ////////////////////////////////// Add column to table: zadanie1.osoby <   --
alter table zadanie1.osoby with nocheck
    add data_wpisu datetime
            constraint default_data_wpisu
                default getdate();

go


-- /////////////////////////////// Insert data into table: zadanie1.osoby <   --
insert into zadanie1.osoby (imie, nazwisko, adres, wiek)
    values ('Matka', 'Chrzestna', 'Wróżkolandia', 105);

go


-- ///////////////////////////////// Show data from table: zadanie1.osoby <   --
select nr_osoby   as 'Numer osoby',
       imie       as 'Imię',
       nazwisko   as 'Nazwisko',
       adres      as 'Adres',
       wiek       as 'Wiek',
       data_wpisu as 'Data wpisu'
    from zadanie1.osoby;

go


-- ////////////////////////////// Insert data into table: zadanie1.dzieci <   --
set identity_insert zadanie1.dzieci on;

insert into zadanie1.dzieci (nr_dziecka, nr_osoby, imie)
    values (10, 2, 'Kopciuszek');

set identity_insert zadanie1.dzieci off;

go


-- //////////////////////////////// Show data from table: zadanie1.dzieci <   --
select nr_dziecka as 'Numer dziecka',
       nr_osoby   as 'Number osoby',
       imie       as 'Imię'
    from zadanie1.dzieci;

go


-- ////////////////////////////// Add constraint to table: zadanie1.osoby <   --
alter table zadanie1.osoby with nocheck
    add constraint check_wiek
            check (wiek <= 100);

go


-- /////////////////////////////// Insert data into table: zadanie1.osoby <   --
insert into zadanie1.osoby (imie, nazwisko, adres, wiek)
    values ('Baba', 'Jaga', 'Domek z Piernika 100', 154),
           ('Matka', 'Chrzestna', 'Wróżkolandia', 105);

go


-- ////////////////////////////////////////////////////////////////////////// --
