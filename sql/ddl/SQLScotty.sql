CREATE DATABASE ScottyApp
USE ScottyApp

CREATE TABLE [USER] (
IdUser int PRIMARY KEY IDENTITY(1,1),
Name varchar(30) NOT NULL,
Alias varchar(20) NOT NULL,
Email varchar(50) NOT NULL,
Password varchar(18) NOT NULL,
Date_Conexion datetime NOT NULL,
State_Session varchar(8) NOT NULL DEFAULT 'disabled',
CONSTRAINT chk_email CHECK (Email LIKE '_%@_%._%'),
CONSTRAINT chk_session CHECK (State_Session IN ('enabled','disabled'))
)

CREATE TABLE STUDENT (
IdUser int NOT NULL,
Token smallint NOT NULL DEFAULT 0,
XPPoint int NOT NULL DEFAULT 0,
PRIMARY KEY (IdUser),
FOREIGN KEY (IdUser) REFERENCES [USER](IdUser)
)

CREATE TABLE ADMINISTRATION (
IdUser int NOT NULL,
PRIMARY KEY (IdUser),
FOREIGN KEY (IdUser) REFERENCES [USER](IdUser)
)

CREATE TABLE GAMES (
IdGames int PRIMARY KEY IDENTITY(1,1),
Tittel varchar(30) NOT NULL,
Lenguaje varchar(10) NOT NULL,
Created_Date date NOT NULL DEFAULT GETDATE(),
State bit NOT NULL DEFAULT 1,
Description varchar(200) NULL,
Num_Level smallint NOT NULL,
CONSTRAINT chk_lenguaje CHECK (Lenguaje IN ('Java','JavaScript','SQL','HTML','CSS'))
)

CREATE TABLE LEVEL (
IdGames int NOT NULL,
Num_Level smallint NOT NULL,
Tittel varchar(30) NOT NULL,
XPLevel smallint NOT NULL,
Solution varchar(500) NOT NULL,
PRIMARY KEY (IdGames,Num_Level),
FOREIGN KEY (IdGames) REFERENCES GAMES(IdGames)
)

CREATE TABLE CANJE (
IdCanje int PRIMARY KEY IDENTITY(1,1),
Name varchar(30) NOT NULL,
Type varchar(20) NOT NULL,
Status varchar(11) NOT NULL DEFAULT 'pending',
Date_Canje date NOT NULL DEFAULT GETDATE(),
Cost_Token smallint NOT NULL,
IdUser int NOT NULL,
CONSTRAINT chk_status CHECK (Status IN ('pending','accepted','rejected')),
CONSTRAINT chk_type CHECK (Type IN ('discount','merchandise','other')),
FOREIGN KEY (IdUser) REFERENCES STUDENT(IdUser)
)

CREATE TABLE ADMIN_CANJE_VALID (
IdUser int NOT NULL,
IdCanje int NOT NULL,
Approved bit NOT NULL,
Rejection_Reason varchar(150) NULL,
Date_Validation date NOT NULL DEFAULT GETDATE(),
PRIMARY KEY (IdUser,IdCanje),
FOREIGN KEY (IdUser) REFERENCES ADMINISTRATION(IdUser),
FOREIGN KEY (IdCanje) REFERENCES CANJE(IdCanje)
)

CREATE TABLE STUD_LEVEL_PLAY (
IdUser int NOT NULL,
IdGames int NOT NULL,
Num_Level smallint NOT NULL,
XP smallint NOT NULL DEFAULT 0,
State varchar(11) NOT NULL DEFAULT 'BLOQUEADO',
Date date NOT NULL DEFAULT GETDATE(),
PRIMARY KEY (IdUser,IdGames,Num_Level),
FOREIGN KEY (IdUser) REFERENCES STUDENT(IdUser),
FOREIGN KEY (IdGames,Num_Level) REFERENCES LEVEL(IdGames,Num_Level),
CONSTRAINT chk_state CHECK (State IN ('BLOQUEADO','EN_PROGRESO','COMPLETADO'))
)