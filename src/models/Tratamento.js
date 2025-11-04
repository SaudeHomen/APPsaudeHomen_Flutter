const mongoose = require('mongoose');

const TratamentoSchema = new mongoose.Schema(
  {
    tipo: { type: String, required: true, trim: true },
    descricao: { type: String, required: true, trim: true },
  },
  { timestamps: true }
);

module.exports = mongoose.model('Tratamento', TratamentoSchema);
