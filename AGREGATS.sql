## NOMBRE DE LIGNES D’UNE TABLE

SELECT COUNT(*) 
    FROM Client; #Calcule le nombre de clients contenus dans la BDD


## NOMBRE DE VALEURS D’UN ATTRIBUT

SELECT COUNT(CodeCli) 
    FROM Client;      #en spécifiant un attribut, on compte le nombre de lignes avec une valeur dans cet attribut.


## NOMBRE DE VALEURS DISTINCTES D’UN ATTRIBUT

SELECT COUNT(DISTINCT Pays) 
    FROM Client;       
#affiche le nombre de valeurs distinctes de l'attribut Pays
#Cette requête a le même résultat que la suivante:

SELECT DISTINCT Pays
    FROM Client;


## RESTRICTION DANS LE DENOMBREMENT

SELECT COUNT(*) 
    FROM Client
    WHERE Pays = "France"; #affiche le nombre de clients français de la BDD


## SOMME

SELECT SUM(UnitesStock)
    FROM Produit;
#permet de faire la somme des valeurs non nulles de l'attribut passé en paramètre


SELECT SUM(UnitesStock)
    FROM Produit
    WHERE CodeCateg = 1;


## MOYENNE & MEDIANE

SELECT AVG(PrixUnit)
    FROM Produit;    #Calcule le prix unitaire moyen des produits


SELECT ROUND(AVG(PrixUnit), 2)
    FROM Produit;       #Calcul arrondi à 2 décimales


SELECT MEDIAN(PrixUnit)
    FROM Produit;


## MINIMUM & MAXIMUM

SELECT MIN(PrixUnit), MAX(PrixUnit)
    FROM Produit
#Calcule le minimum et le maximum sans tenir compte des valeurs nulles


## AGREGAT SIMPLE

SELECT Pays, COUNT(*)
    FROM Client
    GROUP BY Pays;
    
    
#affiche le nombre de client en fonction du pays (critère d'agrégation)

SELECT Pays, COUNT(*) AS "Nb clients"
    FROM Client
    GROUP BY Pays
    ORDER BY 2 DESC; 


## COMBINAISON D’AGREGATS

SELECT NoFour, 
        COUNT(*) AS "Nb produits",
        ROUND(AVG(PrixUnit)) AS "Prix moyen",
        MIN(PrixUnit) as "Prix minimum",
        MAX(PrixUnit) as "Prix maximum"
    FROM Produit
    GROUP BY NoFour;


## AGREGAT COMPLEXE

SELECT NoFour, CodeCateg, COUNT(*)
    FROM Produit
    GROUP By NoFour, CodeCateg;


## RESTRICTION SUR AGREGATS

SELECT Pays, COUNT(*) 
    FROM Client
    GROUP BY Pays
    HAVING COUNT(*) >= 10;
    
    
#Affiche le nombre de clients par pays, uniquement pour les pays avec plus de 10 clients.

SELECT Pays, COUNT(*) AS Nb
    FROM Client
    GROUP BY Pays
    HAVING Nb >= 10;


## RAPPEL ORDRE DES CLAUSES

SELECT attributs, calculs, agrégats
    FROM tables
    WHERE conditions
    GROUP BY attributs
    HAVING conditions
    ORDER BY attributs
    LIMIT nombre;