
CREATE TABLE categorie (
    id_categorie INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    libelle VARCHAR(50) NOT NULL
);

INSERT INTO categorie (libelle) VALUES
    ('Plat malagasy'),
    ('Plat chinois'),
    ('Soupe'),
    ('Dessert et gouter'),
    ('Boisson');


ALTER TABLE plat
ADD COLUMN id_categorie INT;


UPDATE plat
SET id_categorie = (
    SELECT id_categorie
    FROM categorie
    WHERE libelle = 'Plat malagasy'
)
WHERE libelle IN ('Romazava', 'Ravitoto sy henakisoa');

UPDATE plat
SET id_categorie = (
    SELECT id_categorie
    FROM categorie
    WHERE libelle = 'Plat chinois'
)
WHERE libelle IN ('Mi Sao');

UPDATE plat
SET id_categorie = (
    SELECT id_categorie
    FROM categorie
    WHERE libelle = 'Soupe'
)
WHERE libelle IN ('Soupe chinoise');

UPDATE plat
SET id_categorie = (
    SELECT id_categorie
    FROM categorie
    WHERE libelle = 'Dessert et gouter'
)
WHERE libelle IN ('Mofo gasy');

UPDATE plat
SET id_categorie = (
    SELECT id_categorie
    FROM categorie
    WHERE libelle = 'Boisson'
)
WHERE libelle IN ('Ranon''ampango');


SELECT * FROM plat WHERE id_categorie IS NULL;


ALTER TABLE plat
ADD CONSTRAINT fk_plat_categorie
FOREIGN KEY (id_categorie)
REFERENCES categorie(id_categorie);


ALTER TABLE plat
ALTER COLUMN id_categorie SET NOT NULL;
