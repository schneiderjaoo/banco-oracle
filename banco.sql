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

insert into empresa ( idEmpresa, nomeEmpresa, descricaoEmpresa)
values ( 1, " Empresa um ", " Empresa número um ");

insert into empresa ( idEmpresa, nomeEmpresa, descricaoEmpresa)
values ( 2, " Empresa dois ", " Empresa número dois ");

select * from empresa a -- seleciona a tabela e mostra todas as empresas, "select * from empresa a where idEmpresa = 1", aqui ele puxa a emrpesa com id = 1--
