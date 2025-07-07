FROM node:20-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
  ffmpeg \
  imagemagick \
  webp \
  git && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

# Create and set working directory
WORKDIR /app

# Clone repository and verify contents
RUN git clone https://github.com/kurameshinatsuki/Supremus_MD . && \
    ls -la

# Install dependencies (only if package.json exists)
RUN if [ -f package.json ]; then \
      npm install --legacy-peer-deps; \
    else \
      echo "ERROR: package.json not found!" && exit 1; \
    fi

# Expose port
EXPOSE 10000

# Start command
CMD ["node", "index.js"]