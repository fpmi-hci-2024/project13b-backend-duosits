const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

// Обработчик для корневого пути
app.get('/', (req, res) => {
  res.send('Hello from Express!');
});

// Запуск сервера
app.listen(PORT, '0.0.0.0', () => {
  console.log(`Server is running on port ${PORT}`);
});
