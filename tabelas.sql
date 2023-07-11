create table empresa(  --criando tabela de empresa--
  idEmpresa int primary key not null,
  nomeEmpresa varchar(100) not null,
  descricaoEmpresa varchar(255)
);

create table funcionarios(  --criando tabela funcionarios--
  idEmpresa int not null,
  idFuncionario int primary key not null,
  nomeFuncionario varchar(100) not null,
  salarioFuncionarios float not null 
);

create table produtos(
  idEmpresa int not null,
  idProduto int primary key not null,
  descricaoProduto varchar(255)
);

insert into empresa ( idEmpresa, nomeEmpresa, descricaoEmpresa)  --criando a empresa número um--
values ( 1, ' Empresa um ', ' Empresa número um ');

insert into empresa ( idEmpresa, nomeEmpresa, descricaoEmpresa)  --criando a empresa número dois--
values ( 2, ' Empresa dois ', ' Empresa número dois ');

select * from empresa a -- seleciona a tabela e mostra todas as empresas, "select * from empresa a where idEmpresa = 1", aqui ele puxa a emrpesa com id = 1--

insert into funcionarios( idEmpresa, idFuncionario, nomeFuncionario, salarioFuncionarios ) --inserindo informações de funcionarios da empresa número um--
values ( 1, 11, 'nome um', 1000);
insert into funcionarios( idEmpresa, idFuncionario, nomeFuncionario, salarioFuncionarios )
values ( 1, 12, 'nome dois', 1000);

insert into funcionarios( idEmpresa, idFuncionario, nomeFuncionario, salarioFuncionarios )  --inserindo informações de funcionarios da empresa número dois--
values ( 2, 21, 'nome um', 1200);
insert into funcionarios( idEmpresa, idFuncionario, nomeFuncionario, salarioFuncionarios )
values ( 2, 22, 'nome dois', 1200);

select * from funcionarios a  --puxando dados de funcionários da empresa número um--
  where idEmpresa = 1
