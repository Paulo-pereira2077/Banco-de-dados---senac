create database exercicio5_08_09_2025;

use exercicio5_08_09_2025;

CREATE TABLE Produto (
    codigoProduto INT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    unidade VARCHAR(10) NOT NULL,
    valorUnitario DECIMAL(10,2) NOT NULL
);

INSERT INTO Produto (codigoProduto, descricao, unidade, valorUnitario)
VALUES 
(101, 'Caneta Azul', 'M', 2.50),
(102, 'Caderno Espiral 100 folhas', 'P', 12.90),
(103, 'Pacote de Papel A4 500 folhas', 'MM', 28.75);

CREATE TABLE Vendedor (
    codigoVendedor INT PRIMARY KEY,
    NomeVendedor VARCHAR(100) NOT NULL,
    FaixaComissao VARCHAR(10) NOT NULL,
    salarioFixo DECIMAL(10,2) NOT NULL
);

INSERT INTO Vendedor (codigoVendedor, NomeVendedor, FaixaComissao, salarioFixo)
VALUES 
(201, 'Ana Souza', 'A', 2500.00),
(202, 'Carlos Lima', 'B', 2200.00),
(203, 'Fernanda Rocha', 'C', 2000.00),
(204, 'João Mendes', 'A', 2600.00);

-- atualizando os dados
update Produto 
set unidade = 'M'
where codigoProduto = 101;

update Produto 
set unidade = 'MM'
where codigoProduto = 103;

-- criando uma view para tabela Produto
create view PR_metro (cod_PR_metro,descricao,unidade) as 
select codigoProduto, descricao, unidade
from Produto
where unidade = 'M';

select * from PR_metro;

-- criando uma view para tabela Vendedor
create view salarioAnual (codigoVendedor, nomeVendedor, salarioAnualMedio) as
select codigoVendedor, nomeVendedor, (salarioFixo*12)
from Vendedor;

select * from salarioAnual;

-- listando registros
select nomeVendedor, salarioMedio
from salarioAnual
where salarioAnualMedio > 2000;

-- apagando registros 
delete from salarioAnual
where  codigoVendedor = 204;

-- apagando uma view
drop view salarioAnual;

-- inserindo registros
create view PR_Metro2 as
select * from Produto;

insert into PR_Metro2 
values (110,'Caneta Bic','M', 2.50);

-- modificando registros
update PR_metro
set descricao = 'Caneta Faber Castel'
where cod_PR_Metro = 110;

select * from PR_metro;

select * from Produto;