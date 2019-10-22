/* Ícaro Pires de Souza Aragão 15/0129815 17/10/2019*/
-- --------     << icaroPiresP1 >>     ------------
-- 
--                    SCRIPT DE CONTROLE (DDL)
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

create user ADMIN identified by 'admini';
grant all privileges on icaroPiresP1.* to ADMIN;


create user PESSOA identified by 'people';
grant select on icaroPiresP1.* to PESSOA;