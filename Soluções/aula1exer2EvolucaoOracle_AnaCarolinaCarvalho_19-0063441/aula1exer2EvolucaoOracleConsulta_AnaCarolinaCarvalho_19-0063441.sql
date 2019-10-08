-- --------   << Aula 1 Exercicio 2 Evolucao Oracle consulta >> ---- --
--                                                                   --
--                    SCRIPT DE CONSULTA(DML)                        --
--                                                                   --
-- Data Criacao ..........: 26/03/2018                               --
-- Autor(es) .............: Ana Carolina Carvalho da Silva           --  
-- Banco de Dados ........: MySQL                                    --
-- Base de Dados(nome) ...: bdAula1Exer2Evol3                        --
--                                                                   --
-- Data Ultima Alteracao ..: 25/04/2019                              --
--    + Gerar consultas                                              --
--                                                                   --
-- PROJETO => 01 Base de Dados                                       --
--         => 12 Tabelas                                             --
--         => 02 Usuarios                                            --
--                                                                   --
-- ----------------------------------------------------------------- --

USE bdAula1Exer2Evol3;

-- A) Consultar todas as vendas feitas por um empregado
--    específico definido pela sua chave primária;

SELECT matriculaEmpregado, preco_Total, dataVenda, idVenda
  FROM AS_VENDA
 WHERE matriculaEmpregado = '180256478';

-- ===================================================================--


-- B) Relacionar todos os dados de uma venda com todas as
--    informações dos produtos comercializados por esta venda específica;

SELECT v.dataVenda, p.idVenda, p.idProduto, p.quantidade, v.preco_total
  FROM AS_possui p, AS_VENDA v
 WHERE p.idVenda = v.idVenda
 ORDER BY p.idVenda, p.idProduto;

-- ===================================================================--


-- C) Mostrar todos os empregados da empresa que não sejam
--    gerentes em ordem alfabética crescente;

SELECT p.nome, p.CPF, e.matricula
  FROM AS_EMPREGADO e
       INNER JOIN AS_PESSOA p ON e.CPF = p.CPF
       LEFT JOIN AS_GERENTE g ON p.CPF = g.CPF
 WHERE g.CPF IS NULL
 ORDER BY p.nome;

-- ===================================================================--


-- D) Consultar e mostrar a quantidade de cada produto que foi vendido
--    por esta empresa;

 SELECT pr.nomeProduto PRODUTO, pr.idProduto CODIGO, sum(quantidade) QTDE
FROM AS_possui p join AS_PRODUTO pr
on p.idProduto = pr.idProduto
group by pr.idProduto,nomeProduto
ORDER BY pr.nomeProduto;
