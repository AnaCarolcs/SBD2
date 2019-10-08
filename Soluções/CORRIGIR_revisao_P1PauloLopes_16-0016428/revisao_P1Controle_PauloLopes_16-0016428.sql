-- -------------------   << REVISAO P1 >>    -------------------- --
--                                                                --
--                       SCRIPT DE CONTROLE                       --
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

USE bdEscola;

--  administrador: possui todos os privilégios sobre essa base de dados
--                 somente;

CREATE USER ADMINISTRADOR
  IDENTIFIED BY "admin123";

GRANT ALL PRIVILEGES
  ON aula1Exer2Evol3Contr.*
  TO ADMINISTRADOR;

-- profissional: possui os privilégios de consulta de dados sobre esta base de
--   dados somente, nas tabelas PROFISSIONAL, atua, PROJETO e CLIENTE somente;

CREATE USER PROFISSIONAL
  IDENTIFIED BY "profissional123";

GRANT USAGE, SELECT
  ON bdEscola.profissional
  TO PROFISSIONAL;

GRANT USAGE, SELECT
  ON bdEscola.atua
  TO PROFISSIONAL;

GRANT USAGE, SELECT
  ON bdEscola.projeto
  TO PROFISSIONAL;

GRANT USAGE, SELECT
  ON bdEscola.cliente
  TO PROFISSIONAL;