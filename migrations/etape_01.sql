CREATE DATABASE gargotte;

CREATE TABLE plat (
    id_plat INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    libelle VARCHAR(50) NOT NULL,
    prix INT NOT NULL
);


INSERT INTO plat (libelle, prix) VALUES
    ('Romazava', 7000),
    ('Ravitoto sy henakisoa', 8000),
    ('Akoho sy voanio', 8500),
    ('Mi Sao', 6000),
    ('Soupe chinoise', 5000),
    ('Mofo gasy', 1000),
    ('Ranon''ampango', 500);

SELECT * FROM plat ORDER BY prix DESC;


