FROM node:14

# Crea un usuario no privilegiado
RUN addgroup --system appgroup && adduser --system --ingroup appgroup appuser

# Configura el directorio de trabajo y los permisos
WORKDIR /app
RUN chown -R appuser:appgroup /app

# Copia los archivos de configuración e instala las dependencias como el usuario no privilegiado
COPY package*.json ./
USER appuser
RUN npm install

# Copia el código de la aplicación
COPY . .

# Exponer el puerto y ejecutar la aplicación
EXPOSE 3001
CMD ["node", "index.js"]
