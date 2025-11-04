const mongoose = require('mongoose');

const EspecialistaSchema = new mongoose.Schema(
  {
    nome: { type: String, required: true, trim: true },
    especialidade: { type: String, required: true, trim: true },
    descricao: { type: String },
    contato: { type: String },
  },
  { timestamps: true }
);

module.exports = mongoose.model('Especialistas', EspecialistaSchema);
