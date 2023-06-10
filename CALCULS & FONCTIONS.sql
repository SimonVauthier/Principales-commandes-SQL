## CALCUL SIMPLE

SELECT *, UnitesStock + UnitesCom
    FROM Produit;


SELECT RefProd, UnitesStock + UnitesCom
    FROM Produit;


## RENOMMAGE

SELECT RefProd AS Reference, 
        UnitesStock + UnitesCom AS "Unités disponibles"
    FROM Produit;


SELECT RefProd, 
        PrixUnit * UnitesStock AS "Montant en stock"
    FROM Produit;             #le montatn en stock pour chaque produit est égall au prix unitaire multiplié par la quantité de produits en stock


## COMBINAISON DE CLAUSES

SELECT RefProd, 
        PrixUnit * UnitesStock AS "Montant en stock indisponible"
    FROM Produit
    WHERE Indisponible = 1;


SELECT RefProd, 
        PrixUnit * UnitesStock AS "Montant en stock"
    FROM Produit
    WHERE Indisponible = 1
    ORDER BY 2 DESC
    LIMIT 3;            #affiche les 3 produits indisponibles avec le plus haut montant en stock


## CALCUL COMPLEXE

SELECT RefProd, 
        PrixUnit * (UnitesStock - 10)
    FROM Produit
    WHERE UnitesStock >= 10;           #calcule le montant en stock directement disponible, en tenant en compte de la contrainte précédente


## ARRONDI

SELECT RefProd, 
        ROUND(PrixUnit * 1.05) AS "Nouveau Prix"
    FROM Produit;             #calcule d'une augmentation de 5% des prix des produits


SELECT RefProd, 
        ROUND(PrixUnit * 1.05, 2) AS "Nouveau Prix"
    FROM Produit;     #même calcul avec un arrondi à 2 décimales


## CONCATENATION

SELECT NoEmp, Nom || Prenom
    FROM Employe;     #affiche le nom et le prénom dans une seule chaîne


SELECT NoEmp, Nom || " " || Prenom
    FROM Employe;         #affiche le nom et le prénom séparés par un espace grâce à ||" "||


## EXTRACTION D’UNE SOUS-CHAÎNE

SELECT NoEmp, Nom || " " || SUBSTR(Prenom, 1, 1)
    FROM Employe;    
 #extraie l'initiale du prénom
#commande SUBSTR(chaine, debut, longueur)


SELECT NoEmp, Nom || " " || SUBSTR(Prenom, 1, 1) || "."
    FROM Employe;    #l'ajout du "." dans la requête indique que c'est une initiale


## MAJUSCULE/MINUSCULE

SELECT NoEmp, UPPER(Nom) || " " || SUBSTR(Prenom, 1, 1) || "."
    FROM Employe;


## LONGUEUR DE LA CHAÎNE

SELECT NoEmp, Nom, LENGTH(Nom)
    FROM Employe; #la commande LENGTH(chaîne) renvoit la longueur de la chaîne (nombre de caractères y compris les espaces)


## MODIFICATION D’UNE SOUS-CHAÎNE

SELECT Nom, Prenom, Fonction,
        REPLACE(Fonction, "Chef", "Responsable")
    FROM Employe;     
#La commande REPLACE(chaîne, sc1, sc2) permet de remplacer la sous-chaîne sc1 par la sous-chaîne sc2 dans la chaîne de caractères passée en premier paramètre.


## RECHERCHE D’UNE SOUS-CHAÎNE

SELECT Nom, Adresse,
        INSTR(Adresse, "Ave.")
    FROM Employe;
#commande INSTR(chaîne, souschaine) permet de rechercher la première apparition d'une sous-chaîne dans une chaîne.
#Si la sous-chaîne n'est pas présente, la fonction renvoie 0.


## FONCTIONS SUR LES DATES

SELECT DATE("now"); 
#affiche la date du jour de la requête au format "YYYY-MM-DD"


SELECT DATE("now", "-1 day");
#affiche la date de la veille


SELECT DATE("now", "start of month", "-1 day");
#affiche le dernier jour du mois dernier


SELECT DATE(DateCom, "+1 day") 
    FROM Commande;
#affiche la date du lendemain de la commande


SELECT DATE("now") AS "Aujourd'hui",
        STRFTIME("%Y", "now") AS "Année",
        STRFTIME("%m", "now") AS "Mois",
        STRFTIME("%d", "now") AS "Jour",
        STRFTIME("%d/%m/%Y", "now") AS "Nouveau format";
#le jour de la semaine a une valeur entre 0 (pour le dimanche) et 6 (pour le samedi). Par contre, le jour de l'année a une valeur entre 1 et 366. Le numéro de semaine dans l'année commence lui aussi à 0 jusqu'à 52 (voire 53).


SELECT DATE("now"),
        STRFTIME("%s", "now") as "Nb secondes depuis 1/1/1970",
        STRFTIME("%J", "now") as "Jour julien",
        JULIANDAY("now") as "Jour julien";


SELECT JULIANDAY("2016-08-21") - JULIANDAY("2016-08-05");
# Calcul du nombre de jours qu'ont duré les Jeux Olympiques 2016 (du 5 au 21 août).


SELECT (STRFTIME("%s", "2016-08-21") - STRFTIME("%s", "2016-08-05")) / 86400;
#Calcul du nombre de secondes depuis le 1/1/1970


## TRAITEMENT CONDITIONNEL

SELECT NoEmp, Nom, Prenom, TitreCourtoisie,
        CASE TitreCourtoisie
            WHEN "Mlle" THEN "Mademoiselle"
            WHEN "Mme"  THEN "Madame"
            WHEN "M."   THEN "Monsieur"
            ELSE TitreCourtoisie
        END AS Titre
    FROM Employe;
#Affiche les titres de courtoisie Mlle, Mme et M en entier. La requête ne modifie pas les autres titres présents dans la table 


SELECT Refprod, Nomprod, NiveauReap,
        CASE NiveauReap
            WHEN 0 THEN "Pas de niveau minimum"
            ELSE "Réapprovisionnement à partir de " || NiveauReap || " unités restantes"
        END AS Reapprovisionnement
    FROM Produit;
#Affiche le niveau de stock pour le produit nécessitant un réapprovisionnement.


SELECT Refprod, Nomprod, PrixUnit,
        CASE 
            WHEN PrixUnit <= 50 THEN "Petits prix"
            WHEN PrixUnit <= 500 THEN "Gamme moyenne"
            ELSE "Produits de luxe"
        END AS Gamme
    FROM Produit;
#Comparaison du prix unitaire des produits avec deux valeurs seuils. 


SELECT Refprod, UnitesStock, UnitesCom, NiveauReap,
        CASE
            WHEN UnitesCom > 0 THEN "Déjà commandé"
            WHEN UnitesStock < NiveauReap THEN "A commander"
            WHEN UnitesStock == 0 THEN "Plus en stock"
            ELSE "rien à faire"
        END AS Informations
    FROM Produit;
