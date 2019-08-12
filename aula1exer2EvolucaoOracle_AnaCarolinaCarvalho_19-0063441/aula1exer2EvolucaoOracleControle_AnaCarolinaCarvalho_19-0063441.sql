-- -------- << Aula 1 Exercicio 2 Evolucao Oracle Controle >> ---- --
-- 								   --
-- 			         SCRIPT DE CONTROLE
--
-- Data Criacao ..........: 02/04/2019
-- Autor(es) .............: Ana Carolina Carvalho da Silva
-- Banco de Dados ........: MySQL
-- Base de Dados(nome) ...: bdAula1Exer2Evol3
--
-- Data Ultima Alteracao ..: 25/04/2019
-- + Criar usuarios do tipo administrador e usuario de consulta
--
-- PROJETO => 01 Base de Dados
--         => 12 Tabelas
--         => 02 Usuarios
--
-- --------------------------------------------------------------- --

-- ADMINISTRADOR
--      possui todos os privilegios sobre essa base de
--      dados somente:

 CREATE USER 'administrador'
   IDENTIFIED BY 'secret123';

 GRANT ALL PRIVILEGES ON bdAula1Exer2Evol3.* TO 'administrador';

-- USUARIO
--      possui todos os privilegios de consulta de dados sobre
--      a base de dados desse projeto somente:

 CREATE USER 'usuario'
   IDENTIFIED BY 'raphael123';

 GRANT SELECT ON bdAula1Exer2Evol3.* TO 'usuario';
