-- --------     << PESSOA >>     ------------
--
--                    SCRIPT DE POPULA
--
-- Data Criacao ...........: 17/10/2019
-- Autor(es) ..............: Ana Carolina Carvalho
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: anasilva
--
-- Data Ultima Alteracao ..: 17/10/2019
--
--
-- PROJETO => 01 Base de Dados
--         => 05 Tabelas
--         => 02 Usuarios
--
-- ----------------------------------------------------

-- Popula:

USE anasilva;

INSERT PESSOA (idPessoa, pNome, nNome, apelido, idade, sexo, dtNascimento,email) VALUES
    ('1', 'Ana', 'Carvalho', 'Carol', '23', 'F', '23-08-1996','ana@email.com'),
    ('2', 'Rafael', 'Silva', 'Rafa', '20', 'M', '17-01-1998','rafa@email.com'),
    ('3', 'Maria', 'Santos', 'Mari', '29', 'F', '23-08-1990','maria@email.com');

INSERT CARACTERISTICA (idCaracteristica, pessoal, interesse) VALUES
    ('10', 'amigos', 'corrida'),
    ('11', 'namoro', 'jogos'),
    ('12', 'amigas', 'croche');
