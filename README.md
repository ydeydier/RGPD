# Présentation
Gestion du registre des traitements RGPD, orienté "collectivé"

# Technologies
PHP/MySQL

# Fonctionnalités
* Ajout / suppression de traitements
* Fonctionne avec un lien LDAP ou sans
* Corbeille
* Les informations demandées permettent de se poser une grande partie des questions nécessaire au respect du RGPD
* Export CSV
* Possibilité de modifier les noms des champs, et leurs description, via la page d'administration
* Possibilité de choisir les colonnes affichées

# Installation
Voir le fichier documentation/installation.txt

# Documentation LDAP
* LDAP : si un mot de passe est défini pour un utilisateur (table utilisateur), alors le LDAP n'est pas interrogé. Sinon, et si utiliserLDAP=oui dans configuration.ini, alors le LDAP est interrogé.

# Administration
* La page d'administration est accessible avec le login/mot de passe suivant : admin/admin (défini en base, table "utilisateur")

# Evolutions envisageables
* Historique des modifications
* Administration : édition de la table 'intitulé'
* Séparer direction et service ?
* Augmenter la durée de la session
* Expliquer "EC", "NA"...

# Ajout ou modification d'un champ
* Un champ "exemple : 'Finalité'" est :
  * défini dans la table 'champ'
  * enregistré dans la table 'traitement'
* La table 'champ' défini:
  * son nomChamp : correspond au nom de la colonne du champ dans la table 'traitement'
  * sa description (affichée dans les formulaires)
  * son libellé (affiché dans les formulaires)
  * son type : U=une ligne, M=multilignes, D=Date, L=Liste
    * Dans le cas d'un type 'L', une liste déroulante sera affichée. Son contenu est défini par le champ 'typeListe' et la table 'intitule'
  * afficheDansListe : défini si la colonne correspondant à ce champ est affichée dans la liste des traitement
* Pour ajouter un nouveau champ, il suffit donc:
  * d'ajouter une colonne dans la table 'traitement'
  * ajouter une ligne dans la table 'champ', qui définit toutes ses propriétés
