FROM node:20-slim

# Install system deps
RUN apt-get update && apt-get install -y \
  ffmpeg imagemagick webp git && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Clone with build-arg (Solution 1)
ARG GITHUB_TOKEN
RUN git clone https://${GITHUB_TOKEN}@github.com/kurameshinatsuki/Supremus_MD . && \
    ls -la

# Install dependencies
RUN if [ -f package.json ]; then \
      npm install --legacy-peer-deps; \
    else \
      echo "ERROR: package.json not found!" && exit 1; \
    fi

EXPOSE 10000
CMD ["node", "index.js"]