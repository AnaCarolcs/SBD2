-- --------   << Aula 1 Exercicio 2 Evolucao Oracle Insert >> ------ --
--                                                                   --
--                    SCRIPT DE INSERÇÃO (DML)                       --
--                                                                   --
-- Data Criacao ..........: 26/03/2019                               --
-- Autor(es) .............: Joao Lucas Sousa Reis e                  --
--                          Ana Carolina Carvalho da Silva           --
-- Banco de Dados ........: Oracle                                   --
-- Base de Dados(nome) ...: VRVR                                     --
--                                                                   --
-- Data Ultima Alteracao ..: 25/04/2019                              --
--    + Insercao no banco de dados                                   --
--                                                                   --
-- PROJETO => 01 Base de Dados                                       --
--         => 12 Tabelas                                             --
--         => 02 Usuarios                                            --
--                                                                   --
-- ----------------------------------------------------------------- --

INSERT ALL
INTO AS_PESSOA (CPF, nome, senha) VALUES (15698742203, 'Mateus Paulo', 'eusoudouglas')
INTO AS_PESSOA (CPF, nome, senha) VALUES (66666666606, 'Takoyo Yoshida', 'batman')
INTO AS_PESSOA (CPF, nome, senha) VALUES (45698712305, 'Nuvano Cunha', 'flash2019')
INTO AS_PESSOA (CPF, nome, senha) VALUES (40980003222, 'Claudio Reis', 'gaviaoarqueiro')
INTO AS_PESSOA (CPF, nome, senha) VALUES (10954329378, 'Rodolfo da Silva', 'navelindo')
INTO AS_PESSOA (CPF, nome, senha) VALUES (13799883540, 'Gustavo Mendes', 'jhennifer')
SELECT * FROM dual;

INSERT ALL
INTO AS_GERENTE (CPF, formacao, email) VALUES (15698742203, 'Superior completo', 'mateus@gmail.com')
INTO AS_GERENTE (CPF, formacao, email) VALUES (66666666606, 'Superior completo', 'yoshidajapap@gmail.com')
INTO AS_GERENTE (CPF, formacao, email) VALUES (45698712305, 'Superior incompleto', 'barry@gmail.com')
SELECT * FROM dual;

INSERT ALL
INTO AS_EMPREGADO (CPF, matricula, rua, cidade, complemento) VALUES (40980003222, 168745932, 'Presidente Vargas', 'Taguatinga Norte', 'casa 15')
INTO AS_EMPREGADO (CPF, matricula, rua, cidade, complemento) VALUES (10954329378, 180256478, 'Av. Brasil', 'Ceilandia', 'casa 306')
INTO AS_EMPREGADO (CPF, matricula, rua, cidade, complemento) VALUES (13799883540, 178899000, 'Santos', 'Sao Paulo', 'Apartamento Vargas')
SELECT * FROM dual;

INSERT ALL
INTO AS_AREA (codigoArea, nomeArea) VALUES (626, 'Brinquedos')
INTO AS_AREA (codigoArea, nomeArea) VALUES (950, 'Vidraças')
INTO AS_AREA (codigoArea, nomeArea) VALUES (127, 'Banho e Cama')
INTO AS_AREA (codigoArea, nomeArea) VALUES (851, 'Domesticos')
INTO AS_AREA (codigoArea, nomeArea) VALUES (298, 'Eletronicos')
INTO AS_AREA (codigoArea, nomeArea) VALUES (336, 'Banho e Cama')
SELECT * FROM dual;

INSERT ALL
INTO AS_PRODUTO (codigoArea, nomeProduto, idProduto, precoUnitario) VALUES (950, 'Jogo de tabuleiro', 1156656, 16.30)
INTO AS_PRODUTO (codigoArea, nomeProduto, idProduto, precoUnitario) VALUES (127, 'Perfume', 5489712, 9.99)
INTO AS_PRODUTO (codigoArea, nomeProduto, idProduto, precoUnitario) VALUES (851, 'Carteira', 2116516, 25.90)
INTO AS_PRODUTO (codigoArea, nomeProduto, idProduto, precoUnitario) VALUES (626, 'Shampoo', 0211561, 32.00)
INTO AS_PRODUTO (codigoArea, nomeProduto, idProduto, precoUnitario) VALUES (336, 'Energetico', 0206050, 6.90)
INTO AS_PRODUTO (codigoArea, nomeProduto, idProduto, precoUnitario) VALUES (298, 'Pente', 8484156, 2.50)
SELECT * FROM dual;

INSERT ALL
INTO AS_VENDA (matriculaEmpregado, idVenda, dataVenda, preco_total) VALUES (168745932, 306, '12-06-2018', 90.24)
INTO AS_VENDA (matriculaEmpregado, idVenda, dataVenda, preco_total) VALUES (180256478, 888, '03-05-2017', 9.99)
INTO AS_VENDA (matriculaEmpregado, idVenda, dataVenda, preco_total) VALUES (180256478, 1006, '06-05-2017', 69.56)
INTO AS_VENDA (matriculaEmpregado, idVenda, dataVenda, preco_total) VALUES (178899000, 404, '02-01-2019', 125.99)
SELECT * FROM dual;

INSERT ALL
INTO AS_telefone (telefone, matricula) VALUES (985263354, 168745932)
INTO AS_telefone (telefone, matricula) VALUES (998565521, 180256478)
INTO AS_telefone (telefone, matricula) VALUES (984211036, 178899000)
SELECT * FROM dual;

INSERT ALL
INTO AS_gerencia (CPFgerente, matricula) VALUES (66666666606, 168745932)
INTO AS_gerencia (CPFgerente, matricula) VALUES (66666666606, 180256478)
INTO AS_gerencia (CPFgerente, matricula) VALUES (45698712305, 178899000)
SELECT * FROM dual;

INSERT ALL
INTO AS_realiza (matricula, idVenda) VALUES (168745932, 306)
INTO AS_realiza (matricula, idVenda) VALUES (180256478, 888)
INTO AS_realiza (matricula, idVenda) VALUES (178899000, 404)
SELECT * FROM dual;

INSERT ALL
INTO AS_possui (idVenda, idProduto, quantidade) VALUES (306, 1156656, 6)
INTO AS_possui (idVenda, idProduto, quantidade) VALUES (888, 0211561, 2)
INTO AS_possui (idVenda, idProduto, quantidade) VALUES (404, 8484156, 1)
SELECT * FROM dual;

INSERT ALL
INTO AS_pertence (idProduto, codigoArea) VALUES (1156656, 950)
INTO AS_pertence (idProduto, codigoArea) VALUES (0211561, 851)
INTO AS_pertence (idProduto, codigoArea) VALUES (8484156, 298)
SELECT * FROM dual;

INSERT ALL
INTO AS_administra (CPFgerente, codigoArea) VALUES (66666666606, 950)
INTO AS_administra (CPFgerente, codigoArea) VALUES (15698742203, 298)
INTO AS_administra (CPFgerente, codigoArea) VALUES (45698712305, 851)
SELECT * FROM dual;
