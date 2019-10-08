-- ---------------     << CONTROLE DE VENDAS >>     -------------------
--                                                                   --
--                    SCRIPT CONTROLE (DCL)                          --
--                                                                   --
-- Data Criacao ..........: 20/08/2019                               --
-- Autor(es) .............: Welison Lucas Almeida Regis              --
-- Banco de Dados ........: MySQL                                    --
-- Base de Dados(nome) ...: aula1exer2Evolucao5                      --
--                                                                   --
-- Data Ultima Alteracao ..: 15/09/2019                              --
--    + Adiciona script de controle da base de dados                 --
--                                                                   --
-- PROJETO => 01 Base de Dados                                        --
--         => 09 Tabelas                                              --
--                                                                   --
-- ----------------------------------------------------------------- --

USE aula1exer2Evolucao5;

-- cria usuários para desempenharem as atividades de controle no banco
CREATE USER 'welison_regis' IDENTIFIED BY 'WalleDeBancos1@9';
CREATE USER 'lucio_costa' IDENTIFIED BY 'LucinhoChan1@7';

-- administrador: possui todos os privilégios sobre essa base de dados somente;
GRANT ALL PRIVILEGES ON aula1exer2Evolucao5.* TO 'welison_regis';

-- usuario: possui o privilégio de consulta de dados sobre a base de dados desse projeto somente.
GRANT SELECT ON aula1exer2Evolucao5.* TO 'lucio_costa';
