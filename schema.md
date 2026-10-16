# Schéma relationnel - GARGOTE RADO

## Notions

- **Clé primaire** : attribut écrit en gras.
- Clé étrangère : attribut précédé d'un dièse (`#`).
- Attribut  : facultatif

---

## Tables

### Plat

- **id_plat** 
- `libelle` 
- `prix` 

### Pièges

- `prix` : `INT`
- `id_plat` : `INT GENERATED ALWAYS AS IDENTITY`

