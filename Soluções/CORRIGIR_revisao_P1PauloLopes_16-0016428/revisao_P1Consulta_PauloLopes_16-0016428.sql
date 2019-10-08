-- -------------------   << REVISAO P1 >>    -------------------- --
--                                                                --
--                       SCRIPT DE CONSULTA                       --
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

-- Consulta de quais os projetos mais caros
SELECT p.idProjeto AS N_Projeto, sum(a.valorUnitario) AS Valor
  FROM PROJETO p
  INNER JOIN ATUA a ON (
    p.idProjeto = a.projeto
  )
  GROUP BY p.idProjeto
  ORDER BY 2 desc, 1 asc;

-- Consulta quanto um profissional ganha
SELECT p.matricula AS Matricula, p.nomeCompleto AS Nome_Completo, sum(a.valorUnitario) AS Pagamento
  FROM PROFISSIONAL p
  INNER JOIN ATUA a ON (
    p.matricula = a.profissional
  )
  WHERE p.matricula = 102
  GROUP BY a.profissional;