FROM node:lts-buster

ENV BOT_DIR=/root/Supremus_MD

# Installer les dépendances système
RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp \
  git && \
  apt-get upgrade -y && \
  npm i pm2 -g && \
  rm -rf /var/lib/apt/lists/*

# Créer le dossier de travail
WORKDIR /root

# Créer un script d’entrée pour cloner et lancer le bot
COPY start.sh .

# Donner les droits d'exécution
RUN chmod +x start.sh

# Exposer le port
EXPOSE 10000

# Démarrer via le script
CMD ["./start.sh"]