=======

# refresh_GIT.sh

## Description


Le but de ce repo est de mettre à jour facilement au quotidien tous les repositories GIT stockés sur son poste de travail



## Fonctionnement

Le script contient plusieurs vérifications avant lancement, comme la présence des répertoires nécessaires de l'application et le fichier de liste des repositories.

En cours d'exécution, un fichier log basique est créé.



## Usage

```bash
bash refresh_GIT.sh
ou
./refresh_GIT.sh	# Si le script bash a été modifié en 755
```



## Pré-requis

GIT installé

Un répertoire contenant tous les repositories ce serait mieux

Un fichier repo_list.lst est fourni dans le répertoire *sources* de ce repository et contient une liste des repositories basiques à adapter selon vos besoins : 

```
...
repo1/
repo2/
...
```



## En cas de problème avec le script ou de demande d'évolution

Contactez Olivier Leteneur
