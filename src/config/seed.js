const mongoose = require('mongoose');
const path = require('path');
console.log('📂 Diretório atual:', __dirname);
console.log('📂 Caminho models:', path.resolve(__dirname, '../models'));
require('dotenv').config();

// Importa os models
const Especialista = require('../models/Especialistas');
const Tratamento = require('../models/Tratamento');
const ProblemaSaude = require('../models/ProblemaSaudes');

// Conexão com o banco
const MONGO_URI = process.env.MONGO_URI || 'mongodb://127.0.0.1:27017/saude_homem_db';

async function seed() {
  try {
    await mongoose.connect(MONGO_URI);
    console.log('✅ Conectado ao MongoDB');

    // Limpa as collections antes de popular
    await Especialista.deleteMany({});
    await Tratamento.deleteMany({});
    await ProblemaSaude.deleteMany({});

    console.log('🧹 Coleções limpas');

    // ---- INSERINDO ESPECIALISTAS ----
    const especialistas = await Especialista.insertMany([
      {
        nome: 'Dr. João Silva',
        especialidade: 'Urologista',
        descricao: 'Especialista em saúde do trato urinário e próstata.',
        contato: 'drjoaosilva@exemplo.com',
      },
      {
        nome: 'Dra. Maria Oliveira',
        especialidade: 'Endocrinologista',
        descricao: 'Focada em distúrbios hormonais e metabolismo.',
        contato: 'dramaria@exemplo.com',
      },
      {
        nome: 'Dr. Carlos Mendes',
        especialidade: 'Cardiologista',
        descricao: 'Cuida da saúde do coração e sistema circulatório.',
        contato: 'drcarlos@exemplo.com',
      },
    ]);

    console.log('👨‍⚕️ Especialistas inseridos');

    // ---- INSERINDO TRATAMENTOS ----
    const tratamentos = await Tratamento.insertMany([
      {
        tipo: 'Medicamento',
        descricao: 'Uso de alfa-bloqueadores e inibidores de 5-alfa-redutase.',
      },
      {
        tipo: 'Cirurgia',
        descricao: 'Ressecção transuretral da próstata (RTUP).',
      },
      {
        tipo: 'Terapia',
        descricao: 'Acompanhamento psicológico e mudanças no estilo de vida.',
      },
      {
        tipo: 'Exercícios físicos',
        descricao: 'Rotinas de treino voltadas à saúde cardíaca e circulação.',
      },
    ]);

    console.log('💊 Tratamentos inseridos');

    // ---- INSERINDO PROBLEMAS DE SAÚDE ----
    const problemas = await ProblemaSaude.insertMany([
      {
        nome: 'Hiperplasia Benigna da Próstata',
        descricao:
          'Aumento não maligno da próstata, comum em homens com mais de 50 anos. Pode causar dificuldade ao urinar.',
        faixaEtaria: '50+',
        especialista: especialistas[0]._id,
        tratamentos: [tratamentos[0]._id, tratamentos[1]._id],
      },
      {
        nome: 'Disfunção Erétil',
        descricao:
          'Dificuldade persistente em obter ou manter ereção. Pode ter causas físicas ou psicológicas.',
        faixaEtaria: '30-70',
        especialista: especialistas[1]._id,
        tratamentos: [tratamentos[0]._id, tratamentos[2]._id],
      },
      {
        nome: 'Hipertensão',
        descricao:
          'Pressão arterial alta, pode levar a doenças cardíacas e derrames. Requer controle médico regular.',
        faixaEtaria: '40+',
        especialista: especialistas[2]._id,
        tratamentos: [tratamentos[3]._id, tratamentos[0]._id],
      },
    ]);

    console.log('🩺 Problemas de saúde inseridos');

    console.log('\n🌱 Seed finalizado com sucesso!');
    process.exit(0);
  } catch (error) {
    console.error('❌ Erro ao executar o seed:', error);
    process.exit(1);
  }
}

seed();
