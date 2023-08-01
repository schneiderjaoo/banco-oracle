create table empresa(  --criando tabela de empresa--
  idEmpresa int primary key not null,
  nomeEmpresa varchar(100) not null,
  descricaoEmpresa varchar(255)
);

create table funcionarios(  --criando tabela funcionarios--
  idEmpresa int not null,
  idProduto int,
  idFuncionario int primary key not null,
  nomeFuncionario varchar(100) not null,
  salarioFuncionarios float not null 
);

create table processo(  --criando tabela de produtos--
  idEmpresa int not null,
  idProduto int primary key not null,
  descricaoProduto varchar(255)
);

create table pedidos(  --criação da tabela de processos--
  idProduto int,
  idPedido int primary key not null,
  descricaoPedido varchar(100) not null
);
