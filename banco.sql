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

insert into empresa ( idEmpresa, nomeEmpresa, descricaoEmpresa)  --criando a empresa número um--
values ( 1, ' Empresa um ', ' Empresa número um ');

insert into empresa ( idEmpresa, nomeEmpresa, descricaoEmpresa)  --criando a empresa número dois--
values ( 2, ' Empresa dois ', ' Empresa número dois ');

select * from empresa a --(VERIFICAÇÃO SE OS DADOS FORÃO INSERIDOS)seleciona a tabela e mostra todas as empresas, "select * from empresa a where idEmpresa = 1", aqui ele puxa a emrpesa com id = 1--

insert into funcionarios( idEmpresa, idFuncionario, nomeFuncionario, salarioFuncionarios ) --inserindo informações de funcionarios da empresa número um--
values ( 1, 11, 'nome um', 1000);
insert into funcionarios( idEmpresa, idFuncionario, nomeFuncionario, salarioFuncionarios )
values ( 1, 12, 'nome dois', 1000);

select * from funcionarios a  --(VERIFICAÇÃO SE OS DADOS FORÃO INSERIDOS)puxando dados de funcionários da empresa número um--
  where idEmpresa = 1

insert into funcionarios( idEmpresa, idFuncionario, nomeFuncionario, salarioFuncionarios )  --(VERIFICAÇÃO SE OS DADOS FORÃO INSERIDOS)inserindo informações de funcionarios da empresa número dois--
values ( 2, 21, 'nome um', 1200);
insert into funcionarios( idEmpresa, idFuncionario, nomeFuncionario, salarioFuncionarios )
values ( 2, 22, 'nome dois', 1200);

select * from funcionarios a  --(VERIFICAÇÃO SE OS DADOS FORÃO INSERIDOS)puxando dados de funcionários da empresa número dois--
  where idEmpresa = 2
  
insert into produtos ( idEmpresa, idProduto, descricaoProduto)  --criando produtos para empresa um--
values ( 1, 11, ' Vermelho ');
insert into produtos ( idEmpresa, idProduto, descricaoProduto)  --criando produtos para empresa um--
values ( 1, 12, ' Azul ');

select * from produtos a  --(VERIFICAÇÃO SE OS DADOS FORÃO INSERIDOS)puxando dados de produtos da empresa número um--
  where idEmpresa = 1

insert into produtos ( idEmpresa, idProduto, descricaoProduto)  --criando produtos para empresa dois--
values ( 2, 21, ' Amaralo ');
insert into produtos ( idEmpresa, idProduto, descricaoProduto)  --criando produtos para empresa dois--
values ( 2, 22, ' Verde ');


select * from produtos a  --(VERIFICAÇÃO SE OS DADOS FORÃO INSERIDOS)puxando dados de produtos da empresa número dois--
  where idEmpresa = 2

ALTER TABLE funcionarios --Adicionando campo novo a tabela dos funcionários, pela nova necessidade--
ADD idProduto int;

update funcionarios   --Adicionando produtos a funcionários destinados--
  set idProduto = 12
  where idFuncionario = 12;

update funcionarios 
  set idProduto = 11
  where idFuncionario = 11;

update funcionarios 
  set idProduto = 21
  where idFuncionario = 21;

update funcionarios 
  set idProduto = 22
  where idFuncionario = 22;

select * from funcionarios a  --(VERIFICAÇÃO SE OS DADOS FORÃO INSERIDOS)Empresa um--
  where idEmpresa = 1

select * from funcionarios a  --(VERIFICAÇÃO SE OS DADOS FORÃO INSERIDOS)Empresa dois--
  where idEmpresa = 2

insert into processo ( idProduto, idPedido, descricaoPedido ) --pedido com código de peoduto da empresa um--
values ( 11, 1, ' 20 camisas ');
insert into pedidos ( idProduto, idPedido, descricaoPedido ) --pedido com código de peoduto da empresa um--
values ( 21, 2, ' 10 moletons ');

select * from processo a --vendo os pedios de ambas as empresas--
