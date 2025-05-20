create database empresa;

use empresa;

-- Tabela departamento
CREATE TABLE departamento (
    codigoDepartamento INT PRIMARY KEY,
    nomeDepartamento VARCHAR(50)
);

-- Tabela projetos
CREATE TABLE projetos (
    codigoProjeto INT PRIMARY KEY,
    nomeProjeto VARCHAR(100),
    dataInicio DATETIME,
    dataPrevisaoFim DATETIME,
    codigoDepartamento INT,
    CONSTRAINT fk_departamento_proj FOREIGN KEY (codigoDepartamento) REFERENCES departamento(codigoDepartamento)
);

-- Tabela tarefas
CREATE TABLE tarefas (
    codigoTarefa INT PRIMARY KEY,
    nomeTarefa VARCHAR(100)
);

-- Tabela empregados
CREATE TABLE empregados (
    cpfEmpregado INT PRIMARY KEY,
    nomeEmpregado VARCHAR(100),
    dataNascimento DATETIME,
    rg VARCHAR(10),
    rua VARCHAR(50),
    numero VARCHAR(50),
    cep VARCHAR(10),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    estado VARCHAR(50),
    codigoDepartamento INT,
    CONSTRAINT fk_departamento_emp FOREIGN KEY (codigoDepartamento) REFERENCES departamento(codigoDepartamento)
);

-- Tabela alocação 
CREATE TABLE alocacao (
    codigoTarefa INT,
    cpfEmpregado INT,
    codigoProjeto INT,
    dataAlocacao DATETIME,
    dataFimAlocacao DATETIME,
    PRIMARY KEY (codigoTarefa, cpfEmpregado, codigoProjeto),
    CONSTRAINT fk_tarefa FOREIGN KEY (codigoTarefa) REFERENCES tarefas(codigoTarefa),
    CONSTRAINT fk_empregado FOREIGN KEY (cpfEmpregado) REFERENCES empregados(cpfEmpregado),
    CONSTRAINT fk_projeto FOREIGN KEY (codigoProjeto) REFERENCES projetos(codigoProjeto)
);

