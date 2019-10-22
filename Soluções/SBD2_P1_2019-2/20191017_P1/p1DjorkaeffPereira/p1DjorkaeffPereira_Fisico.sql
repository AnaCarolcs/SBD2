-- --------     << p1DjorkaeffPereira >>     ------------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 17/10/2019
-- Autor(es) ..............: Djorkaeff Alexandre Vilela Pereira
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: p1DjorkaeffPereira
--
-- Data Ultima Alteracao ..: 17/10/2019
--   => Criacao de nova tabela
--
-- PROJETO => 01 Base de Dados
--         => 05 Tabelas
--         => 02 Usuarios
--         => 01 Visoes
--
-- -----------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS p1DjorkaeffPereira;

USE p1DjorkaeffPereira;

CREATE TABLE PESSOA (
  identificador INT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  apelido VARCHAR(26) NOT NULL,
  dataDeNascimento DATE NOT NULL,
  sexo VARCHAR(1) NOT NULL
) Engine = InnoDB, CHARSET UTF8;


CREATE TABLE relacionamento (
  identificadorPessoa INT,
  identificadorOutraPessoa INT,
  CONSTRAINT FK_PESSOA_relacionamento FOREIGN KEY (identificadorPessoa) REFERENCES PESSOA(identificador) ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT FK_OUTRA_PESSOA_relacionamento FOREIGN KEY (identificadorOutraPessoa) REFERENCES PESSOA(identificador) ON UPDATE RESTRICT ON DELETE RESTRICT
) Engine = InnoDB, CHARSET UTF8;

CREATE TABLE CARACTERISTICA (
  codigo INT PRIMARY KEY,
  descricao VARCHAR(100) NOT NULL
) Engine = InnoDB, CHARSET UTF8;

CREATE TABLE possui (
  identificadorPessoa INT,
  codigoCaracteristica INT,
  CONSTRAINT FK_PESSOA_possui FOREIGN KEY (identificadorPessoa) REFERENCES PESSOA(identificador) ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT FK_CARACTERISTICA_possui FOREIGN KEY (codigoCaracteristica) REFERENCES CARACTERISTICA(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT
) Engine = InnoDB, CHARSET UTF8;

CREATE TABLE email (
  identificadorPessoa INT,
  email VARCHAR(100) NOT NULL,
  CONSTRAINT FK_PESSOA_email FOREIGN KEY (identificadorPessoa) REFERENCES PESSOA(identificador) ON UPDATE RESTRICT ON DELETE RESTRICT
) Engine = InnoDB, CHARSET UTF8;