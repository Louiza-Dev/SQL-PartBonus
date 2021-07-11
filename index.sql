-- Tous les exos se baseront sur la base de données france.sql fourni.
SOURCE france.sql;
-- Exo 1
-- Afficher tout le contenu de la table régions.
SELECT * FROM regions;

-- Exo 2
-- Afficher tous les départements de France par ordre alphabétique.
SELECT nom_dep FROM departements ORDER BY nom_dep DESC;

-- Exo 3
-- Afficher toutes les villes ayant comme département le 60 en ordonnant avec le code postal.
DESCRIBE villes;
SELECT cp, ville FROM villes WHERE dep = '60' ORDER BY cp;
SELECT cp, dep FROM villes WHERE (cp LIKE '60%') != (dep = '60');
SELECT COUNT(`ville`) FROM villes WHERE dep LIKE '60%';

-- Exo 4
-- Afficher les 3 premières villes ayant comme code postal "60400" et en ordonnant par ordre alphabétique.
SELECT cp, ville FROM villes WHERE cp = '60400' ORDER BY ville LIMIT 5;

-- Exo 5
-- Afficher toutes les villes contenant le mot "saint".
SELECT ville FROM villes WHERE ville LIKE '%saint%' ORDER BY ville LIMIT 20;
SELECT COUNT(`ville`) FROM villes WHERE ville LIKE '%saint%';

-- Exo 6
-- Afficher le nombre de villes par département. (Le nom des départements doit aparaitre)
SELECT nom_dep, COUNT(`ville`), SUM(COUNT(`ville`)) FROM villes LEFT JOIN departements
ON villes.dep = departements.dep GROUP BY nom_dep ORDER BY nom_dep;

SELECT COUNT(`ville`) FROM villes ;

-- Exo 7
-- Afficher les villes ayant comme région "Picardie".
SELECT ville FROM villes WHERE region = 'Picardie';
SELECT COUNT(`ville`) FROM villes WHERE nom_region = 'Picardie';
SELECT nom_region, COUNT(`ville`) FROM villes LEFT JOIN regions
ON villes.region = regions.region GROUP BY nom_region;

SELECT nom_region, ville FROM villes LEFT JOIN regions
ON villes.region = regions.region WHERE nom_region = 'Picardie';

SELECT nom_region, ville FROM villes LEFT JOIN regions ON villes.region = regions.region
WHERE nom_region = 'Picardie';


-- Exo 8
-- Afficher le nombre de villes par département et par région. (Le nom des départements et des
--régions doivent aparaitre).
SELECT nom_region, COUNT(`ville`) FROM villes JOIN regions
ON villes.region = regions.region GROUP BY nom_region;


SELECT nom_dep, COUNT(`ville`), (SELECT nom_region, COUNT(`ville`) FROM villes JOIN regions
ON villes.region = regions.region GROUP BY nom_region;) FROM villes JOIN departements
ON villes.dep =  departements.dep GROUP BY nom_dep;


SELECT nom_dep, COUNT(`ville`) FROM villes LEFT JOIN departements
ON villes.dep =  departements.dep GROUP BY nom_dep;
SELECT nom_region, COUNT(`ville`) FROM villes LEFT JOIN regions
ON villes.region =  regions.region GROUP BY nom_region;


SELECT nom_dep, COUNT(`ville`), nom_region, COUNT(`ville`) FROM villes LEFT JOIN departements
ON villes.dep =  departements.dep GROUP BY nom_dep LEFT JOIN regions
ON villes.region =  regions.region GROUP BY nom_region;


SELECT COUNT(`ville`), nom_dep, nom_region, COUNT(`ville`) FROM departements RIGHT JOIN villes
ON villes.dep =  departements.dep GROUP BY nom_dep JOIN regions
ON villes.region =  regions.region GROUP BY nom_region;
