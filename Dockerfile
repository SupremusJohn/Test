FROM node:20-slim

# Installer les dépendances système
RUN apt-get update && apt-get install -y \
  ffmpeg \
  imagemagick \
  webp \
  git && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

# Créer le dossier de travail (facultatif, utile pour clarté)
WORKDIR /root

# Cloner le vrai bot
RUN git clone https://github.com/kurameshinatsuki/Supremus_MD /Supremus_MD

WORKDIR /root/Supremus_MD

# Installer les dépendances du vrai projet
RUN npm install --legacy-peer-deps

# Exposer le port utilisé par ton bot
EXPOSE 10000

# Lancer le bot (adaptable si tu utilises PM2 ou autre)
CMD ["node", "index.js"]