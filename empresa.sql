create database empresa;

use empresa;

-- tabelas da empresa
create table funcionarios (
idFuncionarios int primary key,
nomeFuncionarios varchar (100),
cargo varchar (100),
salario decimal (10,4)
);

create table departamentos (
idDepartamento int primary key,
nomeDepartamento varchar(100)
); 

-- alterações no nome 'idFuncionario' para idFuncionarios
ALTER TABLE funcionarios CHANGE idFuncionario idFuncionarios int;

-- inserindo valores na tabela funcionarios 
insert into funcionarios (idFuncionarios, nomeFuncionarios, cargo, salario)
values (1, 'José', 'CEO', 10000.00),
       (2, 'Paulo', 'Gerente', 7500.00),
       -- funcionario deletado
       (3, 'Luiza', 'Supervisor', 6500.00),
       -- ----------------------------------
       (4, 'Alessandra', 'Analista', 5500.00),
	   (5, 'Elizabeth', 'Assistente', 4500.00),
       (6, 'Pedro', 'Auxiliar', 3500.00);
       
-- consulta simples
select idFuncionarios, nomeFuncionarios, salario 
from funcionarios 
where salario > 3000; 

-- deletando um funcionário
delete from funcionarios where idFuncionarios = 3;

-- fazendo um update em funcionarios do 'José - Gerente' para CEO, 'Paulo - Coordenador' para Gerente
update funcionarios set cargo = 'CEO' where idFuncionarios = 1;
update funcionarios set cargo = 'Gerente' where idFuncionarios = 2;
  
-- visualizando os resultados do update de cargos
select * from funcionarios;


-- criando relacionameto entre as tabelas funcionarios e departamentos

-- adicionando fk na tabela funcionarios, do departamento
alter table funcionarios
add column idDepartamento int;

alter table funcionarios
add constraint fk_idDepartamento foreign key (idDepartamento) references departamentos (idDepartamento);

-- adicionando os funcionários nos seus respectivos departamentos
-- criando os departamentos
insert into departamentos (idDepartamento, nomeDepartamento)
values (1, 'Executivo'),
	   (2, 'Operações Comerciais'),
       (3, 'Marketing'),
       (4, 'Financeiro'),
       (5, 'Atendimento ao CLiente'); 
-- departamentos dos funcionários
update funcionarios 
set idDepartamento = 1 
where idFuncionarios = 1;

update funcionarios 
set idDepartamento = 2
where idFuncionarios = 2;

update funcionarios 
set idDepartamento = 3
where idFuncionarios = 4;

update funcionarios 
set idDepartamento = 4
where idFuncionarios = 5;

update funcionarios 
set idDepartamento = 5
where idFuncionarios = 6;


-- Listando o nome do funcionário Pedro, o seu departamento utilizando o inner join

select funcionarios.idFuncionarios, funcionarios.nomeFuncionarios, funcionarios.idDepartamento
from funcionarios as funcionarios 
inner join departamentos as departamentos on funcionarios.idDepartamento = departamentos.idDepartamento; 
