/* Ícaro Pires de Souza Aragão 15/0129815 17/10/2019*/

-- --------     << icaroPiresP1 >>     ------------
-- 
--                    SCRIPT DE CRIACAO (DDL)
-- 
-- Data Criacao ...........: 21/03/2018
-- Autor(es) ..............: Ícaro Pires de Souza Aragão
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: icaroPiresP1
-- 
-- Data Ultima Alteracao ..: 17/10/2019
--   => Criacao de nova tabela
-- 
-- PROJETO => 01 Base de Dados
--         => 07 Tabelas
--         => 02 Usuarios
--         => 01 Visoes
--         => 01 Indice
-- 
-- -----------------------------------------------------------------

CREATE DATABASE icaroPiresP1;
USE icaroPiresP1;

CREATE TABLE PROFESSOR (
    matriculaFuncional INTEGER NOT NULL AUTO_INCREMENT,
    primeiroNome VARCHAR(50) NOT NULL,
    ultimoNome VARCHAR(50) NOT NULL,
    dataNascimento DATE NOT NULL,
    sexo ENUM('M', 'F')  NOT NULL,

    CONSTRAINT PROFESSOR_PK PRIMARY KEY (matriculaFuncional)
)Engine=InnoDB;

CREATE TABLE CURSO (
    idCurso INTEGER NOT NULL AUTO_INCREMENT,
    nomeCurso VARCHAR(100)  NOT NULL,
    classificacao VARCHAR(100)  NOT NULL,

    CONSTRAINT CURSO_PK PRIMARY KEY (idCurso)
)Engine=InnoDB;

CREATE TABLE DISCIPLINA (
    idDisciplina INTEGER NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100)  NOT NULL,
    sigla VARCHAR(10)  NOT NULL,
    creditos INTEGER  NOT NULL,
    periodo VARCHAR(1)  NOT NULL,

    CONSTRAINT DISCIPLINA_PK PRIMARY KEY(idDisciplina)
)Engine=InnoDB;

CREATE TABLE email (
    email VARCHAR(100)  NOT NULL,
    matriculaFuncional INTEGER NOT NULL,

    CONSTRAINT email_PROFESSOR_FK FOREIGN KEY (matriculaFuncional) REFERENCES PROFESSOR(matriculaFuncional) ON DELETE RESTRICT ON UPDATE RESTRICT
)Engine=InnoDB;

CREATE TABLE precede (
    idDisciplina INTEGER  NOT NULL,
    idDisciplinaPreRequisito INTEGER NOT NULL,

    CONSTRAINT precede_DISCIPLINA_FK FOREIGN KEY (idDisciplina) REFERENCES DISCIPLINA(idDisciplina) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT precede_DISCIPLINA_PREREQUISITO_FK FOREIGN KEY (idDisciplinaPreRequisito) REFERENCES DISCIPLINA(idDisciplina) ON DELETE RESTRICT ON UPDATE RESTRICT

)Engine=InnoDB;

CREATE TABLE formado (
    idCurso INTEGER  NOT NULL,
    matriculaFuncional INTEGER NOT NULL,

    CONSTRAINT formado_CURSO_FK FOREIGN KEY (idCurso) REFERENCES CURSO(idCurso) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT formado_PROFESSOR_FK FOREIGN KEY (matriculaFuncional) REFERENCES PROFESSOR(matriculaFuncional) ON DELETE RESTRICT ON UPDATE RESTRICT
)Engine=InnoDB;

CREATE TABLE orienta (
    matriculaFuncional  INTEGER NOT NULL,
    idDisciplina INTEGER NOT NULL,

  CONSTRAINT orienta_PROFESSOR_FK FOREIGN KEY (matriculaFuncional) REFERENCES PROFESSOR(matriculaFuncional) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT orienta_DISCIPLINA_FK FOREIGN KEY (idDisciplina) REFERENCES DISCIPLINA(idDisciplina) ON DELETE RESTRICT ON UPDATE RESTRICT

)Engine=InnoDB;