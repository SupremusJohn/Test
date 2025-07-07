FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  npm i pm2 -g && \
  rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/kurameshinatsuki/Supremus_MD
WORKDIR /root/Supremus_MD/


RUN npm install pm2 -g


EXPOSE 10000

CMD ["node", "index.js"]