# Используем Node.js на основе Alpine
FROM node:19.5.0-alpine

# Указываем рабочую директорию
WORKDIR /app

# Копируем package.json и package-lock.json
COPY package*.json ./

# Устанавливаем зависимости
RUN npm install

# Копируем оставшуюся часть приложения
COPY . .

# Устанавливаем Prisma
RUN npm install -g prisma

# Генерируем Prisma client, если schema.prisma существует
RUN [ -f ./prisma/schema.prisma ] && prisma generate || echo "Prisma schema not found, skipping generate step"

# Открываем порт 3000
EXPOSE 3000

# Запускаем сервер
CMD [ "npm", "start" ]
