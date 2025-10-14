create database exercicio2_18_08_2025;

use exercicio2_18_08_2025;

create table clientes (
id_cliente int primary key,
nomeCliente varchar(400),
logradouro varchar(200),
estado varchar(200),
cidade varchar(200),
cep varchar(20)
);

create table pedidos (
id_pedido int primary key,
nomeProduto varchar(200),
valorProduto decimal (10,2), -- adicionei com alter table 
dataPedido datetime,
quantPedidos int, 
id_cliente int,
constraint fk_idCliente foreign key (id_cliente) references clientes(id_cliente)
);

-- adicionando valores nas tabelas

insert into clientes (id_cliente, nomeCliente, logradouro, estado, cidade, cep) values
(1, 'Ana Paula Souza', 'Rua das Flores, 123', 'SP', 'São Paulo', '01001-000'),
(2, 'Carlos Eduardo Lima', 'Av. Brasil, 456', 'RJ', 'Rio de Janeiro', '20040-002'),
(3, 'Fernanda Oliveira', 'Rua da Paz, 789', 'MG', 'Belo Horizonte', '30130-010'),
(4, 'João Pedro Martins', 'Rua Central, 321', 'RS', 'Porto Alegre', '90010-001'),
(5, 'Mariana Costa', 'Rua das Acácias, 55', 'PR', 'Curitiba', '80010-000'),
(6, 'Ricardo Almeida', 'Av. das Nações, 888', 'DF', 'Brasília', '70040-010'),
(7, 'Tatiane Ribeiro', 'Rua do Sol, 101', 'BA', 'Salvador', '40010-000'),
(8, 'Gustavo Nunes', 'Rua das Palmeiras, 77', 'PE', 'Recife', '50010-000'),
(9, 'Juliana Mendes', 'Av. Atlântica, 999', 'SC', 'Florianópolis', '88010-000'),
(10, 'Felipe Rocha', 'Rua do Comércio, 222', 'CE', 'Fortaleza', '60010-000');

INSERT INTO pedidos (id_pedido, nomeProduto, dataPedido, quantPedidos, id_cliente) 
VALUES
(101, 'Notebook Dell Inspiron', '2025-08-10 14:30:00', 1, 1),
(102, 'Smartphone Samsung Galaxy S22', '2025-08-11 09:15:00', 2, 2),
(103, 'Fone de Ouvido JBL', '2025-08-12 16:45:00', 3, 3),
(104, 'Monitor LG 24"', '2025-08-13 11:00:00', 1, 4),
(105, 'Teclado Mecânico Redragon', '2025-08-14 17:24:00', 2, 5),
(106, 'Mouse Logitech MX Master', '2025-08-15 13:10:00', 1, 6),
(107, 'Impressora HP DeskJet', '2025-08-16 10:00:00', 1, 7),
(108, 'Tablet Apple iPad Air', '2025-08-17 15:45:00', 2, 8),
(109, 'Câmera Canon EOS Rebel', '2025-08-18 18:30:00', 1, 9),
(110, 'Caixa de Som Bluetooth Sony', '2025-08-19 12:00:00', 4, 10);

alter table pedidos add valorProduto decimal(10,2);
update pedidos set valorProduto = 4500.00 where id_pedido = 101;
update pedidos set valorProduto = 3800.00where id_pedido = 102; 
update pedidos set valorProduto = 350.00 where id_pedido = 103; 
update pedidos set valorProduto = 950.00 where id_pedido = 104; 
update pedidos set valorProduto = 420.00 where id_pedido = 105; 
update pedidos set valorProduto = 520.00 where id_pedido = 106; 
update pedidos set valorProduto = 670.00 where id_pedido = 107; 
update pedidos set valorProduto = 5200.00 where id_pedido = 108; 
update pedidos set valorProduto = 3900.00 where id_pedido = 109; 
update pedidos set valorProduto = 780.00 where id_pedido = 110;  

-- usando inner join, rigth e left
select clientes.nomeCliente, clientes.id_cliente, pedidos.id_pedido, pedidos.nomeProduto 
from clientes 
inner join pedidos 
on clientes.id_cliente = pedidos.id_cliente;

select clientes.nomeCliente, clientes.id_cliente, pedidos.id_pedido, pedidos.nomeProduto 
from clientes 
left join pedidos 
on clientes.id_cliente = pedidos.id_cliente;

select clientes.nomeCliente, clientes.id_cliente, pedidos.id_pedido, pedidos.nomeProduto 
from clientes 
right join pedidos 
on clientes.id_cliente = pedidos.id_cliente;

-- usando group by, order by e count (*)

select id_cliente, count(*) as quantPedidos 
from pedidos group by id_cliente;

select id_cliente, nomeProduto, valorProduto, count(*) as quantPedidos 
from pedidos group by id_cliente, nomeProduto, valorProduto
order by valorProduto desc;





