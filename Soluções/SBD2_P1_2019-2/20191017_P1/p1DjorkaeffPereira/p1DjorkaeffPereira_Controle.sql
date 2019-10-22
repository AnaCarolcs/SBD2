-- --------     << p1DjorkaeffPereira >>     ------------
--
--                    SCRIPT DE CONTROLE (DML)
--
-- Data Criacao ...........: 17/10/2019
-- Autor(es) ..............: Djorkaeff Alexandre Vilela Pereira
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: p1DjorkaeffPereira
--
-- Data Ultima Alteracao ..: 17/10/2019
--   => Criacao de script de controle
--
-- PROJETO => 01 Base de Dados
--         => 05 Tabelas
--         => 02 Usuarios
--         => 01 Visoes
--
-- -----------------------------------------------------------------

CREATE USER ADMIN IDENTIFIED BY 'ADMIN';

GRANT ALL PRIVILEGES ON p1DjorkaeffPereira.* TO 'ADMIN';

CREATE USER PESSOA IDENTIFIED BY 'PESSOA';

GRANT SELECT ON p1DjorkaeffPereira.* TO 'PESSOA';