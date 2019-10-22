/* Ícaro Pires de Souza Aragão 15/0129815 17/10/2019*/

-- --------     << icaroPiresP1 >>     ------------
-- 
--                    SCRIPT DE POPULA (DML)
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

INSERT INTO PROFESSOR(primeiroNome, ultimoNome, dataNascimento, sexo) VALUES
  ('Icaro', 'Aragao', '1997-08-26', 'M'),
  ('Sara', 'Silva', '1997-01-03', 'F'),
  ('Luiz', 'Henrique', '2005-05-21', 'M');

INSERT INTO CURSO(nomeCurso, classificacao) VALUES
  ('Ciencia da Computacao', 'G'),
  ('Machine Learning', 'E'),
  ('Matematica', 'G');

INSERT INTO DISCIPLINA(nome, sigla, creditos, periodo) VALUES
  ('Calculo 1', 'C1', 6, 'M'),
  ('Calculo 2', 'C2', 6, 'N'),
  ('Calculo 3', 'C3', 6, 'M'),
  ('Calculo 4', 'C4', 6, 'M');

INSERT INTO email(matriculaFuncional, email) VALUES
  (1, 'icaropsa@gmail.com'),
  (2, 'sarasilva@gmail.com'),
  (3, 'luizhenrique@gmail.com');

INSERT INTO precede(idDisciplina, idDisciplinaPreRequisito) VALUES
  (2, 1),
  (3, 2),
  (4, 3);

INSERT INTO formado(idCurso, matriculaFuncional) VALUES
  (1, 1),
  (2, 2),
  (3, 3);

INSERT INTO orienta(matriculaFuncional, idDisciplina) VALUES
  (1, 1),
  (2, 2),
  (3, 3);