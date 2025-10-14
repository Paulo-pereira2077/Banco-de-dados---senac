create database exercicio1_11_08_2025;
use exercicio1_11_08_2025;

create table clientes(
id_cliente int primary key,
nomeCliente varchar (200), 
id_endereco int not null,
logradouro varchar (200),
numero int not null,
cidade varchar (200),
estado varchar (200),
id_pedido int,
constraint fk_pedidos_clientes foreign key (id_pedido) references pedidos (id_pedido) 
);

create table pedidos (
id_pedido int primary key,
numPedido int not null,
nomePedido varchar(200), 
dataDoPedido datetime
);

-- inserindo valores para as tabelas: clientes e pedidos
insert into clientes (id_cliente, id_endereco, logradouro, numero, cidade, estado) 
values (1, 101, 'Rua das Flores', 123, 'São Paulo', 'SP'),
	   (2, 102, 'Avenida Brasil', 456, 'Rio de Janeiro', 'RJ'),
	   (3, 103, 'Praça da Liberdade', 789, 'Belo Horizonte', 'MG'),
	   (4, 104, 'Rua do Comércio', 321, 'Curitiba', 'PR'),
	   (5, 105, 'Alameda Santos', 654, 'São Paulo', 'SP');

-- inserindo clientes que eu esqueci       
update clientes set nome = 'João Silva' where id_cliente = 1;
update clientes set nome = 'Maria Oliveira' where id_cliente = 2;
update clientes set nome = 'João Carlos Souza' where id_cliente = 3;
update clientes set nome = 'Ana Lima' where id_cliente = 4;
update clientes set nome = 'Fernanda Costa' where id_cliente = 5;
        
insert into pedidos (id_pedido, numPedido, nome, dataDoPedido)
values (1, 1001, 'Pedido de João', '2025-08-17 10:30:00'),
	   (2, 1002, 'Pedido de Maria', '2025-08-17 11:00:00'),
	   (3, 1003, 'Pedido de Carlos', '2025-08-17 12:15:00'),
	   (4, 1004, 'Pedido de Ana', '2025-08-17 13:45:00'),
	   (5, 1005, 'Pedido de Fernanda', '2025-08-17 14:20:00');

select * from clientes;
select * from clientes order by nomeCliente;
select * from clientes order by nomeCliente desc;
select * from clientes where id_cliente in (1,4, 5);
select * from clientes where id_cliente not in (1,4, 5);