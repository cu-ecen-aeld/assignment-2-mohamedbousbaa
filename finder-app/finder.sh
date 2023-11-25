#!/bin/bash

# Vérifiez si le nombre d'arguments est correct
if [ "$#" -ne 2 ]; then
    echo "Erreur : Veuillez spécifier les deux arguments requis."
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

# Assignez les arguments à des variables pour plus de lisibilité
filesdir="$1"
searchstr="$2"

# Vérifiez si filesdir est un répertoire
if [ ! -d "$filesdir" ]; then
    echo "Erreur : Le chemin spécifié n'est pas un répertoire valide."
    exit 1
fi

# Trouver le nombre de fichiers et de lignes correspondantes
file_count=$(find "$filesdir" -type f | wc -l)
matching_lines=$(grep -r "$searchstr" "$filesdir" | wc -l)

# Imprime le résultat
echo "The number of files are $file_count and the number of matching lines are $matching_lines"

