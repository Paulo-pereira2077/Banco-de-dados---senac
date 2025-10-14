create database exercicio3_25_08_2025;

use exercicio3_25_08_2025;

create table produtos (
id_produto int primary key,
nomeProduto varchar (100),
preco decimal (10,2),
categoria varchar (100)
);

insert into produtos (id_produto, nomeProduto, preco, categoria) values
(1, 'LEGO Technic - Ferrari Daytona SP3', 615.06, 'Technic'),
(2, 'LEGO Marvel - Iron Man Armory', 306.2, 'Marvel'),
(3, 'LEGO Star Wars - Millennium Falcon', 124.2, 'Star Wars'),
(4, 'LEGO Marvel - Avengers Tower', 377.24, 'Marvel'),
(5, 'LEGO Marvel - Sanctum Sanctorum', 518.24, 'Marvel'),
(6, 'LEGO Marvel - Sanctum Sanctorum', 608.43, 'Marvel'),
(7, 'LEGO Technic - Ferrari Daytona SP3', 336.81, 'Technic'),
(8, 'LEGO Creator - Tree House', 137.47, 'Creator'),
(9, 'LEGO DC - Joker Manor', 668.63, 'DC'),
(10, 'LEGO Creator - Tree House', 155.76, 'Creator'),
(11, 'LEGO City - Lunar Research Base', 584.92, 'City'),
(12, 'LEGO DC - Batmobile Tumbler', 619.82, 'DC'),
(13, 'LEGO DC - Joker Manor', 374.48, 'DC'),
(14, 'LEGO Creator - Modular Police Station', 580.56, 'Creator'),
(15, 'LEGO Marvel - Iron Man Armory', 233.84, 'Marvel'),
(16, 'LEGO Nintendo - Super Mario Starter Course', 506.98, 'Nintendo'),
(17, 'LEGO Star Wars - Millennium Falcon', 364.49, 'Star Wars'),
(18, 'LEGO Marvel - Sanctum Sanctorum', 213.03, 'Marvel'),
(19, 'LEGO Marvel - Avengers Tower', 451.17, 'Marvel'),
(20, 'LEGO City - Lunar Research Base', 338.28, 'City'),
(21, 'LEGO DC - Batmobile Tumbler', 363.05, 'DC'),
(22, 'LEGO Creator - Modular Police Station', 352.5, 'Creator'),
(23, 'LEGO Technic - Ferrari Daytona SP3', 683.69, 'Technic'),
(24, 'LEGO Star Wars - Millennium Falcon', 795.25, 'Star Wars'),
(25, 'LEGO Technic - Ferrari Daytona SP3', 621.91, 'Technic'),
(26, 'LEGO DC - Joker Manor', 757.14, 'DC'),
(27, 'LEGO Marvel - Sanctum Sanctorum', 511.05, 'Marvel'),
(28, 'LEGO Creator - Ghostbusters Ecto-1', 261.27, 'Creator'),
(29, 'LEGO Marvel - Daily Bugle', 284.72, 'Marvel'),
(30, 'LEGO Marvel - Iron Man Armory', 465.83, 'Marvel');

-- fazendo select sum

select nomeProduto, count(*) as contagem
from produtos
group by nomeProduto;

select nomeProduto, sum(preco) as soma
from produtos
group by nomeProduto;

select nomeProduto, sum(preco) as soma, min(preco) as minimo
from produtos
group by nomeProduto;

select nomeProduto, sum(preco) as soma, max(preco) as maximo
from produtos
group by nomeProduto;

select nomeProduto, avg(preco) as media
from produtos
group by nomeProduto;