CREATE TABLE commande (
    id_commande INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    date_commande TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE detail_commande (
    id_commande INT NOT NULL,
    id_plat INT NOT NULL,
    quantite INT NOT NULL CHECK (quantite > 0),

    PRIMARY KEY (id_commande, id_plat),

    FOREIGN KEY (id_commande)
        REFERENCES commande(id_commande),

    FOREIGN KEY (id_plat)
        REFERENCES plat(id_plat)
);

INSERT INTO commande DEFAULT VALUES;
INSERT INTO commande DEFAULT VALUES;

INSERT INTO detail_commande (id_commande, id_plat, quantite)
VALUES
    (1, 1, 2),
    (1, 3, 1),
    (1, 6, 3);

INSERT INTO detail_commande (id_commande, id_plat, quantite)
VALUES
    (2, 2, 1),
    (2, 4, 2);

SELECT
    c.id_commande,
    c.date_commande,
    SUM(d.quantite * p.prix) AS montant_total
FROM commande c
JOIN detail_commande d
    ON c.id_commande = d.id_commande
JOIN plat p
    ON d.id_plat = p.id_plat
GROUP BY c.id_commande, c.date_commande
ORDER BY c.id_commande;
