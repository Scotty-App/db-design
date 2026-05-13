CREATE DATABASE BD_ScottyApp
USE BD_ScottyApp

CREATE TABLE [USER] (
idUser int IDENTITY PRIMARY KEY
, name varchar(50) NOT NULL
, email varchar(100) UNIQUE NOT NULL 
, password varchar(100) NOT NULL
, role varchar(13) NOT NULL DEFAULT 'ALUMNI'
, address varchar(200)
, phone char(9)
, CHECK (email LIKE '_%@_%._%')
, CHECK (role IN ('ALUMNI', 'ADMINISTRATOR'))
, CHECK (phone IS NULL OR phone LIKE ('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
)

CREATE TABLE [PRODUCT] (
idProduct tinyint IDENTITY PRIMARY KEY
, name varchar(50) NOT NULL
, description varchar(200) NULL
, price smallmoney NOT NULL
, stock smallint NOT NULL DEFAULT 0
, category varchar(20) NOT NULL
, CHECK (price > 0)
, CHECK (stock >= 0)
, CHECK (category IN ('Hardware', 'Peripherals', 'Gaming', 'Storage', 'Accessories', 'Merchandising'))
)

CREATE TABLE [ORDER] (
idOrder int IDENTITY PRIMARY KEY
, date date NOT NULL DEFAULT GETDATE()
, total smallmoney NOT NULL DEFAULT 0
, status varchar(9) NOT NULL DEFAULT 'PENDING'
, idUser int NOT NULL
, CHECK (status IN ('PENDING', 'PROCESSED', 'CANCELLED'))
, CHECK (total >= 0)
, FOREIGN KEY (idUser) REFERENCES [USER] (idUser)
)

CREATE TABLE ORDER_DETAILS (
idDetail int IDENTITY PRIMARY KEY
, quantity tinyint NOT NULL
, subtotal smallmoney NOT NULL
, idOrder int NOT NULL
, idProduct tinyint NOT NULL
, CHECK (quantity > 0)
, CHECK (subtotal > 0)
, FOREIGN KEY (idOrder) REFERENCES [ORDER] (idOrder)
, FOREIGN KEY (idProduct) REFERENCES [PRODUCT] (idProduct)
)
