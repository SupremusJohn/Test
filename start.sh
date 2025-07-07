#!/bin/bash

# Vérifie si le token est présent
if [ -z "$GITHUB_TOKEN" ]; then
  echo "❌ Erreur : GITHUB_TOKEN est manquant"
  exit 1
fi

# Supprimer l'ancien dossier s'il existe
rm -rf Supremus_MD

# Cloner le dépôt privé
git clone https://${GITHUB_TOKEN}@github.com/kurameshinatsuki/Supremus_MD

# Aller dans le dossier cloné
cd Supremus_MD || { echo "❌ Échec du clone"; exit 1; }

# Installer les dépendances
npm install --legacy-peer-deps

# Lancer le bot
node index.js
# ou pm2-runtime index.js si tu préfères