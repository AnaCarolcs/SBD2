-- --------     << CONTROLE DE VENDAS >>     ------------
-- 
--                    SCRIPT DE CRIACAO (DDL)
-- 
-- Data Criacao ...........: 26/08/2019
-- Autor(es) ..............: Welison Lucas Almeida Regis
-- Banco de Dados .........: MySQL
-- Base de Dados(nome) ....: aula1exer2Evolucao5
-- 
-- Data Ultima Alteracao ..: 15/09/2019
--   => Criacao das tabelas 
-- 
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
-- 
-- -----------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS aula1exer2Evolucao5;

USE aula1exer2Evolucao5;

CREATE TABLE PESSOA (
    cpf BIGINT(11) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    senha VARCHAR(30) NOT NULL,
CONSTRAINT PESSOA_PK PRIMARY KEY (cpf)
) ENGINE=InnoDB;

CREATE TABLE GERENTE (
    cpf BIGINT(11) NOT NULL,
	escolaridade VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
CONSTRAINT GERENTE_PK PRIMARY KEY (cpf),
CONSTRAINT GERENTE_PESSOA_FK FOREIGN KEY (cpf)
REFERENCES PESSOA (cpf)
) ENGINE=InnoDB;

CREATE TABLE EMPREGADO (
    matricula INT NOT NULL,
    cpf BIGINT(11) NOT NULL UNIQUE,
    numero INT(5) NOT NULL,
    logradouro VARCHAR(50) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    uf VARCHAR(2) NOT NULL,
    cep INT(8) NOT NULL,
CONSTRAINT EMPREGADO_PK PRIMARY KEY (matricula),
CONSTRAINT EMPREGADO_PESSOA_FK FOREIGN KEY (cpf)
REFERENCES PESSOA (cpf)
) ENGINE=InnoDB;

CREATE TABLE telefone (
    matricula INT NOT NULL,
    telefone BIGINT(14) NOT NULL,
CONSTRAINT telefone_PK PRIMARY KEY (matricula, telefone),
CONSTRAINT telefone_EMPREGADO_FK FOREIGN KEY (matricula)
REFERENCES EMPREGADO (matricula)
) ENGINE=InnoDB;

CREATE TABLE supervisiona (
    cpf BIGINT(11) NOT NULL,
    matricula INT NOT NULL,
CONSTRAINT supervisiona_PK PRIMARY KEY (cpf, matricula),
CONSTRAINT supervisiona_GERENTE_FK FOREIGN KEY (cpf)
	REFERENCES GERENTE (cpf),
CONSTRAINT supervisiona_EMPREGADO_FK FOREIGN KEY (matricula)
REFERENCES EMPREGADO (matricula)
) ENGINE=InnoDB;

CREATE TABLE AREA (
    idArea INT NOT NULL AUTO_INCREMENT,
	cpf BIGINT(11) NOT NULL,
    nomeArea VARCHAR(50) NOT NULL,
CONSTRAINT AREA_PK PRIMARY KEY (idArea),
CONSTRAINT AREA_GERENTE_FK FOREIGN KEY (cpf)
REFERENCES GERENTE (cpf)
) ENGINE=InnoDB AUTO_INCREMENT = 1;

CREATE TABLE VENDA (
    idVenda INT NOT NULL AUTO_INCREMENT,
    dtVenda TIMESTAMP NOT NULL,
    matricula INT NOT NULL,
CONSTRAINT VENDA_PK PRIMARY KEY (idVenda),
CONSTRAINT VENDA_EMPREGADO_FK FOREIGN KEY (matricula)
REFERENCES EMPREGADO (matricula)
)ENGINE=InnoDB AUTO_INCREMENT = 1;

CREATE TABLE PRODUTO (
    codProduto INT NOT NULL,
    idArea INT NOT NULL,
    nomeProduto VARCHAR(50) NOT NULL,
CONSTRAINT PRODUTO_PK PRIMARY KEY (codProduto),
CONSTRAINT PRODUTO_AREA_FK FOREIGN KEY (idArea)
REFERENCES AREA (idArea)
) ENGINE=InnoDB;

CREATE TABLE contem (
    idVenda INT NOT NULL,
    codProduto INT NOT NULL,
    quantidade INT NOT NULL,
    precoUnitario DECIMAL(8, 2) NOT NULL,
CONSTRAINT contem_PK PRIMARY KEY (codProduto, idVenda),
CONSTRAINT contem_PRODUTO_FK FOREIGN KEY (codProduto)
REFERENCES PRODUTO (codProduto),
CONSTRAINT contem_VENDA_FK FOREIGN KEY (idVenda)
REFERENCES VENDA (idVenda)
) ENGINE=InnoDB;
