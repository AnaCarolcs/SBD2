   -- --------     << p1 >>     ------------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 17/10/2019
-- Autor(es) ..............: Sara Silva
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: SaraSilva
--
-- Data Ultima Alteracao ..: 17/10/2019
--   => Criacao das tabelas
--
-- PROJETO => 01 Base de Dados
--         => 05 Tabelas
--         => 01 Visoes
--
-- -----------------------------------------------------------------
/* SaraSilva_p1Logico: */

create database SaraSilva;
use SaraSilva;

CREATE TABLE DISCIPLINA (
    nome VARCHAR(50),
    idDisciplina INT auto_increment,
    sigla VARCHAR(3),
    qntCreditos INT,
    periodo ENUM('M','V', 'N'),
    constraint primary key(idDisciplina)
)Engine = InnoDB auto_increment = 1 default charset utf8;

CREATE TABLE PROFESSOR (
    matriculaFuncional INT(5),
    nome VARCHAR(50),
    sexo ENUM('F', 'M'),
    dtNascimento DATE,
    constraint primary key(matriculaFuncional)
)Engine = InnoDB default charset utf8;

CREATE TABLE preRequisitos (
    idDisciplina INT NOT NULL,
    preRequisitos VARCHAR(50),
    constraint foreign key (idDisciplina) references DISCIPLINA(idDisciplina),
    constraint PRIMARY KEY (idDisciplina, preRequisitos)
)Engine = InnoDB default charset utf8;

CREATE TABLE email (
    matriculaFuncional INT(5) NOT NULL,
    email VARCHAR(50),
    constraint PRIMARY KEY (matriculaFuncional, email),
    constraint foreign key (matriculaFuncional) references DISCIPLINA(matriculaFuncional)
)Engine = InnoDB default charset utf8;

CREATE TABLE leciona (
    idDisciplina INT,
    matriculaFuncional INT(5),
    constraint foreign key (matriculaFuncional) references DISCIPLINA(matriculaFuncional),
    constraint foreign key (idDisciplina) references DISCIPLINA(idDisciplina)
)Engine = InnoDB default charset utf8;
