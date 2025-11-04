const mongoose = require('mongoose');

const ProblemaSaudeSchema = new mongoose.Schema(
  {
    nome: { type: String, required: true, trim: true },
    descricao: { type: String, required: true },
    faixaEtaria: { type: String, required: true }, // Ex: "18-35", "50+"
    especialista: { type: mongoose.Schema.Types.ObjectId, ref: 'Especialista', required: true },
    tratamentos: [{ type: mongoose.Schema.Types.ObjectId, ref: 'Tratamento' }],
  },
  { timestamps: true }
);

module.exports = mongoose.model('ProblemaSaudes', ProblemaSaudeSchema);
