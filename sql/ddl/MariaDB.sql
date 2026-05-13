CREATE DATABASE BD_ScottyApp;
USE BD_ScottyApp;

CREATE TABLE `USER` (
idUser int AUTO_INCREMENT PRIMARY KEY
, name varchar(50) NOT NULL
, email varchar(100) UNIQUE NOT NULL
, password varchar(100) NOT NULL
, role varchar(13) NOT NULL DEFAULT 'ALUMNI'
, address varchar(200)
, phone char(9)
, CHECK (email LIKE '%@%.%')
, CHECK (role IN ('ALUMNI', 'ADMINISTRATOR'))
, CHECK (phone IS NULL OR phone REGEXP '^[0-9]{9}$')
);

CREATE TABLE `PRODUCT` (
idProduct tinyint UNSIGNED AUTO_INCREMENT PRIMARY KEY
, name varchar(50) NOT NULL
, description varchar(200) NULL
, price DECIMAL(10,2) NOT NULL
, stock smallint NOT NULL DEFAULT 0
, category varchar(20) NOT NULL
, CHECK (price > 0)
, CHECK (stock >= 0)
, CHECK (category IN ('Hardware', 'Peripherals', 'Gaming', 'Storage', 'Accessories', 'Merchandising'))
);

CREATE TABLE `ORDER` (
idOrder int AUTO_INCREMENT PRIMARY KEY
, date date NOT NULL DEFAULT (CURRENT_DATE)
, total DECIMAL(10,2) NOT NULL DEFAULT 0
, status varchar(9) NOT NULL DEFAULT 'PENDING'
, idUser int NOT NULL
, CHECK (status IN ('PENDING', 'PROCESSED', 'CANCELLED'))
, CHECK (total >= 0)
, FOREIGN KEY (idUser) REFERENCES `USER` (idUser)
);

CREATE TABLE ORDER_DETAILS (
idDetail int AUTO_INCREMENT PRIMARY KEY
, quantity tinyint NOT NULL
, subtotal DECIMAL(10,2) NOT NULL
, idOrder int NOT NULL
, idProduct tinyint UNSIGNED NOT NULL
, CHECK (quantity > 0)
, CHECK (subtotal > 0)
, FOREIGN KEY (idOrder) REFERENCES `ORDER` (idOrder)
, FOREIGN KEY (idProduct) REFERENCES `PRODUCT` (idProduct)
);
