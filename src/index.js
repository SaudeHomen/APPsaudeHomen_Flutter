require('dotenv').config();
const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const connectDB = require('./config/db.js'); // Import da conexão

// Conecta ao banco
connectDB();

const app = express();
app.use(cors());
app.use(express.json());

// Porta e URL padrão
const PORT = process.env.PORT || 3000;

// Rota de teste
app.get('/', (req, res) => {
  res.send('API Saúde do Homem OK!');
});

// Inicializa o servidor
app.listen(PORT, () => {
  console.log(`✅ Servidor rodando em http://localhost:${PORT}`);
});
