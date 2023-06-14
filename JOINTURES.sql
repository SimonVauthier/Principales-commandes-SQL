## JOINTURE NATURELLE

SELECT *
    FROM Produit NATURAL JOIN Categorie;


SELECT RefProd, NomProd, Categorie.*
    FROM Produit NATURAL JOIN Categorie;

#table.* permet de récupérer l'ensemble des colonnes d'une des tables (ici l'ensemble de la colonne Categorie)


SELECT NomProd, Societe
    FROM Produit NATURAL JOIN Fournisseur
    WHERE Pays = "France";

#Restriction sur un attribut: Sélection des produits uniquement fournis par des entreprises françaises.

SELECT NomCateg, COUNT(*) AS "Nb Produits"
    FROM Produit NATURAL JOIN Categorie
    GROUP BY NomCateg
    ORDER BY 2 DESC;

	#jointure combinée à des agrégats

## INNER JOIN

SELECT *
    FROM Produit INNER JOIN Categorie
        USING (CodeCateg);


SELECT *
    FROM Produit INNER JOIN Categorie
        ON Produit.CodeCateg = Categorie.CodeCateg;

#les deux écritures retournent le même résultat


SELECT NomProd, Societe
    FROM Produit INNER JOIN Fournisseur
        USING (NoFour)
    WHERE Pays = "France";

#INNER JOIN combinée à des restrictions


SELECT NomCateg, COUNT(*) AS "Nb Produits"
    FROM Produit INNER JOIN Categorie
        USING (CodeCateg)
    GROUP BY NomCateg
    ORDER BY 2 DESC;

##INNER JOIN combinée à des restrictions



## UTILISATION D’ALIAS POUR LES TABLES

SELECT *
    FROM Produit AS P INNER JOIN Categorie AS C
        ON P.CodeCateg = C.CodeCateg;


## JOINTURES MULTIPLES

SELECT *
    FROM Produit 
        INNER JOIN Categorie USING (CodeCateg)
        INNER JOIN Fournisseur USING (NoFour);

#Le défaut de ce type de jointure (naturelle ou interne) est qu'une ligne d'une table n'ayant pas de correspondances dans l'autre table n'est pas conservé dans le résultat.


## OUTER JOIN

SELECT *
    FROM Client LEFT OUTER JOIN Commande
        USING (CodeCli);


SELECT *
    FROM Commande RIGHT OUTER JOIN Client 
        USING (CodeCli);


SELECT *
    FROM Client Cl LEFT OUTER JOIN Commande Co
        ON Cl.CodeCli = Co.CodeCli;

#Même requête utilisant l'écriture ON 


## DECOMPTE AVEC PRISE EN COMPTE DU 0

SELECT CodeCli, COUNT(NoCom)
    FROM Client LEFT OUTER JOIN Commande
        USING (CodeCli)
    GROUP BY CodeCli
    ORDER BY 2;

#en utilisant la clé primaire CodeCli, cette requête affichera bien la valeur 0 pour les clients sans commande.

SELECT Client.*
        FROM Client LEFT OUTER JOIN Commande
            USING (CodeCli)
        GROUP BY CodeCli
        HAVING COUNT(NoCom) == 0;


SELECT CodeCli, COUNT(NoCom), AVG(Port)
    FROM Client LEFT OUTER JOIN Commande
        USING (CodeCli)
    GROUP BY CodeCli
    ORDER BY 2;
