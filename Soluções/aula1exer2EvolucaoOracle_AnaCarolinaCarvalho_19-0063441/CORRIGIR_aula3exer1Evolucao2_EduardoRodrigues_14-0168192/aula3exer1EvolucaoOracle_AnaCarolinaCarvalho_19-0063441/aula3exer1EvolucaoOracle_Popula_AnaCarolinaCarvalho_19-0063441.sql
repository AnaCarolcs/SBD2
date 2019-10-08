-- --------            << aaula3exer1EvolucaoOracle >>  ------------ --
--                                                                   --
--                    SCRIPT DE MANIPULACAO (DML)                    --
--                                                                   --
-- Data Criacao ..........: 02/10/2019                               --
-- Autor(es) .............: Daniel Maike Mendes Gonçalves 			 --
-- 							Eduardo Júnio Veloso Rodrigues           --
--                          Ana Carolina Carvalho                    --
-- Banco de Dados ........: MySQL                                    --
-- Base de Dados(nome) ...: aula3exer1EvolucaoOracle                 --
--                                                                   --
-- Data Ultima Alteracao ..: 07/10/2019                              --
--    + Inserção de dados                                            --
--                                                                   --
-- PROJETO => 1 Base de Dados                                        --
--         => 3 Usuarios						                     --
--         => 5 Tabelas                                              --
--         => 1 View                                                 --
-- ----------------------------------------------------------------- --

USE aula3exer1EvolucaoOracle;


INSERT ALL
INTO AS_PLANTONISTA(matriculaFuncional, nomeCompleto, sexo) VALUES(4231432, 'Neymar Junior dos Santos', 'M')
INTO AS_PLANTONISTA(matriculaFuncional, nomeCompleto, sexo) VALUES(51253152, 'Rivaldo Martins Mendes', 'M')
INTO AS_PLANTONISTA(matriculaFuncional, nomeCompleto, sexo) VALUES(124344, 'Everton Gabriel Oliveira', 'M')
SELECT * FROM dual;

INSERT ALL
INTO AS_ESPECIALIDADE (codigo, nomeEspecialidade) VALUES (123, 'Cardiologia')
INTO AS_ESPECIALIDADE (codigo, nomeEspecialidade) VALUES (33, 'Endocrinologia')
INTO AS_ESPECIALIDADE (codigo, nomeEspecialidade) VALUES (44, 'Ginecologia')
SELECT * FROM dual;

INSERT ALL
INTO AS_possui (matriculaFuncional, codigo) VALUES (4231432, 123)
INTO AS_possui (matriculaFuncional, codigo) VALUES (4231432, 33)
INTO AS_possui (matriculaFuncional, codigo) VALUES (51253152, 44)
SELECT * FROM dual;

INSERT ALL
INTO AS_SETOR (codigoSetor, nomeSetor) VALUES (321, 'Ambulatorio')
INTO AS_SETOR (codigoSetor, nomeSetor) VALUES (4243,'Centro Cirurgico' )
INTO AS_SETOR (codigoSetor, nomeSetor) VALUES (423, 'Pronto Atendimento')
SELECT * FROM dual;

INSERT ALL
INTO atende (dthora, codigoSetor, matriculaFuncional) VALUES ('2019-12-09 09:00', '321', '4231432')
INTO atende (dthora, codigoSetor, matriculaFuncional) VALUES ('2019-12-09 09:00', '4243', '51253152')
INTO atende (dthora, codigoSetor, matriculaFuncional) VALUES ('2019-12-11 10:00', '423', '124344')
INTO atende (dthora, codigoSetor, matriculaFuncional) VALUES ('2019-12-12 20:00', '321', '51253152')
SELECT * FROM dual;