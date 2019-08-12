-- -------------------   << REVISAO P1 >>    -------------------- --
--                                                                --
--                     SCRIPT DE POPULA (DDL)                     --
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

INSERT INTO PROFISSIONAL (nomeCompleto, especialidade) VALUES
 ('Rui Moreira', 'Médico'),
 ('Carlos Moreira', 'Engenheiro'),
 ('Ricardo Rogério', 'Professor');

INSERT INTO CLIENTE VALUES
 ('CNPJ', 66639056000107, 'Pedro Paulo'),
 ('CPF', 09876543212, 'Marcos Vinicius'),
 ('CEP', 78908765, 'Lar de Idosos');

INSERT INTO telefone VALUES
 ('CNPJ', 66639056000107, 5561987654321),
 ('CPF', 09876543212, 5562943128756),
 ('CEP', 78908765, 5511998897667);

INSERT INTO PROJETO (cliente_tipoDocumento, cliente_numeroDocumento, dtContrato) VALUES
 ('CNPJ', 66639056000107, '2014-02-01'),
 ('CPF', 09876543212, '2014-02-02'),
 ('CEP', 78908765, '2015-02-03');

INSERT INTO  atua VALUES
 (1, 101, 600.00),
 (2, 102, 500.00),
 (3, 103, 400.00),
 (3, 102, 200.00);