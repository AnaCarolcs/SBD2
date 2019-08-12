-- -------------------   << REVISAO P1 >>    -------------------- --
--                                                                --
--                    SCRIPT DE CRIACAO (DDL)                     --
--                                                                --
-- DATE Criacao ...........: 04/05/2019                           --
-- Autor(es) ..............: Paulo Victor de Menezes Lopes        --
-- Banco de Dados .........: MySQL                                --
-- Banco de Dados(nome) ...: bdEscola                             --
--                                                                --
-- PROJETO => 01 Base de Dados                                    --
--         => 05 Tabelas                                          --
--         => 01 Visao                                            --
--                                                                --
-- -----------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS bdEscola;

USE bdEscola;

CREATE TABLE PROFISSIONAL (
    matricula INT(3) NOT NULL AUTO_INCREMENT,
    nomeCompleto VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100) NOT NULL,
	
	CONSTRAINT PK_Profissional PRIMARY KEY (matricula)
) ENGINE = InnoDB, AUTO_INCREMENT = 101;

CREATE TABLE CLIENTE (
    tipoDocumento VARCHAR(100) NOT NULL,
    numeroDocumento BIGINT(20) NOT NULL,
    nome_razaoSocial VARCHAR(50) NOT NULL,
	
    CONSTRAINT PK_Cliente PRIMARY KEY (tipoDocumento, numeroDocumento)
) ENGINE = InnoDB;

CREATE TABLE telefone (
    cliente_tipoDocumento VARCHAR(100) NOT NULL,
    cliente_numeroDocumento BIGINT(20) NOT NULL,
    telefone BIGINT(13) NOT NULL,
	
	CONSTRAINT FK_telefone_Cliente FOREIGN KEY (cliente_tipoDocumento, cliente_numeroDocumento)
		REFERENCES CLIENTE (tipoDocumento, numeroDocumento)
) ENGINE = InnoDB;

CREATE TABLE PROJETO (
    idProjeto INT(5) NOT NULL AUTO_INCREMENT,
    cliente_tipoDocumento VARCHAR(100) NOT NULL,
    cliente_numeroDocumento BIGINT(20) NOT NULL,
    dtContrato DATE NOT NULL,
	
	CONSTRAINT PK_Projeto PRIMARY KEY (idProjeto),
	CONSTRAINT FK_Projeto_Cliente FOREIGN KEY (cliente_tipoDocumento, cliente_numeroDocumento)
		REFERENCES CLIENTE (tipoDocumento, numeroDocumento)
) ENGINE = InnoDB, AUTO_INCREMENT = 1;

CREATE TABLE atua (
    projeto INT(5) NOT NULL,
    profissional INT(3) NOT NULL,
    valorUnitario float NOT NULL,
	
	CONSTRAINT FK_atua_Projeto FOREIGN KEY (projeto)
		REFERENCES PROJETO (idProjeto),
	CONSTRAINT FK_atua_Profissional FOREIGN KEY (profissional)
		REFERENCES PROFISSIONAL (matricula)
) ENGINE = InnoDB;