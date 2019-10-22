/* Ícaro Pires de Souza Aragão 15/0129815 17/10/2019*/

-- --------     << icaroPiresP1 >>     ------------
-- 
--                    SCRIPT DE CONSULTAS (DML)
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

USE icaroPiresP1;


/*
View para o administrador poder consultar qual professor ministrará
qual disciplina e seu prerquisito.*/
CREATE VIEW V_PREREQUISITOS AS
  SELECT pr.primeiroNome, pr.ultimoNome, dis1.nome from PROFESSOR pr
      JOIN orienta o
      ON o.matriculaFuncional = pr.matriculaFuncional
    JOIN DISCIPLINA dis1
      ON dis1.idDisciplina = orienta.idDisciplina 
    JOIN precede pre
      ON pre.idDisciplina = pre.idDisciplinaPreRequisito;
SELECT * FROM V_PREREQUISITOS;

/* Um índice poderia ser criado para encontrar um professor
específico mais rápido pelo nome, se fosse desejado;
Mas no caso dessa view, não aumentaria muito o desempenho, pois não há
busca pelo primeiro nome do professor nas consultas elaboradas.*/
CREATE INDEX PROFESSOR_IDX on PROFESSOR(primeiroNome);