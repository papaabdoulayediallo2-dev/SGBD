CREATE DATABASE gestion_voyageur 
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

use gestion_voyageur;

CREATE TABLE voyageurs(
    id_voyageur INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    date_naissance DATE NOT NULL,
    adresse VARCHAR(50) NOT null
);

CREATE TABLE voyages(
    id_voyage INT PRIMARY KEY AUTO_INCREMENT,
    destination VARCHAR(50) NOT NULL,
    date_depart DATE NOT NULL,
    date_retour DATE
);

CREATE TABLE reservations(
    id_reservation INT PRIMARY KEY AUTO_INCREMENT,
    id_voyageur INT,
    id_voyage INT,
    FOREIGN KEY (id_voyageur) REFERENCES voyageurs(id_voyageur),
    FOREIGN KEY (id_voyage) REFERENCES voyages(id_voyage)
);

CREATE TABLE hotels(
    id_hotel INT PRIMARY KEY AUTO_INCREMENT,
    nom_hotel VARCHAR(50) NOT NULL,
    adresse_hotel VARCHAR(50) NOT null
);

CREATE TABLE chambres(
    id_chambre INT PRIMARY KEY AUTO_INCREMENT,
    id_hotel INT,
    FOREIGN KEY (id_hotel) REFERENCES hotels(id_hotel),
    type_chambre VARCHAR(50) NOT null,
    prix_nuit INT NOT null
);

INSERT INTO voyageurs (id_voyageur, nom , prenom, date_naissance, adresse) VALUES 
        ('1', 'Kane', 'Abdou', '1990-04-15', 'Dakar'),
        ('2', 'Ndiaye', 'Fatou', '1985-09-22', 'Thiès'),
        ('3', 'Sarr', 'Moussa', '1992-12-05', 'Saint-Louis'),
        ('4', 'Diop', 'Awa', '1988-03-30', 'Kaolack'),
        ('5', 'Fall', 'Oumar', '1995-07-18', 'Ziguinchor'),
        ('6', 'Gueye', 'Aminata', '1991-11-10', 'Louga'),
        ('7', 'Diallo', 'Mamadou', '1987-05-25', 'Matam'),
        ('8', 'Ba', 'Coumba', '1993-08-12', 'Kolda'),
        ('9', 'Sow', 'Cheikh', '1989-02-20', 'Tambacounda'),
        ('10', 'Thiam', 'Adama', '1994-06-05', 'Fatick');


INSERT INTO voyages (id_voyage ,destination , date_depart , date_retour) VALUES 
        ('1', ' Brésil', ' 2024-07-10', '2024-07-25'),
        ('2', 'Espagne', ' 2024-08-01', ' 2024-08-15'),
        ('3', 'Italie', ' 2024-09-05', ' 2024-09-20'),
        ('4', 'Japon', ' 2024-10-10', ' 2024-10-25'),
        ('5', 'Australie', ' 2024-11-01', ' 2024-11-15'),
        ('6', 'Maroc', ' 2024-12-05', ' 2024-12-20'),
        ('7', 'Grèce', ' 2025-01-10', ' 2025-01-25'),
        ('8', 'Turquie', ' 2025-02-01', ' 2025-02-15'),
        ('9', 'Thaïlande', ' 2025-03-05', ' 2025-03-20'),
        ('10', 'Égypte', ' 2025-04-10', ' 2025-04-25');

INSERT INTO reservations(id_reservation, id_voyageur, id_voyage) VALUES 
        (1,1,1),
        (2,2,2),
        (3,3,3),
        (4,4,4),
        (5,5,5),
        (6,6,6),
        (7,7,7),
        (8,8,8),
        (9,9,9),
        (10,10,10);
INSERT INTO hotels(id_hotel, nom_hotel, adresse_hotel) VALUES 
        (1,'Radisson','Dakar'),
        (2,'Saly Club','Mbour'),
        (3,'Fatick','fimla'),
        (4,'Kaolack','thies'),
        (5,'Ziguinchor','fouta'),
        (6,'Louga','Touba'),
        (7,'Matam','Louga'),
        (8,'Kolda','Kaolack'),
        (9,'Tambacounda','Dakar'),
        (10,'Fatick','Saint-Louis');

INSERT INTO chambres(id_chambre, id_hotel, type_chambre, prix_nuit) VALUES 
        (1,1,'Suite',150),
        (2,2,' Standard',80),
        (3,3,'Deluxe',120),
        (4,4,'Standard',90),
        (5,5,'Suite',200),
        (6,6,'Deluxe',110),
        (7,7,'Standard',70),
        (8,8,'Suite',180),
        (9,9,'Deluxe',130),
        (10,10,'Standard',85);

    alter table voyageurs ADD id_hotel INT;
    alter table voyageurs ADD CONSTRAINT voyageurs_ibfk_1 FOREIGN KEY (id_hotel) REFERENCES hotels(id_hotel);
--1. Quels sont les noms et prénoms des voyageurs ayant réservé un voyage ?
select v.nom, v.prenom from voyageurs v join reservations r on v.id_voyageur = r.id_voyageur;
--2  Quelles sont les destinations des voyages réservés par le voyageur numéro 1 ?
SELECT v.destination 
FROM voyages v join reservations r 
on v.id_voyage = r.id_voyage join voyageurs vo 
on r.id_voyageur = vo.id_voyageur
where vo.id_voyageur=1;

--Quels sont les hôtels proposant des chambres à moins de 100$ par nuit ?

SELECT h.nom_hotel 
FROM hotels h join chambres C 
ON h.id_hotel=c.id_hotel 
WHERE c.prix_nuit < 100 ;

