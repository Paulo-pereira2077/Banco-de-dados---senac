create database exercicio4_08_09_2025;

use exercicio5_08_09_2025;

CREATE TABLE Funcionario (
    codigoFuncionario INT PRIMARY KEY,
    nomeFuncionario VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    departamento VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2) NOT NULL
);

INSERT INTO Funcionario (codigoFuncionario, nomeFuncionario, cargo, departamento, salario)
VALUES
(301, 'Marcos Silva', 'Analista de Sistemas', 'TI', 4800.00),
(302, 'Juliana Costa', 'Assistente Administrativo', 'Financeiro', 3200.00),
(303, 'Rafael Torres', 'Gerente de Projetos', 'TI', 7500.00),
(304, 'Beatriz Almeida', 'Coordenadora de RH', 'Recursos Humanos', 6200.00),
(305, 'Lucas Pereira', 'Estagiário', 'Marketing', 1500.00),
(306, 'Fernanda Lima', 'Designer Gráfico', 'Marketing', 4100.00),
(307, 'Carlos Eduardo', 'Contador', 'Financeiro', 5300.00),
(308, 'Amanda Rocha', 'Recepcionista', 'Administrativo', 2800.00),
(309, 'Thiago Martins', 'Analista de Dados', 'TI', 5100.00),
(310, 'Patrícia Nunes', 'Consultora Comercial', 'Vendas', 4600.00);

delimiter $$
create function aumentoSalario(salario decimal(10,2), percentual_de_aumento DECIMAL(5,2))
returns decimal(10,2)
deterministic
begin
return salario * (percentual_de_aumento/ 100);
end$$
delimiter ;

select aumentoSalario(4800, 5.54) as aumento;

drop function aumentoSalario;