-- --------     << aula3exer1EvolucaoOracle >>     ------------
-- 
--                    SCRIPT DE CRIACAO (DDL)
-- 
-- date Criacao ...........: 07/10/2019
-- Autor(es) ..............: Henrique Martins de Messias
-- Banco de Dados .........: Oracle
-- Base de Dados(nome) ....: aula3exer1EvolucaoOracle
-- 
-- date Ultima Alteracao ..: 07/10/2019
--   => Criacao das tabelas
-- 
-- PROJETO => 01 Base de Dados
--         => 04 Tabelas
--         => 03 Usuarios
--         => 01 Visao 
--         => 03 Sequences
-- 
-- -----------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS aula3exer1EvolucaoOracle;

CREATE SEQUENCE HMM_SETOR_SEQ;
CREATE SEQUENCE HMM_ESPECIALIDADE_SEQ;
CREATE SEQUENCE HMM_PLANTONISTA_SEQ;

CREATE TABLE HMM_SETOR (
    idSetor NUMBER(4) NOT NULL,
    nomeSetor VARCHAR2(30) NOT NULL,
    CONSTRAINT HMM_SETOR_PK PRIMARY KEY(idSetor)
);

CREATE TABLE HMM_ESPECIALIDADE (
    idEspecialidade NUMBER(3) NOT NULL,
    tipoEspecialidade VARCHAR2(50) NOT NULL,
    CONSTRAINT HMM_ESPECIALIDADE_PK PRIMARY KEY(idEspecialidade)
);

CREATE TABLE HMM_PLANTONISTA (
    matricula NUMBER(8) NOT NULL,
    nome VARCHAR2(40) NOT NULL,
    sexo CHAR(1) CHECK(sexo IN ('M','F')) NOT NULL,
    idEspecialidade NUMBER(3) DEFAULT 0,
    CONSTRAINT HMM_PLANTONISTA_HMM_ESPECIALIDADE_FK FOREIGN KEY(idEspecialidade) REFERENCES HMM_ESPECIALIDADE(idEspecialidade),
    CONSTRAINT HMM_PLANTONISTA_PK PRIMARY KEY(matricula)
);

CREATE TABLE HMM_alocado (
    idSetor NUMBER(4) NOT NULL,
    matricula NUMBER(8) NOT NULL,
    datahora TIMESTAMP NOT NULL,
    CONSTRAINT HMM_alocado_HMM_SETOR_FK FOREIGN KEY(idSetor) REFERENCES HMM_SETOR(idSetor),
    CONSTRAINT HMM_alocado_HMM_PLANTONISTA_FK FOREIGN KEY(matricula) REFERENCES HMM_PLANTONISTA(matricula),
    CONSTRAINT HMM_alocado_UK UNIQUE (matricula, datahora)
);
