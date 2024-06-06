FROM node:14
WORKDIR /app
RUN mkdir -p /app/.npm
COPY package*.json ./
RUN npm config set cache /app/.npm --global
RUN npm install
COPY . .
EXPOSE 3001
CMD ["node", "index.js"]
