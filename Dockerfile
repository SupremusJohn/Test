FROM node:lts-buster

# Permet de recevoir une variable externe au build
ARG GITHUB_TOKEN

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp \
  git && \
  apt-get upgrade -y && \
  npm i pm2 -g && \
  rm -rf /var/lib/apt/lists/*

# Cloner en utilisant le token pour accéder au dépôt privé
RUN git clone https://${GITHUB_TOKEN}@github.com/kurameshinatsuki/Supremus_MD Supremus_MD

# Entrer dans le dossier cloné
WORKDIR /root/Supremus_MD

# Installer les dépendances du projet
RUN npm install --legacy-peer-deps

EXPOSE 10000

CMD ["node", "index.js"]
# Ou, si tu préfères une gestion avec pm2 :
# CMD ["pm2-runtime", "index.js"]
