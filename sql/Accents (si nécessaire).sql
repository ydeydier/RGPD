UPDATE `rgpd`.`champ` SET `libelleChamp` = replace(libelleChamp, '�', 'é');
UPDATE `rgpd`.`categorie` SET `libelle` = replace(libelle, '�', 'é');


� - é
� - à (ex: description du champ "priorit�", "� l'aide")
� - è
� - ê
