create database exercicio8_22_09_2025;

use exercicio8_22_09_2025;

CREATE TABLE usuario (
usuario_CPF CHAR(11) PRIMARY KEY,
usuario_nome VARCHAR(100) NOT NULL,
usuario_email VARCHAR(100) UNIQUE NOT NULL,
dt_cadastro DATETIME NOT NULL
);

INSERT INTO usuario (usuario_CPF, usuario_nome, usuario_email, dt_cadastro)
VALUES
('12345678901', 'Ana Souza', 'ana.souza@email.com', '2025-09-22'),
('98765432100', 'Carlos Lima', 'carlos.lima@email.com', '2025-09-20'),
('11122233344', 'João Silva', 'joao.silva@email.com', '2025-09-19'),
('45678912399', 'Beatriz Mendes', 'beatriz.mendes@email.com', '2025-09-18');

select * from usuario;

-- listando usuário

delimiter $$ 
create procedure sp_listarUsuario()
begin
select usuario_CPF, usuario_nome, usuario_email, dt_cadastro
from usuario;
end $$ 
delimiter ;

call sp_listarUsuario(); 

-- inserindo usuário
delimiter $$
create procedure sp_insereUsuario(v_CPF char(11), v_nome varchar(100), v_email
varchar(100), v_dt_cadastro datetime)
begin
if(v_cpf is not null and v_nome is not null and v_email is not null and v_dt_cadastro is not null) then
insert into usuario (usuario_CPF, usuario_nome, usuario_email, dt_cadastro) values (v_CPF, v_nome, v_email, v_dt_cadastro);
select 'Os registros foram inseridos com sucesso';
else
select 'Parametros inadequados';
end if;
end $$
delimiter ;

CALL sp_insereUsuario ('03478956212', 'Roger de Almeida JR',
'rogeralmeida@gmail.com', '20251205');

drop procedure sp_insereUsuario;

-- consultando o usuário
delimiter $$
create procedure sp_consultaUsuario(v_CPF char(11))
begin
if (v_cpf is not null) then
Select usuario_CPF, usuario_nome, usuario_email, dt_cadastro from usuario where usuario_cpf = v_cpf;
else
Select usuario_CPF, usuario_nome, usuario_email, dt_cadastro from usuario;
end if;
end $$
delimiter ;

call sp_consultaUsuario('12345678901');

drop procedure sp_consultaUsuario;

-- deletando usuário
delimiter $$
create procedure sp_deleteUsuario(v_CPF char(11))
begin
if (v_cpf is not null) then
delete from usuario where usuario_CPF = v_cpf;
else
delete from usuario;
end if;
end $$
delimiter ;

call sp_deleteUsuario('12345678901');

select usuario_CPF from usuario
where dt_cadastro = '2025-09-22';

