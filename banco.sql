create table empresa(
  idEmpresa int primary key not null,
  nomeEmpresa varchar(100) not null,
  descricaoEmpresa varchar(255)
);

create table funcionarios(
  idEmpresa int not null,
  idFuncionario int primary key not null,
  nomeFuncionario varchar(100) not null,
  salarioFuncionarios float not null 
);
