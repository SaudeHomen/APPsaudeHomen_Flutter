const mongoose = require('mongoose');
const bcrypt = require('bcrypt');

const UsuarioSchema = new mongoose.Schema(
  {
    nomeCompleto: { type: String, required: true, trim: true },
    dataNascimento: { type: Date, required: true },
    cpf: { type: String, trim: true },
    email: { type: String, required: true, unique: true, lowercase: true, trim: true },
    senha: { type: String, required: true },
    celular: { type: String, trim: true },
  },
  { timestamps: true }
);

// 🔐 Criptografa a senha antes de salvar
UsuarioSchema.pre('save', async function (next) {
  if (!this.isModified('senha')) return next();
  const salt = await bcrypt.genSalt(10);
  this.senha = await bcrypt.hash(this.senha, salt);
  next();
});

// 🔍 Método para comparar senhas
UsuarioSchema.methods.verificarSenha = async function (senhaDigitada) {
  return bcrypt.compare(senhaDigitada, this.senha);
};

// 🧮 Virtual: calcular idade do usuário
UsuarioSchema.virtual('idade').get(function () {
  if (!this.dataNascimento) return null;
  const diffMs = Date.now() - this.dataNascimento.getTime();
  const idade = new Date(diffMs).getUTCFullYear() - 1970;
  return idade;
});

module.exports = mongoose.model('Usuario', UsuarioSchema);
