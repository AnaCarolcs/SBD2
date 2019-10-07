-- --------            << aula3exer1EvolucaoOracle >>        ------------ --
--                                                                   --
--                    SCRIPT DE CRIACAO (DDL)                        --
--                                                                   --
-- Data Criacao ..........: 27/09/2019                               --
-- Autor(es) .............: Daniel Maike Mendes Gonçalves 			 --
-- 							Eduardo Júnio Veloso Rodrigues           --
--                          Ana Carolina Carvalho                    --
-- Banco de Dados ........: MySQL                                    --
-- Base de Dados(nome) ...: aula3exer1EvolucaoOracle                      --
--                                                                   --
-- Data Ultima Alteracao ..: 07/10/2019                              --
--    + Criacao da base de dados                                     --
--    + Criacao das tabelas                                          --
--                                                                   --
-- PROJETO => 1 Base de Dados                                        --
--         => 3 Usuarios						                     --
--         => 5 Tabelas                                              --
--         => 1 View                                                 --
-- ----------------------------------------------------------------- --

CREATE DATABASE IF NOT EXISTS aula3exer1EvolucaoOracle;

USE aula3exer1EvolucaoOracle;

CREATE TABLE AS_PLANTONISTA (
    matriculaFuncional NUMBER NOT NULL,
    nomeCompleto VARCHAR2(120) NOT NULL,
    sexo enum('M', 'F') NOT NULL,
    CONSTRAINT PK_AS_PLANTONISTA PRIMARY KEY (matriculaFuncional)
);

CREATE TABLE AS_PESSOA (
CPF NUMBER NOT NULL,
nome VARCHAR2(50) NOT NULL,
senha VARCHAR2(15) NOT NULL,
CONSTRAINT PK_AS_PESSOA PRIMARY KEY (CPF)
);

CREATE TABLE AS_SETOR (
    codigoSetor NUMBER(10) NOT NULL,
    nomeSetor VARCHAR2(30) NOT NULL,
    CONSTRAINT PK_AS_SETOR PRIMARY KEY (codigoSetor)
);

CREATE TABLE AS_ESPECIALIDADE (
    codigo NUMBER(10) NOT NULL,
    nomeEspecialidade VARCHAR2(30) NOT NULL,
    CONSTRAINT PK_AS_ESPECIALIDADE primary key (codigo)
);

CREATE TABLE AS_possui (
    matriculaFuncional NUMBER(10) NOT NULL,
    codigo NUMBER(10) NOT NULL,
    CONSTRAINT PK_AS_possui PRIMARY KEY (matriculaFuncional, codigo),
    CONSTRAINT FK_AS_possui_AS_PLANTONISTA FOREIGN KEY (matriculaFuncional) REFERENCES AS_PLANTONISTA(matriculaFuncional),
    CONSTRAINT FK_AS_possui_AS_ESPECIALIDADE FOREIGN KEY (codigo) REFERENCES AS_ESPECIALIDADE(codigo)
);

CREATE TABLE AS_atende (
    codigoSetor NUMBER(10) NOT NULL,
    matriculaFuncional NUMBER(10) NOT NULL,
    dtHora DATETIME NOT NULL,
    CONSTRAINT FK_AS_atende_AS_SETOR FOREIGN KEY (codigoSetor) REFERENCES AS_SETOR(codigoSetor),
    CONSTRAINT FK_AS_atende_AS_PLANTONISTA FOREIGN KEY (matriculaFuncional) REFERENCES AS_PLANTONISTA(matriculaFuncional),
    CONSTRAINT UK_AS_atende UNIQUE (dtHora, codigoSetor, matriculaFuncional)
);
