-- --------     << aula3exer1EvolucaoOracle >>     ------------
-- 
--                    SCRIPT DE MANIPULACAO (DML)
-- 
-- date Criacao ...........: 07/10/2019
-- Autor(es) ..............: Henrique Martins de Messias
-- Banco de Dados .........: Oracle
-- Base de Dados(nome) ....: aula3exer1EvolucaoOracle
-- 
-- date Ultima Alteracao ..: 07/10/2019
--   => Criacao da View
-- 
-- PROJETO => 01 Base de Dados
--         => 04 Tabelas
--         => 03 Usuarios
--         => 01 Visao 
--         => 03 Sequences
-- 
-- -----------------------------------------------------------------

-- View que mostra os horários ocupados por algum plantonista em cada setor
CREATE OR REPLACE VIEW V_HORARIOS (setor, datahora, plantonista) AS
SELECT s.nomeSetor, a.datahora, p.nome
FROM HMM_SETOR s JOIN HMM_alocado a ON a.idSetor = s.idSetor JOIN HMM_PLANTONISTA p ON a.matricula = p.matricula
ORDER BY s.nomeSetor, a.datahora, p.nome;
