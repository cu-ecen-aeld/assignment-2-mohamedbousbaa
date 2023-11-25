#!/bin/bash

# Vérifiez si le nombre d'arguments est correct
if [ "$#" -ne 2 ]; then
    echo "Erreur : Veuillez spécifier les deux arguments requis."
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

# Assignez les arguments à des variables pour plus de lisibilité
writefile="$1"
writestr="$2"

# Vérifiez si writefile est spécifié
if [ -z "$writefile" ]; then
    echo "Erreur : Le chemin vers le fichier de sortie n'est pas spécifié."
    exit 1
fi

# Vérifiez si writestr est spécifié
if [ -z "$writestr" ]; then
    echo "Erreur : La chaîne de texte à écrire n'est pas spécifiée."
    exit 1
fi

# Créez le répertoire si nécessaire
mkdir -p "$(dirname "$writefile")"

# Écrivez le contenu dans le fichier
echo "$writestr" > "$writefile"

# Vérifiez si l'opération a réussi
if [ $? -ne 0 ]; then
    echo "Erreur : Impossible de créer le fichier $writefile."
    exit 1
fi

echo "Le fichier $writefile a été créé avec succès avec le contenu :"
echo "$writestr"
exit 0


