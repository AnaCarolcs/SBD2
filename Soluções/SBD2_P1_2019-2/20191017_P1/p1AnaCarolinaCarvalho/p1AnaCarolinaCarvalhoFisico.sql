-- --------     << PESSOA >>     ------------
--
--                    SCRIPT DE FÍSICO
--
-- Data Criacao ...........: 17/10/2019
-- Autor(es) ..............: Ana Carolina Carvalho
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: anasilva
--
-- Data Ultima Alteracao ..: 17/10/2019
--
-- 
-- PROJETO => 01 Base de Dados
--         => 05 Tabelas
--         => 02 Usuarios
--
-- ----------------------------------------------------
-- Físico:

CREATE DATABASE IF NOT EXISTS anasilva;

USE anasilva;

CREATE TABLE PESSOA (
    idPessoa int not null,
    idade int(3) not null,
    sexo varchar(1),
    dtNascimento date,
    email varchar(10),
    pNome varchar(10),
    nNome varchar(10),
    apelido varchar(10),
    constraint PESSOA_PK primary key (idPessoa)
)engine=InnoDb;

CREATE TABLE CARACTERISTICA (
    idCaracteristica int(10) not null,
    pessoal varchar(10),
    interesse varchar(10),
    constraint CARACTERISTICA_PK primary key (idCaracteristica)
)engine=InnoDb;


CREATE TABLE RELACIONAMENTO (
    idRelacionamento int(10) not null,
    constraint RELACIONAMENTO_PK primary key (idRelacionamento)
)engine=InnoDb;

CREATE TABLE possui (
    idPessoa int(10) not null,
    idCaracteristica int(10) not null,
    CONSTRAINT possui_PK PRIMARY KEY (idPessoa, idCaracteristica),
    CONSTRAINT possui_PESSOA_FK foreign key (idPessoa) references PESSOA(idPessoa),
    CONSTRAINT possui_CARACTERISTICA_FK foreign key (idCaracteristica) references CARACTERISTICA(idCaracteristica)
)engine=InnoDb;

CREATE TABLE tem (
    idPessoa int(10) not null,
    idRelacionamento int(10) not null,
    CONSTRAINT tem_PK PRIMARY KEY (idPessoa, idRelacionamento),
    CONSTRAINT tem_PESSOA_FK foreign key (idPessoa) references PESSOA(idPessoa),
    CONSTRAINT tem_RELACIONAMENTO_FK foreign key (idRelacionamento) references RELACIONAMENTO(idRelacionamento)
)engine=InnoDb;

