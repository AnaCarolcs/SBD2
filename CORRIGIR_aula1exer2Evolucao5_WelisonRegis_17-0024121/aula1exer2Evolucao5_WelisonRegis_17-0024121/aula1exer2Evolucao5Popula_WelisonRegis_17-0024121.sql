-- --------     << CONTROLE DE VENDAS >>     ------------
-- 
--                    SCRIPT DE POPULA (DML)
-- 
-- Data Criacao ...........: 26/08/2019
-- Autor(es) ..............: Welison Lucas Almeida Regis
-- Banco de Dados .........: MySQL
-- Base de Dados(nome) ....: aula1exer2Evolucao5
-- 
-- Data Ultima Alteracao ..: 15/09/2019
--   => Criacao do script que popula
-- 
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
-- 
-- -----------------------------------------------------------------

USE aula1exer2Evolucao5;

INSERT INTO PESSOA VALUES
	-- GERENTES
	(02376933321, 'João Alencar da Silva', 'encryptedpass'),
    (01231231211, 'Maria Rosa da Fonseca', 'senhadaRosa'),
    (92137123211, 'João Guilherme Toscano', 'Toscano123@'),
    -- EMPREGADOS
    (12390120932, 'Waldemiro Santos Souza', 'valdinho1@'),
    (93127381232, 'Guilherme Santos de Alcantara', 'alcantara1313'),
    (76152812312, 'João Batista Silva Neto', 'silvinhaneto@');

INSERT INTO GERENTE VALUES
	(02376933321, 'superior', 'joaoalencar12@gmail.com'),
    (01231231211, 'fundamental', 'mariafonseca99@uol.com.br'),
    (92137123211, 'médio', 'joaoguigui@yahoo.com.br');

INSERT INTO EMPREGADO VALUES
	(9090123, 12390120932, 33, 'Itamaracá', 'Setor Sul', 'Gama', 'DF', 72000000),
    (9090124, 93127381232, 12, 'Santo Antônio', 'Zona Leste', 'Ceilândia', 'DF', 31241200),
    (9090125, 76152812312, 13, 'Tiradentes', 'Setor Norte', 'Santa Maria', 'DF', 89132122);

INSERT INTO telefone VALUES
	(9090123, 55061999911234),
    (9090124, 55061987172312),
    (9090125, 55061997318231);

INSERT INTO supervisiona VALUES
	(02376933321, 9090123),
    (01231231211, 9090124),
    (92137123211, 9090125);

INSERT INTO AREA VALUES
	(1, 02376933321, 'Eletrodoméstico'),
    (2, 01231231211, 'Informática'),
    (3, 92137123211, 'Papelaria');

INSERT INTO PRODUTO VALUES
	(1, 1, 'Máquina de Lavar Brastemp 11kg'),
    (2, 2, 'Inspiron 15 3000'),
    (3, 3, 'Papel Sulfite 75g Alcalino 210x297 A4 500F'),
    (4, 1, 'Notebook alienware 16GB, core i9');

INSERT INTO VENDA VALUES
	(1, '2019-08-01 08:00:06', 9090123),
    (2, '2019-08-01 10:10:01', 9090124),
    (3, '2019-08-01 11:11:05', 9090125),
    (4, '2019-08-02 12:00:00', 9090123);

INSERT INTO contem VALUES
	(1, 1, 2, 1500.00),
    (2, 2, 10, 2000.00),
    (3, 3, 50, 20.00),
    (4, 1, 2, 1500.00),
    (4, 4, 3, 18000.00);