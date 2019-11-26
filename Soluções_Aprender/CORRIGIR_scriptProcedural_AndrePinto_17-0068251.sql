-- --------     << Projeto Pessoal >>     ------------
-- 
--                    SCRIPT PROCEDURAL (DDL)
-- 
-- Data Criacao ...........: 04/11/2019
-- Autor(es) ..............: Andre Lucas de Sousa Pinto
-- Banco de Dados .........: MySQL
-- Base de Dados(nome) ....: agenda
-- 
-- PROJETO => 01 Base de Dados
--         => 04 Tabelas
--         => 03 Funcoes
--         => 01 Procedimento
-- 
-- -----------------------------------------------------------------

USE agenda;

DROP FUNCTION IF EXISTS qtdPessoa;
DROP PROCEDURE IF EXISTS qtdTelefone;
DROP FUNCTION IF EXISTS qtdProduto;
DROP FUNCTION IF EXISTS qtdFinanceira;

-- 1) Crie uma função que conta quantas tuplas tem na tabela PESSOA.
DELIMITER $$
CREATE FUNCTION qtdPessoa()
RETURNS INT
	BEGIN
		DECLARE qtd INT;
		SELECT COUNT(*) INTO qtd FROM pessoa;
	RETURN qtd;
END $$
DELIMITER;

-- 2) Elabore um procedimento que conte quantos telefones tem uma pessoa específica.
DELIMITER $$
CREATE PROCEDURE qtdTelefone(IN idPessoa INT)
	BEGIN
		SELECT COUNT(*) AS 'Quantidade telefones'FROM telefone
		WHERE telefone.idPessoa = idPessoa;
END $$
DELIMITER;

-- 3) Crie uma função que mostre a quantidade de produtos específico que será solicitado pelo nome do produto.
DELIMITER $$
CREATE FUNCTION qtdProduto(nome VARCHAR(80)) RETURNS INT
	BEGIN
		DECLARE total INT;
		SELECT SUM(qtde) INTO total FROM produtos
		WHERE produtos.nome = nome;
	RETURN total;
END $$
DELIMITER;

-- 4) Faça uma função que calcule para um produto específico a quantidade financeira em estoque que está armazenado nessa base de dados (total em valor financeiro R$).
DELIMITER $$
CREATE FUNCTION qtdFinanceira(produto INT) RETURNS INT
	BEGIN
		DECLARE total FLOAT;
		SELECT SUM(preco * qtde) INTO total FROM produtos
		WHERE idProduto = produto;
	RETURN total;
END $$
DELIMITER;

SELECT qtdPessoa() AS 'Total Pessoas';
CALL qtdTelefone(2);
SELECT qtdProduto('Sabonete') AS 'Quantidade do item';
SELECT qtdFinanceira(3) AS 'Quantidade Financeira';
