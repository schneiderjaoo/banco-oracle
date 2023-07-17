const mysql = require('mysql');

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'usuario',
  password: 'senha',
  database: 'banco'
});

function calcularPagamento(salario) {
  // Lógica de processamento dos pagamentos
  const taxaImposto = 0.1; // 10%

  const valorPagamento = salario * (1 - taxaImposto); // Desconta o imposto

  return valorPagamento;
}

connection.connect((err) => {
  if (err) {
    console.error('Erro ao conectar ao banco de dados:', err);
    return;
  }

  const sql = `SELECT p.descricaoPedido, e.nomeEmpresa, f.nomeFuncionario, f.salarioFuncionarios
               FROM pedidos p
               JOIN processo pr ON p.idProduto = pr.idProduto
               JOIN empresa e ON pr.idEmpresa = e.idEmpresa
               JOIN funcionarios f ON e.idEmpresa = f.idEmpresa`;

  connection.query(sql, (err, results) => {
    if (err) {
      console.error('Erro ao executar a consulta:', err);
      connection.end();
      return;
    }

    // Print das informações na tela
    results.forEach((row) => {
      const { descricaoPedido, nomeEmpresa, nomeFuncionario, salarioFuncionarios } = row;

      // Lógica de processamento dos pagamentos
      const valorPagamento = calcularPagamento(salarioFuncionarios);

      // Printa pagamentos
      console.log('Descrição do Pedido:', descricaoPedido);
      console.log('Empresa:', nomeEmpresa);
      console.log('Funcionário:', nomeFuncionario);
      console.log('Salário:', salarioFuncionarios);
      console.log('Valor do Pagamento:', valorPagamento);
      console.log('-------------------------------------');
    });

    connection.end();
  });
});
