#! /usr/bin/env ksh

# Nom du fichier de sortie
output_file="repositoriesList.lst"

# Fichier temporaire pour stocker les chemins avant de les trier
temp_file=$(mktemp)

# Chercher tous les répertoires .git dans le répertoire courant
find . -type d -name ".git" | while read -r git_dir; do
    # Extraire le chemin du répertoire parent
    repo_dir=$(dirname "$git_dir")
    # Supprimer les caractères "./" au début du chemin
    repo_dir="${repo_dir#./}"
    # Ajouter le chemin du repository à la liste temporaire
    echo "$repo_dir" >> "$temp_file"
done

# Trier la liste et sauvegarder dans le fichier de sortie
sort "$temp_file" > "$output_file"

# Supprimer le fichier temporaire
rm "$temp_file"

echo -e "\n Liste des repositories GIT sauvegardée dans $output_file"
