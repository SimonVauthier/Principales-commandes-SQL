SELECT *  #Le caractère * indique que l'on récupère tous les attributs de la table
FROM table 

## Limitation des résultats

SELECT * 
	FROM table
	LIMIT 3;

## Ordre des résultats

SELECT *             #Tri de la table par l'attribut
	FROM table
	ORDER BY attribut;

SELECT * 
	FROM table
	ORDER BY 2;     #Même requète mais en indiquant la position de l'attribut dans la table


SELECT * 
	FROM table
	ORDER BY attribut DESC;     #le tri se fera par ordre décroissant


SELECT * 
	FROM table
	ORDER BY attribut1, attribut2;    #le tri se fera d'abord par l'attribut1, puis par l'attribut2


SELECT * 
    FROM Employe
    ORDER BY Fonction DESC, Nom;  #les fonctions triées par ordre alphabétique décroissant.

## RESTRICTION

SELECT * 
    FROM Employe
    WHERE Fonction = "Représentant(e)";    #liste tous les employés ayant la fonction de représentant.

## OPERATEURS CLASSIQUES

SELECT * 
    FROM Employe
    WHERE Fonction <> "Représentant(e)";  #affiche tous les employés qui ne sont pas représentant


SELECT * 
    FROM Employe
    WHERE Fonction = "Représentant(e)"
    AND TitreCourtoisie = "M."
    AND NoEmp < 8;                          #affiche les représentants masculin avec un numéro d'employé strictement inférieur à 8


SELECT * 
    FROM Employe
    WHERE UPPER(Ville) = "SEATTLE";  #la fonction UPPER() transforme la chaîne de caractère en majuscule (principe opposé pour la fonction LOWER())

## DONNEES MANQUANTES

SELECT * 
    FROM Employe
    WHERE Region IS NULL;    #liste les employés dont la région est non renseignée


SELECT * 
    FROM Employe
    WHERE Region IS NOT NULL; #liste les employés dont l'info région est présente grâce à la fonction IS NOT NULL.

## OPERATEURS SPECIFIQUES

SELECT * 
    FROM Employe
    WHERE NoEmp BETWEEN 3 AND 8;    #définit un intervalle fermé dans lequel l'attribut doit avoir sa valeur.


SELECT * 
    FROM Employe
    WHERE TitreCourtoisie IN ('Mlle', 'Mme');       #définit une liste de valeurs entre parenthèses et séparées par des virgules.

#équivalent à  
SELECT *
FROM Employe
WHERE TitreCourtoisie = 'Mlle' OR TitreCourtoisie = 'Mme';


#L'opérateur LIKE est insensible à la casse

SELECT * 
    FROM Employe
    WHERE Nom LIKE 'D%';      #compare une chaîne de caractère à une pseudo-chaîne contenant une suite de caractère (pouvant être nulle) grâce au caractère %   


SELECT * 
    FROM Employe
    WHERE Prenom LIKE '_____';    #affiche tous les employés qui in un prénom de 5 lettres


## PROJECTION

SELECT Nom, Prenom
    FROM Employe;        #sélection des colonnes Nom et Prénom de la table Employe


## DOUBLONS

SELECT DISTINCT Fonction
    FROM Employe;          #DISTINCT supprime les doublons potentiels


## RENOMMAGE

SELECT DISTINCT Fonction AS "Fonctions existantes"
    FROM Employe;
