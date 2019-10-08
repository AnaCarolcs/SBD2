-- ------- << Aula 1 Exercicio 2 Evolucao Oracle Físico >> ------ --
--                                                                --
--                    SCRIPT DE CRIACAO (DDL)                     --
--                                                                --
-- Data Criacao ...........: 18/03/2019                           --
-- Autor(es) ..............: Joao Lucas Sousa Reis                --
--                           Matheus Roberto Alves da Silva e     --
--                           Paulo Victor de Menezes Lopes        --
--                           Ana Carolina Carvalho da Silva       --
-- Banco de Dados .........: MySQL                                --
-- Banco de Dados(nome) ...: bdAula1Exer2Evol3                    --
--                                                                --
-- Data Ultima Alteracao ..: 25/04/2019                           --
--   => Criacao do banco de dados                                 --
--   => Remocao do atributo area da entidade GERENTE              --
--   => Adicao da tabela AREA                                     --
--   => Relacionamento com GERENTE adicionado                     --
--                                                                --
-- PROJETO => 01 Base de Dados                                    --
--         => 12 Tabelas                                          --
--         => 02 Usuarios                                         --
--                                                                --
-- -----------------------------------------------------------------

CREATE TABLE AS_PESSOA (
CPF NUMBER NOT NULL,
nome VARCHAR2(50) NOT NULL,
senha VARCHAR2(15) NOT NULL,
CONSTRAINT PK_AS_PESSOA PRIMARY KEY (CPF)
);

CREATE TABLE AS_GERENTE (
CPF NUMBER NOT NULL,
formacao VARCHAR2(30) NOT NULL,
email VARCHAR2(30) NOT NULL,
CONSTRAINT PK_AS_GERENTE PRIMARY KEY (CPF),
CONSTRAINT FK_AS_GERENTE_AS_PESSOA FOREIGN KEY (CPF) REFERENCES AS_PESSOA (CPF)
);

CREATE TABLE AS_EMPREGADO (
matricula NUMBER NOT NULL,
rua VARCHAR2(30) NOT NULL,
cidade VARCHAR2(30) NOT NULL,
complemento VARCHAR2(50),
CPF NUMBER UNIQUE NOT NULL,
CONSTRAINT PK_AS_EMPREGADO PRIMARY KEY (matricula),
CONSTRAINT FK_AS_EMPREGADO_AS_PESSOA FOREIGN KEY(CPF) REFERENCES AS_PESSOA (CPF)
);

CREATE TABLE AS_AREA (
codigoArea NUMBER NOT NULL,
nomeArea VARCHAR2(20) NOT NULL,
CONSTRAINT PK_AS_AREA PRIMARY KEY(codigoArea)
);

CREATE SEQUENCE AS_AREA_SEQ;

CREATE TABLE AS_PRODUTO (
idProduto NUMBER NOT NULL,
nomeProduto VARCHAR2(30) NOT NULL,
precoUnitario FLOAT NOT NULL,
codigoArea NUMBER NOT NULL,
CONSTRAINT PK_AS_PRODUTO PRIMARY KEY (idProduto),
CONSTRAINT FK_AS_PRODUTO_AREA FOREIGN KEY (codigoArea) REFERENCES AS_AREA (codigoArea)
);

CREATE SEQUENCE AS_PRODUTO_SEQ;

CREATE TABLE AS_VENDA (
idVenda NUMBER NOT NULL,
dataVenda DATE NOT NULL,
preco_total FLOAT,
matriculaEmpregado NUMBER NOT NULL,
CONSTRAINT PK_AS_VENDA PRIMARY KEY (idVenda),
CONSTRAINT FK_AS_VENDA_AS_EMPREGADO FOREIGN KEY(matriculaEmpregado) REFERENCES AS_EMPREGADO(matricula)
);

CREATE SEQUENCE AS_VENDA_SEQ;

CREATE TABLE AS_telefone (
telefone NUMBER NOT NULL,
matricula NUMBER NOT NULL,
CONSTRAINT FK_AS_telefone_AS_EMPREGADO FOREIGN KEY(matricula) references AS_EMPREGADO(matricula)
);

CREATE TABLE AS_gerencia (
CPFgerente NUMBER NOT NULL,
matricula NUMBER NOT NULL,
CONSTRAINT FK_AS_gerencia_AS_GERENTE FOREIGN KEY (CPFGerente) REFERENCES AS_GERENTE (CPF),
CONSTRAINT FK_AS_gerencia_AS_EMPREGADO FOREIGN KEY (matricula) REFERENCES AS_EMPREGADO (matricula)
);

CREATE TABLE AS_realiza (
matricula NUMBER NOT NULL,
idVenda NUMBER NOT NULL,
CONSTRAINT FK_AS_realiza_AS_EMPREGADO FOREIGN KEY (matricula) REFERENCES AS_EMPREGADO (matricula),
CONSTRAINT FK_AS_realiza_AS_VENDA FOREIGN KEY (idVenda) REFERENCES AS_VENDA (idVenda)
);

CREATE TABLE AS_possui (
idVenda NUMBER NOT NULL,
idProduto NUMBER NOT NULL,
quantidade NUMBER NOT NULL,
CONSTRAINT FK_AS_possui_AS_VENDA FOREIGN KEY (idVenda) REFERENCES AS_VENDA (idVenda),
CONSTRAINT FK_AS_possui_AS_PRODUTO FOREIGN KEY (idProduto) REFERENCES AS_PRODUTO (idProduto)
);

CREATE TABLE AS_pertence (
idProduto NUMBER NOT NULL,
codigoArea NUMBER NOT NULL,
CONSTRAINT FK_AS_pertence_AS_PRODUTO FOREIGN KEY (idProduto) REFERENCES AS_PRODUTO (idProduto),
CONSTRAINT FK_AS_pertence_AS_AREA FOREIGN KEY (codigoArea) REFERENCES AS_AREA (codigoArea)
);

CREATE TABLE AS_administra (
CPFgerente NUMBER NOT NULL,
codigoArea NUMBER NOT NULL,
CONSTRAINT FK_AS_administra_GERENTE FOREIGN KEY (CPFGerente) REFERENCES AS_GERENTE (CPF),
CONSTRAINT FK_AS_administra_AS_AREA FOREIGN KEY (codigoArea) REFERENCES AS_AREA (codigoArea)
);
