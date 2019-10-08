/*
-- ----------------     << CONTROLE DE VENDAS >>     ------------------
--                                                                   --
--                    SCRIPT POPULA (DML)                            --
--                                                                   --
-- Data Criacao ..........: 20/08/2019                               --
-- Autor(es) .............: Welison Lucas Almeida Regis              --
-- Banco de Dados ........: MySQL                                    --
-- Base de Dados(nome) ...: aula1exer2Evolucao5                      --
--                                                                   --
-- Data Ultima Alteracao ..: 15/09/2019                              --
--    + Ajuste das consultas A, B, C e D                             --
--    + Criacao de duas views importantes                            --
--                                                                   --
-- PROJETO => 01 Base de Dados                                        --
--         => 09 Tabelas                                              --
--                                                                   --
-- ----------------------------------------------------------------- --
*/

USE aula1exer2Evolucao5;


-- CONSULTAS ATRAVÉS DE VIEWS


-- A) Crie uma view que possibilite visualizar todos os gerentes 
-- (cpf e email) e seus empregados supervisionados (matricula e 
-- endereço em linha única) ordenados pelo cpf do gerente e matricula 
-- do empregado, respectivamente, em ordem crescente.

-- Tem-se como visão estratégica o controle dos gerentes pertencentes
-- a empresa e a percepção de quais empregados são supersionados por eles,
-- pois, assim, possibilitará ter uma visão geral dos gerentes e empregados.

CREATE VIEW v_GERENTE_EMPREGADO AS
SELECT G.cpf, G.email, E.matricula,
CONCAT(E.cep, ', ', E.uf, ', ', E.cidade, ', ', E.bairro, ', ', E.logradouro, ', ', E.numero)
	FROM supervisiona AS s
		INNER JOIN GERENTE AS G
			ON s.cpf = G.cpf
		INNER JOIN EMPREGADO AS E
			ON s.matricula = E.matricula
	ORDER BY G.cpf, E.matricula;

-- B) Crie uma view que possibilite ver os produtos (código e nome)
-- e a área (cpf do gerente e nome da área) ao qual ele pertence. 
-- Ordene o resultado em ordem alfabética crescente de nome do produto.

-- Tem-se como estratégia a possibilidade de verificar os produtos
-- disponibilizados pela empresa para que seja possível, se for o
-- caso, demandar novos produtos para comercialização em dada área.

CREATE VIEW v_PRODUTO_AREA AS
SELECT P.codProduto, P.nomeProduto, A.cpf, A.nomeArea
	FROM PRODUTO AS P
		INNER JOIN AREA AS A
			ON P.idArea = A.idArea
	ORDER BY P.nomeProduto;


-- CONSULTAS


-- A)Consultar todas as vendas feitas por um empregado específico
--   definido pela sua chave primária na pesquisa;

SELECT *
  FROM VENDA
 WHERE matricula = 9090123  -- matricula do empregado especifico
 ORDER BY dtVenda;

-- B)Relacionar todos os dados de uma venda com todas as informações
--   dos produtos comercializados por esta venda específica;

SELECT c.idVenda, v.dtVenda, pr.codProduto, pr.nomeProduto, c.precoUnitario, c.quantidade, c.quantidade * c.precoUnitario AS precoTotal
  FROM contem as c
       INNER JOIN PRODUTO AS pr
          ON c.codProduto = pr.codProduto
       INNER JOIN VENDA AS v
          ON v.idVenda = c.idVenda
 WHERE c.idVenda = 4    -- codigo da venda especifica
 ORDER BY pr.nomeProduto;

-- C) Mostrar todos os empregados da empresa que não sejam gerentes
--   em ordem alfabética crescente;

SELECT p.nome, p.cpf, e.matricula
  FROM EMPREGADO e
       INNER JOIN PESSOA AS p
          ON e.cpf = p.cpf
       LEFT JOIN GERENTE AS g
          ON p.cpf = g.cpf
 WHERE g.cpf IS NULL
 ORDER BY p.nome;

-- D) Consultar e mostrar a quantidade de CADA produto que foi
--   vendida por esta empresa.

SELECT P.codProduto AS `Código`, P.nomeProduto AS `Nome`, SUM(c.quantidade) AS `Quantidade`
	FROM PRODUTO P
		INNER JOIN contem c
			ON P.codProduto = c.codProduto
	GROUP BY P.codProduto
	ORDER BY P.nomeProduto;