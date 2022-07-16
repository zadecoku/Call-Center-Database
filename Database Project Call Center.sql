CREATE DATABASE ZADECOKU;
USE ZADECOKU;

ALTER DATABASE SCOPED CONFIGURATION 
  SET VERBOSE_TRUNCATION_WARNINGS = ON;

CREATE TABLE DEPARTAMENT (
DEPARTAMENT_ID INT PRIMARY KEY NOT NULL,
EMRI VARCHAR (30) NOT NULL,
NR_PUNONJES INT NOT NULL
);

Alter table DEPARTAMENT
ADD SH_DEP INT ;

Alter table DEPARTAMENT 
add FOREIGN KEY (SH_DEP) references PUNONJES (PUNONJES_ID);

INSERT INTO DEPARTAMENT (
    DEPARTAMENT_ID,
	EMRI,
    NR_PUNONJES,
	SH_DEP
)
VALUES
    (
        001, 'DEP. FINANCES', 2, NULL
    ),
    (
        002, 'DEP. MARKETINGUT', 2, NULL
    ),
    (
        003, 'DEP. BURIMEVE NJEREZORE', 2, NULL
    ),
	(
	    004, 'DEP. LOGJISTIKES', 2, NULL
	),
	(
        005, 'DEP. IT', 2, NULL
    );

UPDATE DEPARTAMENT
SET SH_DEP=01
WHERE DEPARTAMENT_ID=001;

UPDATE DEPARTAMENT
SET SH_DEP=03
WHERE DEPARTAMENT_ID=002;

UPDATE DEPARTAMENT
SET SH_DEP=05
WHERE DEPARTAMENT_ID=003;

UPDATE DEPARTAMENT
SET SH_DEP=07
WHERE DEPARTAMENT_ID=004;

UPDATE DEPARTAMENT
SET SH_DEP=09
WHERE DEPARTAMENT_ID=005;

CREATE TABLE PUNONJES (
PUNONJES_ID INT PRIMARY KEY NOT NULL,
DEPARTAMENT_ID INT FOREIGN KEY REFERENCES DEPARTAMENT (DEPARTAMENT_ID) NOT NULL,
EMER VARCHAR (20) NOT NULL,
NR_LLOGARISE INT,
PAGA INT,
ADRESA VARCHAR (40),
SH_DEP_ID INT FOREIGN KEY REFERENCES PUNONJES (PUNONJES_ID)
);

INSERT INTO PUNONJES (
    PUNONJES_ID,
	DEPARTAMENT_ID,
	EMER,
    NR_LLOGARISE,
	PAGA,
	ADRESA,
	SH_DEP_ID
)
VALUES
    (
        01, 001, 'Riversa Enesi', 012, 500, 'Tirane', NULL
    ),
	(
        02, 001, 'Erta Enesi', 123, 400, 'Tirane', NULL
    ),
    (
        03, 002, 'Tea Yzeiraj', 234, 700, 'Fier', NULL
    ),
	(
        04, 002, 'Era Yzeiraj', 345, 600, 'Tirane', NULL
    ),
    (
        05, 003, 'Xheni Cikalleshi', 456, 400, 'Kavaje', NULL
    ),
    (
        06, 003, 'Eno Cikalleshi', 567, 300, 'Kavaje', NULL
    ),
	(
	    07, 004, 'Ildo Nelollari', 678, 900, 'Tirane', NULL
	),
	(
	    08, 004, 'Aida Nelollari', 789, 800, 'Tirane', NULL
	),
	(
	    09, 005, 'Zade Coku', 890, 1500, 'Tirane', NULL
	),
	(
        10, 005, 'Nada Coku', 901, 1200, 'Divjake', NULL
    );

UPDATE PUNONJES
SET SH_DEP_ID=01
WHERE PUNONJES_ID=02;

UPDATE PUNONJES
SET SH_DEP_ID=03
WHERE PUNONJES_ID=04;

UPDATE PUNONJES
SET SH_DEP_ID=05
WHERE PUNONJES_ID=06;

UPDATE PUNONJES
SET SH_DEP_ID=07
WHERE PUNONJES_ID=08;

UPDATE PUNONJES
SET SH_DEP_ID=09
WHERE PUNONJES_ID=10;

CREATE TABLE KLIENT (
KLIENT_ID INT PRIMARY KEY NOT NULL,
EMER VARCHAR (30),
MOSHA INT,
ZIP INT,
ADRESA VARCHAR(20)
);


INSERT INTO KLIENT (
    KLIENT_ID,
	EMER,
    MOSHA,
	ZIP,
	ADRESA
)
VALUES
    (
        0001, 'Alba Alba', 20, 111, 'Shkoder'
    ),
    (
        0002, 'Ana Ana', 25, 222, 'Lac'
    ),
    (
        0003, 'Gledis Gledis', 28, 333, 'Pogradec'
    ),
	(
	    0004, 'Joni Joni', 30, 444, 'Vlore'
	),
	(
        0005, 'Klara Klara', 19, 555, 'Durres'
    );

CREATE TABLE TELEFONATA (
TELEFONATA_ID INT PRIMARY KEY NOT NULL,
KLIENT_ID INT FOREIGN KEY REFERENCES KLIENT(KLIENT_ID) NOT NULL,
PUNONJES_ID INT FOREIGN KEY REFERENCES PUNONJES (PUNONJES_ID) NOT NULL,
TEL_NR INT NOT NULL
);


INSERT INTO TELEFONATA (
    TELEFONATA_ID,
	KLIENT_ID,
    PUNONJES_ID,
	TEL_NR
)
VALUES
    (
        212, 0001, 02, 0681111111
    ),
    (
        232, 0002, 04, 0682222222
    ),
    (
        242, 0003, 06, 0683333333
    ),
	(
	    252, 0004, 08, 0684444444
	),
	(
        262, 0005, 10, 0685555555
    );

CREATE TABLE CALL_LOG (
LOG_ID INT PRIMARY KEY NOT NULL,
TELEFONATA_ID INT FOREIGN KEY REFERENCES TELEFONATA(TELEFONATA_ID) NOT NULL,
DATAA VARCHAR (10) NOT NULL,
ORA VARCHAR (10) NOT NULL
);


INSERT INTO CALL_LOG (
    LOG_ID,
	TELEFONATA_ID,
    DATAA,
	ORA
)
VALUES
    (
        313, 212, '17/10/2021', '13:00:13'
    ),
    (
        323, 232, '13/12/2021', '15:20:21'
    ),
    (
        343, 242, '29/12/2021', '13:00:13'
    ),
	(
	    353, 252, '05/01/2022', '10:00:10'
	),
	(
        363, 262, '19/02/2022', '19:30:39'
    );

CREATE TABLE PROBLEME (
PROBLEME_ID INT PRIMARY KEY NOT NULL,
KLIENT_ID INT FOREIGN KEY REFERENCES KLIENT (KLIENT_ID) NOT NULL,
TIPI_PROBLEMIT VARCHAR (100) NOT NULL
);


INSERT INTO PROBLEME (
	PROBLEME_ID,
	KLIENT_ID,
	TIPI_PROBLEMIT
)
VALUES
    (
        121, 0001, 'AAA'
    ),
    (
        131, 0002, 'BBB'
	),
    (
        141, 0003, 'CCC'
    ),
	(
	    151, 0004, 'DDD'
	),
	(
        161, 0005, 'EEE'
    );

CREATE TABLE KA (
KLIENT_ID INT NOT NULL,
PROBLEME_ID INT NOT NULL,
FOREIGN KEY (KLIENT_ID) REFERENCES KLIENT(KLIENT_ID),
FOREIGN KEY (PROBLEME_ID) REFERENCES PROBLEME (PROBLEME_ID),
PRIMARY KEY (KLIENT_ID, PROBLEME_ID)
);


INSERT INTO KA (
    KLIENT_ID,
	PROBLEME_ID
)
VALUES
    (
        0001, 121
    ),
    (
        0002, 131
    ),
    (
        0003, 141
    ),
	(
	    0004, 151
	),
	(
        0005, 161
    );


SELECT * 
FROM PUNONJES;

SELECT *
FROM DEPARTAMENT;

SELECT *
FROM KLIENT;

SELECT *
FROM CALL_LOG;

SELECT *
FROM PROBLEME;

SELECT *
FROM TELEFONATA;

--________________________________________________________________________________

--1. Numero te gjithe punonjesit ne te gjithe departamentet.
SELECT COUNT(PUNONJES_ID) AS NUMER_PUNONJES, DEPARTAMENT_ID
FROM PUNONJES
GROUP BY DEPARTAMENT_ID;

--2. Update Punonjesin me ID=100 me nje numer te ri llogarie dhe nje rritje page prej 50 euro.
UPDATE PUNONJES
SET NR_LLOGARISE=112, Paga=550
WHERE PUNONJES_ID=01;

--3. Afisho Gjatesite e emrave te punonjesve.
SELECT 
    EMER,
    LEN (EMER) AS Gjatesi
FROM
    PUNONJES
ORDER BY Gjatesi DESC;

--4. Afisho emrat e punonjesve, emrin e departamentit perkates dhe pagen per cdo punonjes ne rendin zbrites.
SELECT PUNONJES.EMER, PUNONJES.Paga, DEPARTAMENT.EMRI
FROM PUNONJES inner join DEPARTAMENT On
DEPARTAMENT.DEPARTAMENT_ID=PUNONJES.DEPARTAMENT_ID
ORDER BY PAGA DESC;

--5. Afisho per cdo klient Emrin, Nr.Tel dhe Oren kur kane kryer telefonatat per daten 13/12/2021
SELECT KLIENT.EMER, TELEFONATA.TEL_NR, Call_Log.Ora
FROM KLIENT 
inner join TELEFONATA On TELEFONATA.KLIENT_ID=KLIENT.KLIENT_ID
inner join Call_Log On Call_Log.TELEFONATA_ID=TELEFONATA.TELEFONATA_ID
Where Call_Log.DATAA='13/12/2021';

--________________________________________________________________________________

----------------------------------------------------------------------------------

--a) Afisho punonjesit qe punojne ne departamentin e burimeve njerezore

CREATE View PunonjesDep as ( SELECT PUNONJES.EMER
FROM  Punonjes inner join DEPARTAMENT
ON PUNONJES.DEPARTAMENT_ID = DEPARTAMENT.DEPARTAMENT_ID
WHERE DEPARTAMENT.EMRI='DEP. BURIMEVE NJEREZORE');

SELECT * from PunonjesDep;


--b) Index Filter

CREATE INDEX PUNONJES ON PUNONJES
(PUNONJES_ID ASC);

sp_helpindex 'PUNONJES';

DROP INDEX PUNONJES
ON PUNONJES;

--c) trigger instead of qe ndalon Shtimin e te dhenave ne Tab PROBLEME
CREATE TRIGGER TrigInsteadOf
On TELEFONATA
INSTEAD OF INSERT
As
BEGIN
PRINT 'ERROR!';
End

INSERT INTO TELEFONATA(TELEFONATA_ID, KLIENT_ID, PUNONJES_ID, TEL_NR)
VALUES
    (
        292, 0009, 09, 0681111999
    );

select * from TELEFONATA;




--c) trigger after qe shton nje rresht ne nje tabele te re sa here shtohet nje klient i ri ne tabelen klient
CREATE TABLE TRIGERAFTER(VLERA VARCHAR(100));

Create TRIGGER Triger
On KLIENT FOR INSERT
AS
BEGIN
DECLARE @ID INT
SELECT @ID = KLIENT_ID FROM inserted INSERT INTO TRIGERAFTER
VALUES ('KLIENT I RI ME ID = ' + CAST(@ID AS varchar(10)) + ' U SHTUA NE '+ CAST(GETDATE() AS varchar(50)));
END

INSERT INTO KLIENT
VALUES (
        0009, 'AlbaNA AlbaNA', 28, 667, 'Tirane'
       );

DELETE FROM KLIENT WHERE EMER='AlbaNA AlbaNA';
SELECT * from KLIENT;
SELECT * FROM TRIGERAFTER;


--d) Funksion qe merr si parameter nje klient dhe kthen tipin e problemit qe kane hasur.
create function PikaD (@klient varchar(30))
returns varchar(100)
begin
declare @problemi as varchar(100)
select @problemi = PROBLEME.TIPI_PROBLEMIT
from KLIENT inner join PROBLEME on
KLIENT.KLIENT_ID = PROBLEME.KLIENT_ID
where KLIENT.EMER=@klient
return @problemi
end

select * from KLIENT;

select PikaD 'Alba Alba';

--d) te krijohet nje procedure qe merr si parameter nje vlere x dhe shton pagen me kete vlere.
create procedure shtoPagen (@vlera int) as
begin
update PUNONJES set PAGA=PAGA+@vlera
end

execute shtoPagen @vlera=100 ;

SELECT * FROM PUNONJES;


--e) kursor qe afishon emrat e Klienteve
DECLARE @name as varchar(30)

DECLARE kursor CURSOR
FOR
SELECT EMER FROM KLIENT

OPEN kursor

FETCH NEXT FROM kursor into @name

WHILE @@FETCH_STATUS = 0 
BEGIN
PRINT cast(@name as varchar(30))
FETCH NEXT FROM kursor INTO @name
END
CLOSE kursor
DEALLOCATE kursor

-------------------------------------------------------------------------------------------------------

