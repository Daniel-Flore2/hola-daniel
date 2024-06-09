FROM node:22.2.0-alpine

WORKDIR /app
COPY . .

# Instalar mocha de forma global
RUN npm install -g mocha

# Instalar las dependencias del proyecto
RUN npm install

EXPOSE 3000
CMD ["node", "index.js"]
