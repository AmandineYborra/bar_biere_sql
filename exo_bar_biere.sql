DROP DATABASE IF EXISTS bar_biere;
CREATE DATABASE IF NOT EXISTS bar_biere;
USE bar_biere;

-- Création des tables

CREATE TABLE IF NOT EXISTS Bar (
  idBar INT,
  nom VARCHAR(50),
  CONSTRAINT pk_bar PRIMARY KEY (idBar)
);

CREATE TABLE IF NOT EXISTS Personne (
  idPersonne INT,
  nom VARCHAR(50),
  prenom VARCHAR(50),
  CONSTRAINT pk_personne PRIMARY KEY (idPersonne)
);

CREATE TABLE IF NOT EXISTS Biere (
  idBiere INT,
  nom VARCHAR(50),
  CONSTRAINT pk_biere PRIMARY KEY (idBiere)
);

CREATE TABLE IF NOT EXISTS Frequente (
  personne INT,
  bar INT
);

CREATE TABLE IF NOT EXISTS Sert (
  bar INT,
  biere INT
);

CREATE TABLE IF NOT EXISTS Aime (
  personne INT,
  biere INT
);

CREATE TABLE IF NOT EXISTS Vente (
  bar INT,
  biere INT,
  montant INT
);

ALTER TABLE Frequente
ADD CONSTRAINT fk_frequente_personne FOREIGN KEY (personne) REFERENCES Personne(idPersonne);

ALTER TABLE Frequente
ADD CONSTRAINT fk_frequente_bar FOREIGN KEY (bar) REFERENCES Bar(idBar);

ALTER TABLE Sert
ADD CONSTRAINT fk_sert_bar FOREIGN KEY (bar) REFERENCES Bar(idBar);

ALTER TABLE Sert
ADD CONSTRAINT fk_sert_biere FOREIGN KEY (biere) REFERENCES Biere(idBiere);

ALTER TABLE Aime
ADD CONSTRAINT fk_aime_personne FOREIGN KEY (personne) REFERENCES Personne(idPersonne);

ALTER TABLE Aime
ADD CONSTRAINT fk_aime_biere FOREIGN KEY (biere) REFERENCES Biere(idBiere);

ALTER TABLE Vente
ADD CONSTRAINT fk_vente_bar FOREIGN KEY (bar) REFERENCES Bar(idBar);

ALTER TABLE Vente
ADD CONSTRAINT fk_vente_biere FOREIGN KEY (biere) REFERENCES Biere(idBiere);

-- Importation des données

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/db_bar_biere/db_bar.csv' 
INTO TABLE Bar
FIELDS TERMINATED BY ';' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/db_bar_biere/db_personne.csv' 
INTO TABLE Personne
FIELDS TERMINATED BY ';' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/db_bar_biere/db_biere.csv' 
INTO TABLE Biere
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/db_bar_biere/db_frequente.csv' 
INTO TABLE Frequente
FIELDS TERMINATED BY ';' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/db_bar_biere/db_sert.csv' 
INTO TABLE Sert
FIELDS TERMINATED BY ';' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/db_bar_biere/db_vente.csv' 
INTO TABLE Vente
FIELDS TERMINATED BY ';' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/db_bar_biere/db_aime.csv' 
INTO TABLE Aime
FIELDS TERMINATED BY ';' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Quetions

-- Question a
SELECT p.nom, p.prenom, b.nom 
FROM frequente AS f
INNER JOIN personne AS p ON f.personne = p.idPersonne
INNER jOIN bar as b ON f.bar = b.idBar
WHERE  p.nom = 'Dupont';

-- Question 2
SELECT bar.nom, bi.nom, p.nom, p.prenom
FROM sert AS s, bar, biere AS bi
INNER JOIN aime AS a ON s.biere = a.biere
INNER JOIN personne AS p ON a.personne = p.idPersonne
WHERE  p.nom = 'Dupont';

-- Question 3

-- Question 4

-- Question 5

-- Question 6

-- Question 7

-- Question 8 

-- Question 9
