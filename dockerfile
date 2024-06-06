FROM node:14
WORKDIR /app
COPY package*.json ./
RUN npm config set cache /app/.npm --global
RUN npm install
RUN chown -R node:node /app/.npm
COPY . .
EXPOSE 3001
USER node
CMD ["node", "index.js"]
