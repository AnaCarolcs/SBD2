-- --------     << PESSOA >>     ------------
--
--                    SCRIPT DE CONTROLE
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

-- Controle:
use anasilva;

-- administrador: possui todos os privilégios sobre essa base de dados.

CREATE USER 'admin'@'localhost' IDENTIFIED BY 'adm123';
GRANT ALL PRIVILEGES ON anasilva.* TO 'admin'@'localhost';

-- pessoa: possui todos os privilégios de consulta sobre a base de dados.

CREATE USER 'pessoa'@'localhost' IDENTIFIED BY 'pessoa123';
GRANT SELECT ON anasilva.* TO 'pessoa'@'localhost';
