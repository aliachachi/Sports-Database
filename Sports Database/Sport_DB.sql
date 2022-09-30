// ----------------------PARTIE 1-----------------------//

1/******************************************************

create tablespace GYMNASES_TBS datafile 'D:\GYMNASES_TBS.dat' size 100M autoextend on online;
create temporary tablespace GYMNASES_TempTBS tempfile 'D:\GYMNASES_TempTBS.dat' size 100M autoextend on;

2/******************************************************

create user DBAGYMNASES identified by pswd default tablespace GYMNASES_TBS temporary tablespace GYMNASES_TempTBS;

3/*******************************************************

grant all privileges to DBAGYMNASES ;



// ------------------------- PARTIE 02 -----------------------//

4/******************************************************

CREATE TABLE Sportifs(
  IDSPORTIF int,
  NOM varchar(30),
  PRENOM varchar(150),
  SEXE varchar(1),
  AGE int,
  IDSPORTIFCONSEILLER int,
  constraint fk_Sportifs foreign key(IDSPORTIFCONSEILLER) references Sportifs(IDSPORTIF) on delete cascade,
  constraint c1_SEXE check (SEXE in ('M','F')),
  constraint pk_Sportifs PRIMARY KEY (IDSPORTIF)
);

desc Sportifs;

CREATE TABLE Sports (
  IDSPORTS int,
  LIBELLE varchar(300),
  constraint pk_Sports PRIMARY KEY (IDSPORTS)
);

desc Sports;


CREATE TABLE Gymnases(
  IDGYMNASE int,
  NOMGYMNASE varchar(30),
  ADRESSE varchar(50),
  VILLE varchar(30),
  SURFACE int,
  constraint pk_Gymnases PRIMARY KEY (IDGYMNASE)
);

desc Gymnases;


CREATE TABLE Arbitrer(
  IDSPORTS int,
  IDSPORTIF int,
  constraint fk1_Arbitrer foreign key(IDSPORTS) references Sports(IDSPORTS) on delete cascade,
  constraint fk2_SPORTIFS foreign key(IDSPORTIF) references Sportifs(IDSPORTIF) on delete cascade,
  constraint pk_Arbitrer PRIMARY KEY (IDSPORTS,IDSPORTIF)
);

desc Arbitrer;


CREATE TABLE Entrainer(
  IDSPORTIFENTRAINER int,
  IDSPORTS int,
  constraint fk1_Entrainer foreign key(IDSPORTS) references Sports(IDSPORTS) on delete cascade,
  constraint fk2_Entrainer foreign key(IDSPORTIFENTRAINER) references Sportifs(IDSPORTIF) on delete cascade,
  constraint pk_Entrainer PRIMARY KEY(IDSPORTS,IDSPORTIFENTRAINER)
);

desc Entrainer;


CREATE TABLE Jouer(
  IDSPORTS int,
  IDSPORTIF int,
  constraint fk1_Jouer foreign key(IDSPORTS) references Sports(IDSPORTS) on delete cascade,
  constraint fk2_Jouer foreign key(IDSPORTIF) references Sportifs(IDSPORTIF) on delete cascade,
  constraint pk_Jouer PRIMARY KEY(IDSPORTS,IDSPORTIF)
);

desc Jouer;

CREATE TABLE Seances(
    IDGYMNASE int,
    IDSPORTS int,
    IDSPORTIFENTRAINER int,
    JOUR varchar(30),
    HORAIRE number, 
    DUREE int,
    constraint ck_JOUR check(JOUR in('samdi','demanche','lundi','mardi','mercredi','jeudi','vendredi')),
    constraint f1k_Seances foreign key(IDGYMNASE) references Gymnases(IDGYMNASE) on delete cascade ,   
    constraint fk2_Seances foreign key(IDSPORTS) references Sports(IDSPORTS) on delete cascade,
    constraint fk3_Seances foreign key(IDSPORTIFENTRAINER) references Sportifs(IDSPORTIF) on delete cascade,
    constraint pk_Seanses PRIMARY KEY(IDGYMNASE,IDSPORTS,IDSPORTIFENTRAINER,JOUR,HORAIRE)
);

desc Seances;


CREATE TABLE TableErreurs   (adresse ROWID, utilisateur VARCHAR2(30), nomTable VARCHAR2(30),nomContrainte VARCHAR2(30)); 


5/*********************************************

ALTER TABLE GYMNASES
ADD DATECREATION Date;

desc Gymnases;

6/*********************************************


alter table Sportifs modify SEXE not null;

alter table Sportifs modify AGE not null;

desc Sportifs;

7/*********************************************

// ** agrandir **

alter table SPORTIFS modify PRENOM varchar(160);
desc Sportifs

// ***** reduire *****

alter table SPORTIFS modify PRENOM varchar(140);
desc Sportifs;

8/*********************************************

alter table GYMNASES drop column DATECREATION;
desc Gymnases;

9/*********************************************

ALTER TABLE GYMNASES RENAME COLUMN ADRESSE_GYM TO ADR_GM;
desc Gymnases;

10/*********************************************

ALTER TABLE Sports add constraint pk_Sports check (LIBELLE IN ('basket ball','volly ball','hand ball','Tennis', 'Hockey','Badmington','Ping Pong', 'Foot Bal' , 'Boxe'));


11/*********************************************
 
 // Remplissage des Tables

INSERT INTO Sportifs VALUES(3,'BOUZIDI','Amel','F',25,1);
INSERT INTO Sportifs VALUES(4,'LACHEMI','Bouzid','M',32,1);
INSERT INTO Sportifs VALUES(1,'BOUTAHAR','Abderahim','M',30,NULL);
INSERT INTO Sportifs VALUES(2,'BOUROUBI','Anis','M',28,1);
INSERT INTO Sportifs VALUES(5,'AAKOUB','Linda','F',22,1);
INSERT INTO Sportifs VALUES(6,'ABBAS','Sophia','F',30,3);
INSERT INTO Sportifs VALUES(7,'HADJ','Zouhir','M',25,2);
INSERT INTO Sportifs VALUES(8,'HAMADI','Hani','M',30,2);
INSERT INTO Sportifs VALUES(9,'ABDELMOUMEN','Nadia','F',23,4);
INSERT INTO Sportifs VALUES(10,'ABAD','Abdelhamid','M',23,2);
INSERT INTO Sportifs VALUES(11,'ABAYAHIA','Amine','M',24,6);
INSERT INTO Sportifs VALUES(12,'ABBACI','Riad','M',24,8);
INSERT INTO Sportifs VALUES(13,'ABBACI','Mohamed','M',22,4);
INSERT INTO Sportifs VALUES(14,'ABDELOUAHAB','Lamia','F',24,1);
INSERT INTO Sportifs VALUES(15,'ABDEMEZIANE','Majid','M',25,3);
INSERT INTO Sportifs VALUES(16,'BENOUADAH','Lamine','M',24,8);
INSERT INTO Sportifs VALUES(17,'ACHAIBOU','Rachid','M',22,7);
INSERT INTO Sportifs VALUES(18,'HOSNI','Leila','F',25,5);
INSERT INTO Sportifs VALUES(19,'ABERKANE','Adel','M',25,1);
INSERT INTO Sportifs VALUES(20,'AZOUG','Racim','M',25,2);
INSERT INTO Sportifs VALUES(21,'BABACI','Mourad','M',22,2);
INSERT INTO Sportifs VALUES(22,'BAKIR','Ayoub','M',25,3);
INSERT INTO Sportifs VALUES(23,'BEHADI','Youcef','M',24,2);
INSERT INTO Sportifs VALUES(24,'AMARA','Nassima','F',23,7);
INSERT INTO Sportifs VALUES(25,'AROUEL','Lyes','M',23,9);
INSERT INTO Sportifs VALUES(26,'BAALI','Leila','F',23,3);
INSERT INTO Sportifs VALUES(27,'BADI','Hatem','M',23,7);
INSERT INTO Sportifs VALUES(28,'RABAHI','Rabah','M',40,4);
INSERT INTO Sportifs VALUES(29,'ROUSSELI','Lamice','F',22,5);
INSERT INTO Sportifs VALUES(30,'CHIKHI','Nidal','M',24,4);
INSERT INTO Sportifs VALUES(31,'SETIHA','Moustapha','M',22,2);
INSERT INTO Sportifs VALUES(32,'COTERI','Daouad','M',23,3);
INSERT INTO Sportifs VALUES(33,'RAMELI','Sami','M',23,1);
INSERT INTO Sportifs VALUES(34,'LEHIRACHE','Oussama','M',24,3);
INSERT INTO Sportifs VALUES(35,'TERIKI','Yacine','M',24,4);
INSERT INTO Sportifs VALUES(36,'DJELOUDANE','Zinedine','M',28,1);
INSERT INTO Sportifs VALUES(37,'LAZARI','Malika','F',25,44);
INSERT INTO Sportifs VALUES(38,'MESSOUNI','Ismail','M',24,1);
INSERT INTO Sportifs VALUES(39,'MORELI','Otheman','M',24,8);
INSERT INTO Sportifs VALUES(40,'FATAHI','Majid','M',23,2);
INSERT INTO Sportifs VALUES(41,'DELHOUME','Elina','F',22,7);
INSERT INTO Sportifs VALUES(42,'BEHADI','Nadir','M',23,5);
INSERT INTO Sportifs VALUES(43,'MATI','Dalia','F',23,6);
INSERT INTO Sportifs VALUES(44,'ADIBOU','Ibrahim','M',28,21);
INSERT INTO Sportifs VALUES(45,'CHALI','Karim','M',25,NULL);
INSERT INTO Sportifs VALUES(46,'DOUDOU','Islam','M',24,4);
INSERT INTO Sportifs VALUES(47,'Grine','Célina','F',25,2);
INSERT INTO Sportifs VALUES(48,'HEDDI','Zohra','F',23,2);
INSERT INTO Sportifs VALUES(49,'JADI','Sandra','F',24,5);
INSERT INTO Sportifs VALUES(50,'KALI','Yasser','M',22,2);
INSERT INTO Sportifs VALUES(51,'LAJEL','Fouad','M',24,5);
INSERT INTO Sportifs VALUES(52,'DANDOUR','Rami','M',22,5);
INSERT INTO Sportifs VALUES(53,'DEMMERA','Houcine','M',22,1);
INSERT INTO Sportifs VALUES(54,'ELKABBADJ','Mohammed','M',23,2);
INSERT INTO Sportifs VALUES(55,'FEROLI','Omer','M',23,2);
INSERT INTO Sportifs VALUES(56,'GUERRAOUI','Zohra','F',25,1);
INSERT INTO Sportifs VALUES(57,'BOUACHA','Aziz','M',25,1);
INSERT INTO Sportifs VALUES(58,'GUITENI','Adam','M',23,4);
INSERT INTO Sportifs VALUES(59,'KACI','Samia','F',23,NULL);
INSERT INTO Sportifs VALUES(60,'TIZEGHAT','Badis','M',32,3);
INSERT INTO Sportifs VALUES(61,'LAZARRI','Jamel','M',27,7);
INSERT INTO Sportifs VALUES(62,'BAZOUDI','Jaouad','M',32,3);
INSERT INTO Sportifs VALUES(63,'AMANI','Fadi','M',30,1);
INSERT INTO Sportifs VALUES(64,'LANORI','Faiza','F',30,2);
INSERT INTO Sportifs VALUES(65,'CHAADI','Mourad','M',30,NULL);
INSERT INTO Sportifs VALUES(66,'DANDANE','Mohamed','M',30,2);
INSERT INTO Sportifs VALUES(67,'FATTIMI','Dalila','F',26,2);
INSERT INTO Sportifs VALUES(68,'REGHI','Jazia','F',30,2);
INSERT INTO Sportifs VALUES(69,'MARADI','Hadjer','F',25,7);
INSERT INTO Sportifs VALUES(70,'BELMADI','Nadji','M',30,9);
INSERT INTO Sportifs VALUES(71,'DELAROCHI','Racim','M',30,8);
INSERT INTO Sportifs VALUES(72,'MARTALI','Bouzid','M',22,8);
INSERT INTO Sportifs VALUES(73,'DALLIMI','Douad','M',30,6);
INSERT INTO Sportifs VALUES(74,'OUBACHA','Adel','M',30,5);
INSERT INTO Sportifs VALUES(75,'SAADI','Nihal','F',39,1);
INSERT INTO Sportifs VALUES(76,'HALGATTI','Camelia','F',30,21);
INSERT INTO Sportifs VALUES(77,'HIDDOUCI','Farid','M',30,1);
INSERT INTO Sportifs VALUES(78,'CHAOUAH','Jamel','M',30,NULL);
INSERT INTO Sportifs VALUES(79,'HANDI','Jaouad','M',30,2);
INSERT INTO Sportifs VALUES(80,'HOCHET','Ramezi','M',30,1);
INSERT INTO Sportifs VALUES(81,'DROULLONI','Jaouida','F',30,1);
INSERT INTO Sportifs VALUES(82,'HOULEMI','Lyes','M',40,14);
INSERT INTO Sportifs VALUES(83,'LOUATI','Ahmed','M',30,4);
INSERT INTO Sportifs VALUES(84,'SALLADj','Miloud','M',28,2);
INSERT INTO Sportifs VALUES(85,'HAMARI','Anes','M',30,2);
INSERT INTO Sportifs VALUES(86,'GALLOTI','Boualem','M',30,2);
INSERT INTO Sportifs VALUES(87,'KASBADJI','Fateh','M',30,2);
INSERT INTO Sportifs VALUES(88,'JENOURI','Rachid','M',30,8);
INSERT INTO Sportifs VALUES(89,'RIHABI','Jamel','M',30,NULL);
INSERT INTO Sportifs VALUES(90,'DERARNI','Nadir','M',30,2);
INSERT INTO Sportifs VALUES(91,'BATERAOUI','Zinedine','M',30,98);
INSERT INTO Sportifs VALUES(92,'HADJI','Jamel','M',22,5);
INSERT INTO Sportifs VALUES(93,'CAUCHARDI','Nabil','M',30,2);
INSERT INTO Sportifs VALUES(94,'LEROUDI','Moussa','M',36,4);
INSERT INTO Sportifs VALUES(95,'ESTANBOULI','Mazine','M',30,2);
INSERT INTO Sportifs VALUES(96,'JANID','Lamine','M',30,2);
INSERT INTO Sportifs VALUES(97,'BONHOMMANE','Bassim','M',30,NULL);
INSERT INTO Sportifs VALUES(98,'RIADI','Walid','M',30,2);
INSERT INTO Sportifs VALUES(99,'BONETI','Djalal','M',32,NULL);
INSERT INTO Sportifs VALUES(100,'LESOIFI','Djamil','M',30,9);
INSERT INTO Sportifs VALUES(101,'SWAMI','Esslam','M',30,5);
INSERT INTO Sportifs VALUES(102,'DAOUDI','Adel','M',30,2);
INSERT INTO Sportifs VALUES(103,'LAAMOURI','Nasssim','M',30,4);
INSERT INTO Sportifs VALUES(104,'SEHIER','Dihia','F',30,1);
INSERT INTO Sportifs VALUES(105,'STITOUAH','Fouad','M',30,3);
INSERT INTO Sportifs VALUES(106,'BAADI','Hani','M',30,1);
INSERT INTO Sportifs VALUES(107,'BOURAS','Nazim','M',30,9);
INSERT INTO Sportifs VALUES(108,'AIT AMARA','Salim','M',30,4);
INSERT INTO Sportifs VALUES(109,'SAGOU','Bassel','M',30,5);
INSERT INTO Sportifs VALUES(110,'ROULLADI','Aissa','M',30,4);
INSERT INTO Sportifs VALUES(111,'BOUTINE','Mohamed','M',30,8);
INSERT INTO Sportifs VALUES(112,'LOUATI','Islam','M',30,2);
INSERT INTO Sportifs VALUES(113,'AID','Naim','M',30,2);
INSERT INTO Sportifs VALUES(114,'MICHALIKH','Asma','F',22,5);
INSERT INTO Sportifs VALUES(115,'LEMOUSSI','Amine','M',30,1);
INSERT INTO Sportifs VALUES(116,'BELIFA','Samia','F',30,8);
INSERT INTO Sportifs VALUES(117,'FERRIRA','Manel','F',30,2);
INSERT INTO Sportifs VALUES(118,'IGHOLI','Lyes','M',30,2);
INSERT INTO Sportifs VALUES(119,'GUEMEZ','Jaouad','M',30,1);
INSERT INTO Sportifs VALUES(120,'LECOM','Aissa','M',30,6);
INSERT INTO Sportifs VALUES(121,'HOUAT','Aziz','M',30,5);
INSERT INTO Sportifs VALUES(122,'BEQUETA','Aicha','F',30,6);
INSERT INTO Sportifs VALUES(123,'RATENI','Walid','M',30,6);
INSERT INTO Sportifs VALUES(124,'TOUAT','Yasmine','F',30,2);
INSERT INTO Sportifs VALUES(125,'JALONI','Aimad','M',30,2);
INSERT INTO Sportifs VALUES(126,'DEBOUBA','yasser','M',30,5);
INSERT INTO Sportifs VALUES(127,'GASTAB','Chouaib','M',30,2);
INSERT INTO Sportifs VALUES(128,'GIRONI','Younes','M',30,1);
INSERT INTO Sportifs VALUES(129,'DABONI','Rachid','M',30,3);
INSERT INTO Sportifs VALUES(130,'LACHOUBI','Kamel','M',30,5);
INSERT INTO Sportifs VALUES(131,'GALLOI','Nadira','F',30,2);
INSERT INTO Sportifs VALUES(132,'DORONI','Yanis','M',30,1);
INSERT INTO Sportifs VALUES(133,'LENOUCHI','Youcef','M',30,2);
INSERT INTO Sportifs VALUES(134,'LERICHE','Hadi','M',30,5);
INSERT INTO Sportifs VALUES(135,'MANSOUR','Lamine','M',30,4);
INSERT INTO Sportifs VALUES(136,'LABOULAIS','Fadia','F',26,2);
INSERT INTO Sportifs VALUES(137,'DOUDOU','Faiza','F',26,2);
INSERT INTO Sportifs VALUES(138,'MAALEM','Lamia','F',26,1);
INSERT INTO Sportifs VALUES(139,'BESNARD','Salma','F',26,4);
INSERT INTO Sportifs VALUES(140,'BELHAMID','Hadjer','F',26,7);
INSERT INTO Sportifs VALUES(141,'BOUAAZA','Asma','F',26,5);
INSERT INTO Sportifs VALUES(142,'CORCHI','Melissa','F',26,1);
INSERT INTO Sportifs VALUES(143,'BELAID','Jaouida','F',26,5);
INSERT INTO Sportifs VALUES(144,'GASMI','Souad','F',26,2);
INSERT INTO Sportifs VALUES(145,'LAAMARA','Maria','F',25,2);
INSERT INTO Sportifs VALUES(146,'DABOUB','Ramezi','M',25,3);
INSERT INTO Sportifs VALUES(147,'HASSINI','Nadia','F',25,2);
INSERT INTO Sportifs VALUES(148,'KALOUNE','Maria','F',27,1);
INSERT INTO Sportifs VALUES(149,'BELHAOUA','Besma','F',27,7);
INSERT INTO Sportifs VALUES(150,'BELAID','Fouad','M',25,2);
INSERT INTO Sportifs VALUES(151,'HENDI','Mouad','M',25,2);
--table Sports
INSERT INTO Sports VALUES(1,'Basket ball');
INSERT INTO Sports VALUES(2,'Volley ball');
INSERT INTO Sports VALUES(3,'Hand ball');
INSERT INTO Sports VALUES(4,'Tennis');
INSERT INTO Sports VALUES(5,'Hockey');
INSERT INTO Sports VALUES(6,'Badmington');
INSERT INTO Sports VALUES(7,'Ping pong');
INSERT INTO Sports VALUES(8,'Football');
INSERT INTO Sports VALUES(9,'Boxe');

------------------table Gymnases--------------------

INSERT INTO Gymnases VALUES(1,'Five Gym Club','Boulevard Mohamed 5','Alger centre',200);
INSERT INTO Gymnases VALUES(2,'Mina Sport','28 impasse musette les sources','Les sources',450);
INSERT INTO Gymnases VALUES(3,'Aït Saada','Belouizdad','Belouizdad',400);
INSERT INTO Gymnases VALUES(4,'Bahri Gym','Rue Mohamed Benzineb','Sidi Mhamed',500);
INSERT INTO Gymnases VALUES(5,'Ladies First','3 Rue Diar Naama N° 03','El Biar',620);
INSERT INTO Gymnases VALUES(6,'C.T.F Club','Rue Sylvain FOURASTIER', 'El Mouradia',400);
INSERT INTO Gymnases VALUES(7,'Body Fitness Center','Rue Rabah Takdjourt','Alger centre',360);
INSERT INTO Gymnases VALUES(8,'Club Hydra Forme','Rue de l''Oasis', 'Hydra',420);
INSERT INTO Gymnases VALUES(9,'Profitness Dely Brahim','26 Bois des Cars 3', 'Dely Brahim', 620);
INSERT INTO Gymnases VALUES(10,'CLUB SIFAKS','Rue Ben Omar 31', 'Kouba',400);
INSERT INTO Gymnases VALUES(11,'Gym ZAAF Club','19 Ave Merabet Athmane', 'El Mouradia', 300);
INSERT INTO Gymnases VALUES(12,'GYM power','villa N°2, Chemin Said Hamdine', 'Bir Mourad Raïs', 480);
INSERT INTO Gymnases VALUES(13,'Icosium sport','Rue ICOSUM', 'Hydra',200);
INSERT INTO Gymnases VALUES(14,'GIGA Fitness','res, Rue Hamoum Tahar', 'Birkhadem', 500);
INSERT INTO Gymnases VALUES(15,'AC Fitness Et Aqua','Lotissement FAHS lot A n 12 parcelle 26', 'Birkhadem',400);
INSERT INTO Gymnases VALUES(16,'MELIA GYM','Résidence les deux bassins Sahraoui local N° 03', 'El Achour', 600);
INSERT INTO Gymnases VALUES(17,'Sam Gym Power','Rue Mahdoud BENKHOUDJA', 'Kouba', 400);
INSERT INTO Gymnases VALUES(18,'AQUAFORTLAND SPA','Bordj el kiffan','Bordj el kiffan',450);
INSERT INTO Gymnases VALUES(19,'GoFitness','Lotissement el louz n°264', 'Baba hassen', 500);
INSERT INTO Gymnases VALUES(20,'Best Body Gym','Cité Alioua Fodil', 'Chéraga', 400);
INSERT INTO Gymnases VALUES(21,'Power house gym','Cooperative Amina 02 Lot 15', 'Alger',400);
INSERT INTO Gymnases VALUES(22,'POWER ZONE GYM','Chemin Fernane Hanafi', 'Hussein Dey', 500);
INSERT INTO Gymnases VALUES(23,'World Gym','14 Boulevard Ibrahim Hadjress', 'Béni Messous',520);
INSERT INTO Gymnases VALUES(24,'Moving Club','Bordj El Bahri','Bordj El Bahri',450);
INSERT INTO Gymnases VALUES(25,'Tiger gym','Route de Bouchaoui', 'Chéraga', 620);
INSERT INTO Gymnases VALUES(26,'Lion CrossFit','Centre commercial-Mohamadia mall',
'Mohammadia',600);
INSERT INTO Gymnases VALUES(27,'Étoile sportive','Saoula','Saoula',350);
INSERT INTO Gymnases VALUES(28,'Fitness life gym','El Harrach','El Harrach',400);

-----------------------------table Arbitrer--------------------------------------

INSERT INTO Arbitrer VALUES(1,1);
INSERT INTO Arbitrer VALUES(1,2);
INSERT INTO Arbitrer VALUES(1,5);
INSERT INTO Arbitrer VALUES(2,5);
INSERT INTO Arbitrer VALUES(2,8);
INSERT INTO Arbitrer VALUES(3,2);
INSERT INTO Arbitrer VALUES(3,6);
INSERT INTO Arbitrer VALUES(3,7);
INSERT INTO Arbitrer VALUES(4,1);
INSERT INTO Arbitrer VALUES(4,2);
INSERT INTO Arbitrer VALUES(4,7);
INSERT INTO Arbitrer VALUES(4,9);
INSERT INTO Arbitrer VALUES(5,7);
INSERT INTO Arbitrer VALUES(6,1);
INSERT INTO Arbitrer VALUES(6,5);
INSERT INTO Arbitrer VALUES(6,7);
INSERT INTO Arbitrer VALUES(7,2);
INSERT INTO Arbitrer VALUES(7,3);
INSERT INTO Arbitrer VALUES(7,5);
INSERT INTO Arbitrer VALUES(19,2);
INSERT INTO Arbitrer VALUES(20,2);
INSERT INTO Arbitrer VALUES(29,7);
INSERT INTO Arbitrer VALUES(32,7);
INSERT INTO Arbitrer VALUES(35,6);
INSERT INTO Arbitrer VALUES(59,4);
INSERT INTO Arbitrer VALUES(60,2);
INSERT INTO Arbitrer VALUES(94,1);
INSERT INTO Arbitrer VALUES(98,1);
INSERT INTO Arbitrer VALUES(105,1);
INSERT INTO Arbitrer VALUES(149,1);
INSERT INTO Arbitrer VALUES(151,1);
INSERT INTO Arbitrer VALUES(151,3);

--------------------------------------table Entrainer--------------------------------------------------

INSERT INTO Entrainer VALUES(1,1);
INSERT INTO Entrainer VALUES(1,2);
INSERT INTO Entrainer VALUES(1,3);
INSERT INTO Entrainer VALUES(1,5);
INSERT INTO Entrainer VALUES(1,6);
INSERT INTO Entrainer VALUES(2,1);
INSERT INTO Entrainer VALUES(2,2);
INSERT INTO Entrainer VALUES(2,3);
INSERT INTO Entrainer VALUES(2,4);
INSERT INTO Entrainer VALUES(2,5);
INSERT INTO Entrainer VALUES(2,6);
INSERT INTO Entrainer VALUES(2,7);
INSERT INTO Entrainer VALUES(2,9);
INSERT INTO Entrainer VALUES(3,1);
INSERT INTO Entrainer VALUES(3,2);
INSERT INTO Entrainer VALUES(3,3);
INSERT INTO Entrainer VALUES(3,6);
INSERT INTO Entrainer VALUES(4,1);
INSERT INTO Entrainer VALUES(4,7);
INSERT INTO Entrainer VALUES(4,9);
INSERT INTO Entrainer VALUES(6,5);
INSERT INTO Entrainer VALUES(6,7);
INSERT INTO Entrainer VALUES(6,9);
INSERT INTO Entrainer VALUES(7,2);
INSERT INTO Entrainer VALUES(7,3);
INSERT INTO Entrainer VALUES(7,5);
INSERT INTO Entrainer VALUES(7,6);
INSERT INTO Entrainer VALUES(29,7);
INSERT INTO Entrainer VALUES(30,7);
INSERT INTO Entrainer VALUES(31,7);
INSERT INTO Entrainer VALUES(32,7);
INSERT INTO Entrainer VALUES(35,6);
INSERT INTO Entrainer VALUES(35,7);
INSERT INTO Entrainer VALUES(36,6);
INSERT INTO Entrainer VALUES(38,7);
INSERT INTO Entrainer VALUES(40,6);
INSERT INTO Entrainer VALUES(40,7);
INSERT INTO Entrainer VALUES(48,6);
INSERT INTO Entrainer VALUES(50,6);
INSERT INTO Entrainer VALUES(56,6);
INSERT INTO Entrainer VALUES(57,2);
INSERT INTO Entrainer VALUES(57,4);
INSERT INTO Entrainer VALUES(58,2);
INSERT INTO Entrainer VALUES(58,4);
INSERT INTO Entrainer VALUES(59,2);
INSERT INTO Entrainer VALUES(59,4);
INSERT INTO Entrainer VALUES(60,2);
INSERT INTO Entrainer VALUES(60,4);
INSERT INTO Entrainer VALUES(60,7);
INSERT INTO Entrainer VALUES(61,2);
INSERT INTO Entrainer VALUES(61,4);
INSERT INTO Entrainer VALUES(149,1);
INSERT INTO Entrainer VALUES(151,1);
INSERT INTO Entrainer VALUES(151,3);

-----------------------------------table Jouer-------------------------------

INSERT INTO Jouer VALUES(1,2);
INSERT INTO Jouer VALUES(1,4);
INSERT INTO Jouer VALUES(1,8);
INSERT INTO Jouer VALUES(2,1);
INSERT INTO Jouer VALUES(2,2);
INSERT INTO Jouer VALUES(2,7);
INSERT INTO Jouer VALUES(2,8);
INSERT INTO Jouer VALUES(3,2);
INSERT INTO Jouer VALUES(3,7);
INSERT INTO Jouer VALUES(4,2);
INSERT INTO Jouer VALUES(4,8);
INSERT INTO Jouer VALUES(5,1);
INSERT INTO Jouer VALUES(5,2);
INSERT INTO Jouer VALUES(5,6);
INSERT INTO Jouer VALUES(5,7);
INSERT INTO Jouer VALUES(6,1);
INSERT INTO Jouer VALUES(6,2);
INSERT INTO Jouer VALUES(6,3);
INSERT INTO Jouer VALUES(6,7);
INSERT INTO Jouer VALUES(7,2);
INSERT INTO Jouer VALUES(7,4);
INSERT INTO Jouer VALUES(7,8);
INSERT INTO Jouer VALUES(9,2);
INSERT INTO Jouer VALUES(9,4);
INSERT INTO Jouer VALUES(9,6);
INSERT INTO Jouer VALUES(10,2);
INSERT INTO Jouer VALUES(10,4);
INSERT INTO Jouer VALUES(10,6);
INSERT INTO Jouer VALUES(10,8);
INSERT INTO Jouer VALUES(11,2);
INSERT INTO Jouer VALUES(11,4);
INSERT INTO Jouer VALUES(11,8);
INSERT INTO Jouer VALUES(12,2);
INSERT INTO Jouer VALUES(12,4);
INSERT INTO Jouer VALUES(12,8);
INSERT INTO Jouer VALUES(13,2);
INSERT INTO Jouer VALUES(13,6);
INSERT INTO Jouer VALUES(13,8);
INSERT INTO Jouer VALUES(14,1);
INSERT INTO Jouer VALUES(14,2);
INSERT INTO Jouer VALUES(14,7);
INSERT INTO Jouer VALUES(15,2);
INSERT INTO Jouer VALUES(15,4);
INSERT INTO Jouer VALUES(15,8);
INSERT INTO Jouer VALUES(16,2);
INSERT INTO Jouer VALUES(16,8);
INSERT INTO Jouer VALUES(17,2);
INSERT INTO Jouer VALUES(17,6);
INSERT INTO Jouer VALUES(17,8);
INSERT INTO Jouer VALUES(18,2);
INSERT INTO Jouer VALUES(19,2);
INSERT INTO Jouer VALUES(19,3);
INSERT INTO Jouer VALUES(19,8);
INSERT INTO Jouer VALUES(20,1);
INSERT INTO Jouer VALUES(20,2);
INSERT INTO Jouer VALUES(20,3);
INSERT INTO Jouer VALUES(20,7);
INSERT INTO Jouer VALUES(20,8);
INSERT INTO Jouer VALUES(21,2);
INSERT INTO Jouer VALUES(21,4);
INSERT INTO Jouer VALUES(21,6);
INSERT INTO Jouer VALUES(21,8);
INSERT INTO Jouer VALUES(22,1);
INSERT INTO Jouer VALUES(22,2);
INSERT INTO Jouer VALUES(22,7);
INSERT INTO Jouer VALUES(22,8);
INSERT INTO Jouer VALUES(23,2);
INSERT INTO Jouer VALUES(23,4);
INSERT INTO Jouer VALUES(23,8);
INSERT INTO Jouer VALUES(24,1);
INSERT INTO Jouer VALUES(24,2);
INSERT INTO Jouer VALUES(24,6);
INSERT INTO Jouer VALUES(24,7);
INSERT INTO Jouer VALUES(25,2);
INSERT INTO Jouer VALUES(25,3);
INSERT INTO Jouer VALUES(25,4);
INSERT INTO Jouer VALUES(25,6);
INSERT INTO Jouer VALUES(25,8);
INSERT INTO Jouer VALUES(26,2);
INSERT INTO Jouer VALUES(26,3);
INSERT INTO Jouer VALUES(26,4);
INSERT INTO Jouer VALUES(26,6);
INSERT INTO Jouer VALUES(27,2);
INSERT INTO Jouer VALUES(27,3);
INSERT INTO Jouer VALUES(27,4);
INSERT INTO Jouer VALUES(27,6);
INSERT INTO Jouer VALUES(27,8);
INSERT INTO Jouer VALUES(28,1);
INSERT INTO Jouer VALUES(28,2);
INSERT INTO Jouer VALUES(28,3);
INSERT INTO Jouer VALUES(28,7);
INSERT INTO Jouer VALUES(28,8);
INSERT INTO Jouer VALUES(29,2);
INSERT INTO Jouer VALUES(29,3);
INSERT INTO Jouer VALUES(29,6);
INSERT INTO Jouer VALUES(29,7);
INSERT INTO Jouer VALUES(30,2);
INSERT INTO Jouer VALUES(30,3);
INSERT INTO Jouer VALUES(30,7);
INSERT INTO Jouer VALUES(30,8);
INSERT INTO Jouer VALUES(31,2);
INSERT INTO Jouer VALUES(31,3);
INSERT INTO Jouer VALUES(31,6);
INSERT INTO Jouer VALUES(31,8);
INSERT INTO Jouer VALUES(32,1);
INSERT INTO Jouer VALUES(32,2);
INSERT INTO Jouer VALUES(32,3);
INSERT INTO Jouer VALUES(32,6);
INSERT INTO Jouer VALUES(32,7);
INSERT INTO Jouer VALUES(32,8);
INSERT INTO Jouer VALUES(33,2);
INSERT INTO Jouer VALUES(33,3);
INSERT INTO Jouer VALUES(33,6);
INSERT INTO Jouer VALUES(33,8);
INSERT INTO Jouer VALUES(34,2);
INSERT INTO Jouer VALUES(34,3);
INSERT INTO Jouer VALUES(34,7);
INSERT INTO Jouer VALUES(34,8);
INSERT INTO Jouer VALUES(35,1);
INSERT INTO Jouer VALUES(35,2);
INSERT INTO Jouer VALUES(35,3);
INSERT INTO Jouer VALUES(35,7);
INSERT INTO Jouer VALUES(35,8);
INSERT INTO Jouer VALUES(36,1);
INSERT INTO Jouer VALUES(36,2);
INSERT INTO Jouer VALUES(36,7);
INSERT INTO Jouer VALUES(36,8);
INSERT INTO Jouer VALUES(37,2);
INSERT INTO Jouer VALUES(38,3);
INSERT INTO Jouer VALUES(38,6);
INSERT INTO Jouer VALUES(38,8);
INSERT INTO Jouer VALUES(39,3);
INSERT INTO Jouer VALUES(39,8);
INSERT INTO Jouer VALUES(40,1);
INSERT INTO Jouer VALUES(40,3);
INSERT INTO Jouer VALUES(40,6);
INSERT INTO Jouer VALUES(40,7);
INSERT INTO Jouer VALUES(40,8);
INSERT INTO Jouer VALUES(41,4);
INSERT INTO Jouer VALUES(41,6);
INSERT INTO Jouer VALUES(42,4);
INSERT INTO Jouer VALUES(42,6);
INSERT INTO Jouer VALUES(42,8);
INSERT INTO Jouer VALUES(43,3);
INSERT INTO Jouer VALUES(43,4);
INSERT INTO Jouer VALUES(43,6);
INSERT INTO Jouer VALUES(44,1);
INSERT INTO Jouer VALUES(44,7);
INSERT INTO Jouer VALUES(44,8);
INSERT INTO Jouer VALUES(45,4);
INSERT INTO Jouer VALUES(45,8);
INSERT INTO Jouer VALUES(46,4);
INSERT INTO Jouer VALUES(46,8);
INSERT INTO Jouer VALUES(47,4);
INSERT INTO Jouer VALUES(48,1);
INSERT INTO Jouer VALUES(48,6);
INSERT INTO Jouer VALUES(48,7);
INSERT INTO Jouer VALUES(49,1);
INSERT INTO Jouer VALUES(49,7);
INSERT INTO Jouer VALUES(50,1);
INSERT INTO Jouer VALUES(50,6);
INSERT INTO Jouer VALUES(50,7);
INSERT INTO Jouer VALUES(50,8);
INSERT INTO Jouer VALUES(51,1);
INSERT INTO Jouer VALUES(51,3);
INSERT INTO Jouer VALUES(51,7);
INSERT INTO Jouer VALUES(51,8);
INSERT INTO Jouer VALUES(52,1);
INSERT INTO Jouer VALUES(52,6);
INSERT INTO Jouer VALUES(52,7);
INSERT INTO Jouer VALUES(52,8);
INSERT INTO Jouer VALUES(53,1);
INSERT INTO Jouer VALUES(53,6);
INSERT INTO Jouer VALUES(53,7);
INSERT INTO Jouer VALUES(53,8);
INSERT INTO Jouer VALUES(54,6);
INSERT INTO Jouer VALUES(54,7);
INSERT INTO Jouer VALUES(54,8);
INSERT INTO Jouer VALUES(55,6);
INSERT INTO Jouer VALUES(55,7);
INSERT INTO Jouer VALUES(55,8);
INSERT INTO Jouer VALUES(56,1);
INSERT INTO Jouer VALUES(56,7);
INSERT INTO Jouer VALUES(57,4);
INSERT INTO Jouer VALUES(57,8);
INSERT INTO Jouer VALUES(58,1);
INSERT INTO Jouer VALUES(58,6);
INSERT INTO Jouer VALUES(58,7);
INSERT INTO Jouer VALUES(58,8);
INSERT INTO Jouer VALUES(59,1);
INSERT INTO Jouer VALUES(59,6);
INSERT INTO Jouer VALUES(59,7);
INSERT INTO Jouer VALUES(60,3);
INSERT INTO Jouer VALUES(60,4);
INSERT INTO Jouer VALUES(60,8);
INSERT INTO Jouer VALUES(61,8);
INSERT INTO Jouer VALUES(62,8);
INSERT INTO Jouer VALUES(63,1);
INSERT INTO Jouer VALUES(63,7);
INSERT INTO Jouer VALUES(63,8);
INSERT INTO Jouer VALUES(64,4);
INSERT INTO Jouer VALUES(65,8);
INSERT INTO Jouer VALUES(66,8);
INSERT INTO Jouer VALUES(67,3);
INSERT INTO Jouer VALUES(67,4);
INSERT INTO Jouer VALUES(68,3);
INSERT INTO Jouer VALUES(69,1);
INSERT INTO Jouer VALUES(69,3);
INSERT INTO Jouer VALUES(69,7);
INSERT INTO Jouer VALUES(70,7);
INSERT INTO Jouer VALUES(70,8);
INSERT INTO Jouer VALUES(71,4);
INSERT INTO Jouer VALUES(71,8);
INSERT INTO Jouer VALUES(72,3);
INSERT INTO Jouer VALUES(72,4);
INSERT INTO Jouer VALUES(72,6);
INSERT INTO Jouer VALUES(72,8);
INSERT INTO Jouer VALUES(73,4);
INSERT INTO Jouer VALUES(73,8);
INSERT INTO Jouer VALUES(74,4);
INSERT INTO Jouer VALUES(74,8);
INSERT INTO Jouer VALUES(75,3);
INSERT INTO Jouer VALUES(75,7);
INSERT INTO Jouer VALUES(76,4);
INSERT INTO Jouer VALUES(77,1);
INSERT INTO Jouer VALUES(77,7);
INSERT INTO Jouer VALUES(77,8);
INSERT INTO Jouer VALUES(78,8);
INSERT INTO Jouer VALUES(79,8);
INSERT INTO Jouer VALUES(80,1);
INSERT INTO Jouer VALUES(80,7);
INSERT INTO Jouer VALUES(80,8);
INSERT INTO Jouer VALUES(82,8);
INSERT INTO Jouer VALUES(83,3);
INSERT INTO Jouer VALUES(83,4);
INSERT INTO Jouer VALUES(83,8);
INSERT INTO Jouer VALUES(84,3);
INSERT INTO Jouer VALUES(84,8);
INSERT INTO Jouer VALUES(85,1);
INSERT INTO Jouer VALUES(85,7);
INSERT INTO Jouer VALUES(85,8);
INSERT INTO Jouer VALUES(86,4);
INSERT INTO Jouer VALUES(86,8);
INSERT INTO Jouer VALUES(87,4);
INSERT INTO Jouer VALUES(87,8);
INSERT INTO Jouer VALUES(88,1);
INSERT INTO Jouer VALUES(88,7);
INSERT INTO Jouer VALUES(88,8);
INSERT INTO Jouer VALUES(89,3);
INSERT INTO Jouer VALUES(89,8);
INSERT INTO Jouer VALUES(90,4);
INSERT INTO Jouer VALUES(90,8);
INSERT INTO Jouer VALUES(91,1);
INSERT INTO Jouer VALUES(91,7);
INSERT INTO Jouer VALUES(91,8);
INSERT INTO Jouer VALUES(92,6);
INSERT INTO Jouer VALUES(92,8);
INSERT INTO Jouer VALUES(93,8);
INSERT INTO Jouer VALUES(94,1);
INSERT INTO Jouer VALUES(94,3);
INSERT INTO Jouer VALUES(94,7);
INSERT INTO Jouer VALUES(94,8);
INSERT INTO Jouer VALUES(95,8);
INSERT INTO Jouer VALUES(96,4);
INSERT INTO Jouer VALUES(96,8);
INSERT INTO Jouer VALUES(97,4);
INSERT INTO Jouer VALUES(97,8);
INSERT INTO Jouer VALUES(98,1);
INSERT INTO Jouer VALUES(98,3);
INSERT INTO Jouer VALUES(98,7);
INSERT INTO Jouer VALUES(98,8);
INSERT INTO Jouer VALUES(99,8);
INSERT INTO Jouer VALUES(100,3);
INSERT INTO Jouer VALUES(100,8);
INSERT INTO Jouer VALUES(101,3);
INSERT INTO Jouer VALUES(101,4);
INSERT INTO Jouer VALUES(101,8);
INSERT INTO Jouer VALUES(102,4);
INSERT INTO Jouer VALUES(102,8);
INSERT INTO Jouer VALUES(103,4);
INSERT INTO Jouer VALUES(103,8);
INSERT INTO Jouer VALUES(104,3);
INSERT INTO Jouer VALUES(104,4);
INSERT INTO Jouer VALUES(105,1);
INSERT INTO Jouer VALUES(105,3);
INSERT INTO Jouer VALUES(105,7);
INSERT INTO Jouer VALUES(105,8);
INSERT INTO Jouer VALUES(106,8);
INSERT INTO Jouer VALUES(107,8);
INSERT INTO Jouer VALUES(108,1);
INSERT INTO Jouer VALUES(108,7);
INSERT INTO Jouer VALUES(108,8);
INSERT INTO Jouer VALUES(109,1);
INSERT INTO Jouer VALUES(109,3);
INSERT INTO Jouer VALUES(109,7);
INSERT INTO Jouer VALUES(109,8);
INSERT INTO Jouer VALUES(110,3);
INSERT INTO Jouer VALUES(110,4);
INSERT INTO Jouer VALUES(110,8);
INSERT INTO Jouer VALUES(111,3);
INSERT INTO Jouer VALUES(111,8);
INSERT INTO Jouer VALUES(112,3);
INSERT INTO Jouer VALUES(112,8);
INSERT INTO Jouer VALUES(113,4);
INSERT INTO Jouer VALUES(113,8);
INSERT INTO Jouer VALUES(114,3);
INSERT INTO Jouer VALUES(114,4);
INSERT INTO Jouer VALUES(114,6);
INSERT INTO Jouer VALUES(115,8);
INSERT INTO Jouer VALUES(118,1);
INSERT INTO Jouer VALUES(118,7);
INSERT INTO Jouer VALUES(118,8);
INSERT INTO Jouer VALUES(119,8);
INSERT INTO Jouer VALUES(120,4);
INSERT INTO Jouer VALUES(120,8);
INSERT INTO Jouer VALUES(121,8);
INSERT INTO Jouer VALUES(122,4);
INSERT INTO Jouer VALUES(123,1);
INSERT INTO Jouer VALUES(123,3);
INSERT INTO Jouer VALUES(123,7);
INSERT INTO Jouer VALUES(123,8);
INSERT INTO Jouer VALUES(124,3);
INSERT INTO Jouer VALUES(125,1);
INSERT INTO Jouer VALUES(125,7);
INSERT INTO Jouer VALUES(125,8);
INSERT INTO Jouer VALUES(126,4);
INSERT INTO Jouer VALUES(126,8);
INSERT INTO Jouer VALUES(127,4);
INSERT INTO Jouer VALUES(127,8);
INSERT INTO Jouer VALUES(128,4);
INSERT INTO Jouer VALUES(128,8);
INSERT INTO Jouer VALUES(129,1);
INSERT INTO Jouer VALUES(129,7);
INSERT INTO Jouer VALUES(129,8);
INSERT INTO Jouer VALUES(130,8);
INSERT INTO Jouer VALUES(132,1);
INSERT INTO Jouer VALUES(132,7);
INSERT INTO Jouer VALUES(132,8);
INSERT INTO Jouer VALUES(133,8);
INSERT INTO Jouer VALUES(134,8);
INSERT INTO Jouer VALUES(135,3);
INSERT INTO Jouer VALUES(135,8);
INSERT INTO Jouer VALUES(136,4);
INSERT INTO Jouer VALUES(137,4);
INSERT INTO Jouer VALUES(138,3);
INSERT INTO Jouer VALUES(138,4);
INSERT INTO Jouer VALUES(139,4);
INSERT INTO Jouer VALUES(140,4);
INSERT INTO Jouer VALUES(141,4);
INSERT INTO Jouer VALUES(142,4);
INSERT INTO Jouer VALUES(143,4);
INSERT INTO Jouer VALUES(144,4);
INSERT INTO Jouer VALUES(149,1);
INSERT INTO Jouer VALUES(151,1);
INSERT INTO Jouer VALUES(151,3);

-----------------------------------------table Seances-----------------------------------

INSERT INTO Seances VALUES(1,1,149,'Samedi',9.0,60);
INSERT INTO Seances VALUES(1,3,1,'Lundi',9.0,60);
INSERT INTO Seances VALUES(1,3,1,'Lundi',10.0,60);
INSERT INTO Seances VALUES(1,3,1,'Lundi',11.3,60);
INSERT INTO Seances VALUES(1,3,1,'Lundi',14.0,90);
INSERT INTO Seances VALUES(1,3,1,'Lundi',17.3,120);
INSERT INTO Seances VALUES(1,3,1,'Lundi',19.3,120);
INSERT INTO Seances VALUES(1,3,2,'Dimanche',17.3,120);
INSERT INTO Seances VALUES(1,3,2,'Dimanche',19.3,120);
INSERT INTO Seances VALUES(1,3,2,'Mardi',17.3,120);
INSERT INTO Seances VALUES(1,3,2,'Mercredi',17.3,120);
INSERT INTO Seances VALUES(1,3,2,'Samedi',15.3,60);
INSERT INTO Seances VALUES(1,3,2,'Samedi',16.3,60);
INSERT INTO Seances VALUES(1,3,2,'Samedi',17.3,120);
INSERT INTO Seances VALUES(1,3,3,'Jeudi',20.0,30);
INSERT INTO Seances VALUES(1,3,3,'Lundi',14.0,60);
INSERT INTO Seances VALUES(1,3,3,'Lundi',18.0,30);
INSERT INTO Seances VALUES(1,3,3,'Lundi',19.0,30);
INSERT INTO Seances VALUES(1,3,3,'Lundi',20.0,30);
INSERT INTO Seances VALUES(1,5,7,'Mercredi',17.0,90);
INSERT INTO Seances VALUES(2,2,57,'Dimanche',17.0,60);
INSERT INTO Seances VALUES(3,1,149,'Mercredi',11.0,30);
INSERT INTO Seances VALUES(3,2,57,'Lundi',16.3,90);
INSERT INTO Seances VALUES(3,2,60,'Jeudi',19.0,60);
INSERT INTO Seances VALUES(4,1,149,'Vendredi',10.0,30);
INSERT INTO Seances VALUES(4,5,6,'Mercredi',19.0,60);
INSERT INTO Seances VALUES(5,2,57,'Lundi',16.3,90);
INSERT INTO Seances VALUES(5,5,6,'Jeudi',19.0,60);
INSERT INTO Seances VALUES(6,5,6,'Vendredi',19.0,60);
INSERT INTO Seances VALUES(6,5,7,'Jeudi',17.0,90);
INSERT INTO Seances VALUES(8,2,57,'Dimanche',17.0,60);
INSERT INTO Seances VALUES(8,2,57,'Lundi',16.3,90);
INSERT INTO Seances VALUES(8,2,60,'Vendredi',19.0,60);
INSERT INTO Seances VALUES(8,5,7,'Samedi',17.0,90);
INSERT INTO Seances VALUES(8,5,7,'Vendredi',14.0,120);
INSERT INTO Seances VALUES(9,5,6,'Samedi',19.0,60);
INSERT INTO Seances VALUES(10,2,60,'Samedi',19.0,60);
INSERT INTO Seances VALUES(10,5,6,'Dimanche',19.0,60);
INSERT INTO Seances VALUES(10,5,7,'Dimanche',17.0,90);
INSERT INTO Seances VALUES(12,2,57,'Dimanche',17.0,60);
INSERT INTO Seances VALUES(13,2,60,'Dimanche',19.0,60);
INSERT INTO Seances VALUES(13,5,6,'Mercredi',20.0,60);
INSERT INTO Seances VALUES(13,5,7,'Lundi',17.0,90);
INSERT INTO Seances VALUES(14,1,149,'Mardi',10.0,60);
INSERT INTO Seances VALUES(14,2,57,'Dimanche',17.0,60);
INSERT INTO Seances VALUES(15,2,57,'Lundi',16.3,90);
INSERT INTO Seances VALUES(16,2,57,'Lundi',16.3,90);
INSERT INTO Seances VALUES(16,2,60,'Lundi',17.0,60);
INSERT INTO Seances VALUES(16,2,60,'Lundi',18.0,60);
INSERT INTO Seances VALUES(16,2,60,'Lundi',19.0,60);
INSERT INTO Seances VALUES(16,2,60,'Lundi',20.0,60);
INSERT INTO Seances VALUES(16,5,6,'Mercredi',19.0,60);
INSERT INTO Seances VALUES(17,2,3,'Samedi',17.3,120);
INSERT INTO Seances VALUES(17,2,3,'Vendredi',17.3,120);
INSERT INTO Seances VALUES(17,2,57,'Dimanche',17.0,60);
INSERT INTO Seances VALUES(17,3,3,'Dimanche',18.0,30);
INSERT INTO Seances VALUES(17,3,3,'Mardi',20.0,30);
INSERT INTO Seances VALUES(17,5,7,'Mardi',17.0,90);
INSERT INTO Seances VALUES(18,2,57,'Lundi',16.3,90);
INSERT INTO Seances VALUES(18,2,60,'Mardi',19.0,60);
INSERT INTO Seances VALUES(18,5,7,'Mercredi',14.0,120);
INSERT INTO Seances VALUES(18,5,7,'Mercredi',16.0,90);
INSERT INTO Seances VALUES(19,2,57,'Dimanche',17.0,60);
INSERT INTO Seances VALUES(20,5,6,'Mercredi',19.0,60);
INSERT INTO Seances VALUES(21,2,57,'Lundi',16.3,30);
INSERT INTO Seances VALUES(21,2,60,'Mardi',19.0,60);
INSERT INTO Seances VALUES(21,5,7,'Mercredi',17.0,30);
INSERT INTO Seances VALUES(22,2,57,'Mardi',10.0,30);
INSERT INTO Seances VALUES(24,1,149,'Jeudi',9.0,90);
INSERT INTO Seances VALUES(24,2,57,'Mercredi',10.0,90);
INSERT INTO Seances VALUES(25,1,149,'Dimanche',18.0,60);
INSERT INTO Seances VALUES(27,2,57,'Jeudi',10.0,90);
INSERT INTO Seances VALUES(27,5,7,'Mercredi',14.0,120);
INSERT INTO Seances VALUES(27,5,7,'Mercredi',17.0,90);
INSERT INTO Seances VALUES(28,1,149,'Lundi',9.0,30);
INSERT INTO Seances VALUES(28,5,6,'Dimanche',14.0,60);
INSERT INTO Seances VALUES(28,5,6,'Dimanche',15.0,60);
INSERT INTO Seances VALUES(28,5,6,'Dimanche',16.0,60);
INSERT INTO Seances VALUES(28,5,6,'Dimanche',17.0,60);
INSERT INTO Seances VALUES(28,5,7,'Mardi',18.0,90);
INSERT INTO Seances VALUES(28,5,7,'Samedi',18.0,90);
INSERT INTO Seances VALUES(28,5,7,'Vendredi',18.0,90);


12/**********************************************

UPDATE Sportifs  
SET IDSPORTIFCONSEILLER = (SELECT IDSPORTIF FROM Sportifs WHERE  NOM = 'CHAADI' and PRENOM = 'Mourad') 
WHERE NOM = 'LACHEMI' and PRENOM = 'Bouzid';

SELECT IDSPORTIF FROM SPORTIFS WHERE NOM = 'LACHEMI' and PRENOM = 'Bouzid';


13/**********************************************

alter table Sports disable constraint ck_LIBELLE;

insert into sports values(10, 'natation');

insert into sports values(11, 'Golf');

desc Sports;

Select * FROM Sports;

14/**********************************************

DELETE FROM GYMNASES 
WHERE SURFACE > 400;

select nomgymnase,surface from Gymnases ;

15/**********************************************

SELECT IDSPORTIF  , NOM   FROM SPORTIFS
WHERE AGE  BETWEEN 20 AND 30;

16/**********************************************

SELECT IDSPORTIF , NOM from sportifs 
WHERE idsportif in ( select IDSPORTIFCONSEILLER from SPORTIFS);

17/**********************************************


SELECT IDSPORTIF,NOM  FROM SPORTIFS 
WHERE IDSPORTIF IN ( select IDSPORTIFENTRAINER FROM ENTRAINER WHERE IDSPORTS IN (select IDSPORTS FROM SPORTS WHERE LIBELLE ='Hand ball' or LIBELLE ='Basket ball'));

18/**********************************************

SELECT NOM , AGE FROM SPORTIFS 
order by AGE asc;

19/***********************************************

 SELECT AVG(SURFACE) , VILLE FROM GYMNASES group by ville;





#########################################################################



 -------------------- TP2 : Privilèges d'accès à la base de données---------------------



1/-----Connectez-vous avec l’utilisateur DBAGYMNASES -------

conn DBAGYMNASES/pswd

2/-----Créez un autre utilisateur : ADMGYMNASE qui possède les mêmes tablespaces -------

create user ADMGYMNASE identified by pswd default tablespace GYMNASES_TBS temporary tablespace GYMNASES_TempTBS;

conn system/pswd

3/-------droit de création d’une session pour cet utilisateur -----

GRANT CREATE SESSION TO ADMGYMNASE;
conn ADMGYMNASE/pswd


4/--------les privilèges suivants à ADMINGYM et droit de création d’index ---------

conn DBAGYMNASES/pswd

GRANT CREATE TABLE ,CREATE VIEW , CREATE USER TO ADMGYMNASE ;
  

GRANT INDEX ON GYMNASES TO ADMGYMNASE;

5/-------droit de lecture à tous les utilisateurs pour la table GYMNASES ---------------

GRANT SELECT ON GYMNASES TO ADMGYMNASE;


6/------ requete Q1 et index LIBELLE_IX ----------

conn ADMGYMNASE/pswd;

select * from GYMNASES;   ----requete marche----


create index LIBELLE_IX  on DBAGYMNASES.GYMNASES(VILLE);

7/--------Enleve le privilége--------

conn DBAGYMNASES/pswd

REVOKE SELECT ON GYMNASES FROM ADMGYMNASE;

8/------------
---cette requete supprimer les gymnase qui n'organise pas de seance----
  
DELETE IDGYMNASE FROM GYMNASES 
WHERE IDGYMNASE IN (select IDGYMNASE from GYMNASES  
                    MINUS 
                    select IDGYMNASE from SEANCES);  

9/------cration role en tant que dagymnase -------
conn DBAGYMNASES/pswd

create role  GESTIONNAIRE_DES_GYMNASES;

connect system/pswd

select role from dba_roles where role='GESTIONNAIRE_DES_GYMNASES';

conn DBAGYMNASES/pswd

grant select on SPORTS to GESTIONNAIRE_DES_GYMNASES;

grant select on SPORTIFS to GESTIONNAIRE_DES_GYMNASES;

grant UPDATE on  ARBITRER to GESTIONNAIRE_DES_GYMNASES;

10/------------


grant GESTIONNAIRE_DES_GYMNASES to ADMGYMNASE;

connect system/pswd

select GRANTEE, GRANTED_ROLE from dba_role_privs where GRANTEE ='ADMGYMNASE';

11/---------afficher les privileges system deADMGYMNASE---------------
connect system/pswd
select privilege from dba_sys_privs where grantee='ADMGYMNASE';

conn ADMGYMNASE/pswd;
select privilege from user_sys_privs;

12/-----afficher les privileges objet deADMGYMNASE--------
connect system/pswd
select grantee, owner, table_name, privilege, grantable from dba_tab_privs where grantee='ADMGYMNASE';

select * from user_tab_privs;

13/----------afficher les objets de ADMGYMNASE--------

select object_name from user_objects;

select owner, object_name from dba_objects where owner = 'ADMGYMNASE';





------------------------------------------TP3: Dictionnaire---------------------------------------

1/----------
 
conn DBAGYMNASES/pswd

connect system/pswd

select USERNAME from USER_USERS;

2/--------------

connect system/pswd

select TABLE_NAME from dba_tables where OWNER='DBAGYMNASES';

3/----------------

select COMMENTS from DICT where table_name='USER_CONSTRAINTS';

select CONSTRAINT_NAME, STATUS from user_constraints where table_name=upper('SPORTIFS'); 

4/--------------

select CONSTRAINT_NAME, TABLE_NAME, COLUMN_NAME from user_cons_columns where table_name='SPORTS';

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, R_CONSTRAINT_NAME FROM USER_CONSTRAINTS WHERE TABLE_NAME='SPORTS';

select COLUMN_NAME, DATA_TYPE from USER_TAB_COLUMNS where table_name='SPORTS';


5/-------------------


connect system/pswd

desc dba_tables

select owner from dba_tables where table_name='SPORTS';







#######################################################################
-------------------1--------------------

--Ajout

CREATE OR REPLACE TRIGGER AjoutSportif
AFTER INSERT 
ON Sportifss
BEGIN
	dbms_output.put_line('un nouveau sportif est ajouté');
END;
/

-------------verifivation------------

SET SERVEROUTPUT ON;
INSERT INTO Sportifss VALUES ('155', 'ACHACHI', 'Ali', 'M',22,10);


--Supp

CREATE OR REPLACE TRIGGER SuppSportif
AFTER DELETE 
ON Sportifss
FOR EACH ROW
BEGIN
	dbms_output.put_line('un nouveau sportif a été supprimé');

END;
/

-------------verifivation------------

SET SERVEROUTPUT ON;
DELETE FROM Sportifss where NOM='ACHACHI' and Prenom='Ali';

--Modif

CREATE OR REPLACE TRIGGER ModifSportif
AFTER UPDATE
ON Sportifss
FOR EACH ROW
BEGIN
	dbms_output.put_line('un nouveau sportif a été modifié');

END;
/

-------------verifivation------------

SET SERVEROUTPUT ON;
UPDATE Sportifss
SET Age = 88 WHERE IDSPORTIF = 130;


--------------------2----------------------


CREATE OR REPLACE TRIGGER AffichSeance
AFTER INSERT 
ON Seances
FOR EACH ROW
declare
nom varchar(30);
prenom varchar(30);
BEGIN
     select nom into nom from sportifss
     where IDSPORTIF = (:new.IDSPORTIFENTRAINEUR);
     select prenom into prenom from sportifss 
     where  idsportif= (:new.IDSPORTIFENTRAINEUR);
     dbms_output.put_line('une seance est ajouté a entraineur '|| nom ||' '||prenom);
END;
/

SET SERVEROUTPUT ON;
INSERT INTO Seances VALUES (40, 25, 17, 'Mardi',19,90);

-------------3------------------

CREATE OR REPLACE TRIGGER PasAge
BEFORE UPDATE
ON Sportifss
FOR EACH ROW
BEGIN
	IF (:new.age < :old.age) THEN
		raise_application_error (-20004, 'Pas ce age de sportif ') ;
	END IF;

END;
/


----------verification---------------------

SET SERVEROUTPUT ON;
UPDATE Sportifss
SET Age = 150 WHERE IDSPORTIF = 120;



----------------------4----------------------

------ (a) Ajouter les attributs et les inisialises----------

  ******* Totale_entrainer *********
ALTER TABLE SPORTS ADD ( Total_Entraineurs NUMBER(10) DEFAULT 0);


------ alimentation la nouvelle colonne ------------

declare 
cursor c is 
select s.idsport , s.LIBELLE , count(e.IDSPORTIFENTRAINEUR) as NB from entrainer e , sports s 
where s.idsport = e.idsport
group by s.idsport, s.LIBELLE;

begin 
for i in c loop 
update sports set Total_Entraineurs = i.NB 
where idsport = i.idsport
and LIBELLE = i.LIBELLE;
end loop;
end;
/



 ******* Totale_Arbitrer *********
ALTER TABLE SPORTS ADD ( Total_Arbitres NUMBER(10) DEFAULT 0);

------ alimentation la nouvelle colonne ------------

declare 
cursor c is 
select s.idsport , s.LIBELLE , count(a.IDSPORTIF) as NBS from Arbitrer a , sports s 
where s.idsport = a.idsport
group by s.idsport, s.LIBELLE;

begin 
for i in c loop 
update sports set Total_Arbitres = i.NBS
where idsport = i.idsport
and LIBELLE = i.LIBELLE;
end loop;
end;
/


------------ (b) verification l'insertion et la supression ---------
--- trigger arbitre--

CREATE OR REPLACE TRIGGER update_Total_Arbitres 
AFTER INSERT OR delete ON ARBITRER  
FOR EACH ROW 

DECLARE 
total integer;

BEGIN 
IF INSERTING THEN  
SELECT Total_Arbitres into total from sports where idsport =(:new.idsport);
total := total+1;
update sports set Total_Arbitres =total where idsport =(:new.idsport);
END IF;

IF DELETING THEN  
SELECT Total_Arbitres into total from sports where idsport =(:old.idsport);
total := total-1;
update sports set Total_Arbitres =total where idsport = (:old.idsport);
END IF;
END;
/


---- trigger entrainer------
CREATE OR REPLACE TRIGGER update_Total_Entraineurs 
AFTER INSERT OR delete ON ENTRAINER 
FOR EACH ROW 

DECLARE 
total integer;

BEGIN 
IF INSERTING THEN  
SELECT Total_Entraineurs into total from sports where idsport =(:new.idsport);
total := total+1;
update sports set Total_Entraineurs =total where idsport =(:new.idsport);
END IF;

IF DELETING THEN  
SELECT Total_Entraineurs into total from sports where idsport =(:old.idsport);
total := total-1;
update sports set Total_Entraineurs =total where idsport = (:old.idsport);
END IF;
END;
/


-------test l'insertion et la supression du entrainer et arbitre ---------------
--pour arbitre

insert into arbitrer values (127,8);
delete from arbitrer where idsport = 8;

--pour entrineur

insert into entrainer values (124,7);
delete from entrainer where idsport = 2;

----------------------------5------------------------------

a)création de tableau:
create table Historique_Seance_Par_Jour (Jour varchar(10),total_seance number);

----remplire le tableau:
declare
cursor cr is select jour from seances group by jour; 
a integer;
begin
for item in cr
loop
select count (*) into a from seances where jour = item.jour;
dbms_output.put_line('le nomber est: '||a||' pour lr jour: '||item.jour||'.');
insert into Historique_Seance_Par_Jour values(item.jour , a);
end loop;
end;
/

b)

CREATE OR REPLACE TRIGGER update_Total_Seances 
AFTER INSERT OR delete or update of jour ON seances 
FOR EACH ROW 

DECLARE 
total integer;

BEGIN 
IF INSERTING THEN  
SELECT total_seance into total from Historique_Seance_Par_Jour where jour =(:new.jour);
total := total+1;
update Historique_Seance_Par_Jour set total_seance =total where jour =(:new.jour);
END IF;

IF DELETING THEN  
SELECT total_seance into total from Historique_Seance_Par_Jour where jour =(:old.jour);
total := total-1;
update Historique_Seance_Par_Jour set total_seance =total where jour = (:old.jour);
END IF;

IF UPDATING THEN  
SELECT total_seance into total from Historique_Seance_Par_Jour where jour =(:old.jour);
total := total-1;
update Historique_Seance_Par_Jour set total_seance =total where jour = (:old.jour);

SELECT total_seance into total from Historique_Seance_Par_Jour where jour =(:new.jour);
total := total+1;
update Historique_Seance_Par_Jour set total_seance =total where jour = (:new.jour);
END IF;
END;
/


-----test---------

insert into seances values (27,7,7,'Mardi',10,90);



##############################################################################




****************** TP PLSQL***************************




SET SERVEROUTPUT ON;

declare
cursor cr is 
select * from sportifs where idsportif in (select IDSPORTIFCONSEILLER from sportifs);
a integer;      
begin
a := 0;
for item in cr
loop
a := a+1;
dbms_output.put_line('Nom:' ||' '||item.Nom||' ' || ' Prenom: ' ||' '||item.PRENOM|| ' est un conseilleur');
end loop;
dbms_output.put_line('Nombre des conseiller est:' || a );
exception
when NO_DATA_FOUND  then dbms_output.put_line('la base ne contient aucun demande ');
end;
/

------------------2---------------------

SET SERVEROUTPUT ON;

declare
cursor cr is 
select s.LIBELLE, count(g.IDGYMNASES) as nb_gymnases
from sports s , seances c, gymnases g
where c.IDGYMNASE = g.IDGYMNASEs
and s.IDSPORT = c.IDSPORT
group by s.LIBELLE;      
begin
for item in cr
loop
dbms_output.put_line('Le sport' ||' '||item.LIBELLE||' ' || 'est organiser par ' ||' '||item.nb_gymnases|| ' '|| 'gymnases');
end loop;
exception
when NO_DATA_FOUND  then dbms_output.put_line('Le sport pas organiser ');
when others then dbms_output.put_line('erreur '||sqlcode||sqlerrm);
end;
/

----------------3-------------------------
---ajouter contrainte---------
ALTER TABLE SPORTIFSS
ADD CONSTRAINT sprtage CHECK(AGE BETWEEN 20 AND 45);

-------desactiver contrainte--------
ALTER TABLE SPORTIFSS
DISABLE CONSTRAINT ct;

-----description des contraintes du table sportifss

select constraint_name, constraint_type, status from user_constraints where table_name = upper('sportifss');


--------creer procedure qui ajouter 5 ans a chaque age -----------

CREATE OR REPLACE PROCEDURE AUGMENT_AGE IS
CURSOR cr IS 
SELECT idsportif,nom,prenom,age from sportifss S;
BEGIN 
FOR item IN cr 
LOOP
UPDATE SPORTIFSS set AGE = AGE+5 WHERE idsportif = item.idsportif;
dbms_output.put_line('Le : '||' '||item.nom||' '||item.prenom|| ' son age passe de '|| (item.age -5 )||' '|| 'a '||item.age );
end loop; 
end;
/

--executer :
SET SERVEROUTPUT ON;
execute AUGMENT_AGE;


----------------------------------4---------------------------------

CREATE OR REPLACE PROCEDURE affichage(gym gymnases.NOMGYMNASES%TYPE) IS
premier float:=0;
dernier float:=24;

CURSOR cr IS 
select   distinct(jour) , horaire from seances s , gymnases g 
where s.idgymnase = g.idgymnases and NOMGYMNASES = gym
order by jour;

cursor crr is
select distinct(jour) from seances s , gymnases g 
where s.idgymnase = g.idgymnases  and NOMGYMNASES = gym
 order by jour;

BEGIN 
FOR item IN crr 
LOOP
 dbms_output.put_line('Pour le jour '|| item.jour ||': ');
 for items in cr
 loop
  IF ( items.jour = item.jour and items.horaire>premier) THEN
  premier := items.horaire;
  end if;
  
  IF ( items.jour = item.jour and items.horaire<dernier) THEN
  dernier := items.horaire;
  end if;
 end loop;
dbms_output.put_line('  debut a : '||  dernier||'.');
dbms_output.put_line('  fin a : '|| premier||'.');

premier:=0;
dernier:=24;
END LOOP;
END affichage;
/

----on va prend le gymnase Five Gym Club comme exemple ----------------

SET SERVEROUTPUT ON;
execute affichage('Five Gym Club');

-----------------5-----------------------------

create or replace function nb_Sport (ref_sportif entrainer.IDSPORTIFENTRAINEUR%type) return int IS
total_sport integer;
BEGIN
select count(idsport) into total_sport from entrainer where IDSPORTIFENTRAINEUR= ref_sportif;
return total_sport;
end nb_Sport;
/


declare
cursor cr is select distinct  s.idsportif , s.nom, s.prenom from sportifs s,entrainer e  
where s.idsportif= e.IDSPORTIFENTRAINEUR
group by s.idsportif , s.nom, s.prenom  ;
begin
for item in cr
loop 
dbms_output.put_line('Le sportif  ' ||item.nom ||' ' || item.prenom ||' a entainer  '|| nb_Sport(item.idsportif) ||'  sports ');
end loop;
EXCEPTION     
WHEN no_data_found THEN dbms_output.put_line('La base de données ne contient aucun entraineur');
when others  then dbms_output.put_line('Erreur: '|| sqlcode||' '||sqlerrm);
close cr;
end;
/

--------------------6--------------------------

create or replace procedure Ajout_Seance( IDGYMNASES_ in seances.IDGYMNASE%type, IDSPORT_ in seances.IDSPORT%type,  
IDSPORTIFENTRAINEUR_ in seances.IDSPORTIFENTRAINEUR%type, JOUR_ in seances.JOUR%type, HORAIRE_ in seances.HORAIRE%type, DUREE_ in seances.DUREE%type) is   
	    erreur  boolean:= false;
		id_gymnases seances.IDGYMNASE%type;
		id_sport seances.IDSPORT%type;
		ID_SPORTIFENTRAINEUR seances.IDSPORTIFENTRAINEUR%type;

		
BEGIN

     DECLARE
        idgymnases_null EXCEPTION;
       BEGIN
         if(IDGYMNASES_ is NULL) then RAISE idgymnases_null;
         else
         select IDGYMNASES into id_gymnases from gymnases where IDGYMNASES=IDGYMNASES_;
         end if;
       EXCEPTION
        WHEN idgymnases_null then  DBMS_OUTPUT.PUT_LINE('error  le numéro de gymnase est obligatoire'); erreur:=true;
        WHEN NO_DATA_FOUND then DBMS_OUTPUT.PUT_LINE('error  le numéro de gymnase existe pas'); erreur:=true;     
       END;


       DECLARE
        idsport_null EXCEPTION;
        BEGIN
         if(idsport_ is NULL) then RAISE idsport_null;
         else
         select IDSPORT into id_sport from sports where idsport=idsport_;
         end if;
       EXCEPTION
        WHEN idsport_null then  DBMS_OUTPUT.PUT_LINE('error : le id sport est obligatoire'); erreur:=true;
        WHEN NO_DATA_FOUND then DBMS_OUTPUT.PUT_LINE('erreur : le id sport existe pas'); erreur:=true;
       END;	 


     DECLARE
        IDSPORTIFENTRAINEUR_null EXCEPTION;
        BEGIN
         if(IDSPORTIFENTRAINEUR_ is NULL) then RAISE IDSPORTIFENTRAINEUR_null;
         else
         select IDSPORTIFENTRAINEUR into ID_SPORTIFENTRAINEUR from entrainer where IDSPORTIFENTRAINEUR=IDSPORTIFENTRAINEUR_;
         end if;
       EXCEPTION
        WHEN IDSPORTIFENTRAINEUR_null then  DBMS_OUTPUT.PUT_LINE('error  le numéro IDSPORTIFENTRAINEUR est obligatoire'); erreur:=true;
        WHEN NO_DATA_FOUND then DBMS_OUTPUT.PUT_LINE(' erreur  le numéro IDSPORTIFENTRAINEUR existe pas'); erreur:=true;
       END;	 


     DECLARE
        jour_null EXCEPTION;
        BEGIN
         if(jour_ is NULL) then RAISE jour_null;
         end if;
       EXCEPTION
        WHEN jour_null then  DBMS_OUTPUT.PUT_LINE('error  le jour est obligatoire'); erreur:=true;
        END;	


     DECLARE
        horaire_null EXCEPTION;
        BEGIN
         if(horaire_ is NULL) then RAISE horaire_null;
         end if;
       EXCEPTION
        WHEN horaire_null then  DBMS_OUTPUT.PUT_LINE('error horaire est obligatoire'); erreur:=true;
        END;


     DECLARE
        duree_null EXCEPTION;
        BEGIN
         if(duree_ is NULL) then RAISE duree_null;
         end if;
       EXCEPTION
        WHEN duree_null then  DBMS_OUTPUT.PUT_LINE('error  la duree est obligatoire'); erreur:=true;
        END;


if (erreur=false) then
	       insert into seances values (IDGYMNASES_ , idsport_ , IDSPORTIFENTRAINEUR_ , jour_ , horaire_ , duree_);
	       DBMS_OUTPUT.PUT_LINE('la seance est bien ajoutée');
	   end if;      
    EXCEPTION
       WHEN OTHERS then  DBMS_OUTPUT.PUT_LINE('error : '||sqlcode||' '||sqlerrm);  	   
END Ajout_Seance;
/

SET SERVEROUTPUT ON;
execute Ajout_Seance(1,1,1,'Mardi',10,15);



