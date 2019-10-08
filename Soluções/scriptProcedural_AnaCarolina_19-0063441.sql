-- ---------------- << SCRIPT PROCEDURAL >>  -------------------- --
--                                                                --
--                     SCRIPT PROCEDURAL                          --
--                                                                --
-- DATE Criacao ...........: 29/05/2019                           --
-- Autor(es) ..............: Ana Carolina Carvalho                --
--                           João Lucas Sousa Reis                --
-- Banco de Dados .........: MySQL                                --
-- Banco de Dados(nome) ...: agenda                               --
--                                                                --
-- -----------------------------------------------------------------

USE agenda;

-- Questão 01

DELIMITER $$

CREATE FUNCTION contar_pessoa() RETURNS INTEGER
BEGIN

  DECLARE
    v_contadorPessoas INTEGER;

  SELECT COUNT(*) INTO v_contadorPessoas
      FROM pessoa;

  RETURN v_contadorPessoas;
END; $$
DELIMITER;

SELECT contar_pessoa() FROM DUAL;

-- Questão 02

DELIMITER $$

DROP PROCEDURE telefonePessoa; $$
CREATE PROCEDURE telefonePessoa(pessoa INT (11))
BEGIN
  SELECT COUNT(*) AS 'quant_telefone'
  FROM telefone
  WHERE idPessoa = pessoa
  GROUP BY idPessoa;

END; $$

DELIMITER ;

SET @idPessoa = 2;
CALL telefonePessoa(@idPessoa);
SELECT @idPessoa;

-- Questão 03
DELIMITER $$

CREATE FUNCTION quant_produtos(produto varchar(80)) returns integer
BEGIN
  return (SELECT qtde
          FROM produtos
          WHERE nome = produto);
END $$

DELIMITER ;

SELECT quant_produtos() FROM DUAL;

-- Questão 04

DELIMITER $$

CREATE FUNCTION calc_prod(produto int(11)) returns float
BEGIN
  return(SELECT preco*qtde
         FROM produtos
         where idProduto = produto);
END $$

DELIMITER;

SELECT calc_prod(idProduto) FROM produtos;

