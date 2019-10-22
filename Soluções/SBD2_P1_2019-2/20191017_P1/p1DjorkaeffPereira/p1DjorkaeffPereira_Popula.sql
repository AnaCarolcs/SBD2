-- --------     << p1DjorkaeffPereira >>     ------------
--
--                    SCRIPT DE INSERE (DML)
--
-- Data Criacao ...........: 17/10/2019
-- Autor(es) ..............: Djorkaeff Alexandre Vilela Pereira
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: p1DjorkaeffPereira
--
-- Data Ultima Alteracao ..: 17/10/2019
--   => Criacao de script de popula
--
-- PROJETO => 01 Base de Dados
--         => 05 Tabelas
--         => 02 Usuarios
--         => 01 Visoes
--
-- -----------------------------------------------------------------

USE p1DjorkaeffPereira;

INSERT INTO PESSOA(identificador, nome, apelido, dataDeNascimento, sexo) VALUES
  (1, 'Djorkaeff Pereira', 'Dj', '1998-10-22', 'M'),
  (2, 'Izabella Silva', 'Iza', '2001-03-13', 'F'),
  (3, 'Valeria Vilela', 'Val', '1971-10-15', 'F');

INSERT INTO CARACTERISTICA(codigo, descricao) VALUES
  (1, 'Gosto de velejar'),
  (2, 'Sou alto(a)'),
  (3, 'Adoro pão de queijo');

INSERT INTO relacionamento(identificadorPessoa, identificadorOutraPessoa) VALUES
  (1, 2),
  (2, 3),
  (1, 3);

INSERT INTO possui(identificadorPessoa, codigoCaracteristica) VALUES
  (1, 2),
  (2, 2),
  (3, 3);

INSERT INTO email(identificadorPessoa, email) VALUES
  (1, 'djorkaeff@gmail.com'),
  (1, 'djorkaeffalexandre@gmail.com'),
  (2, 'izabella@gmail.com'),
  (3, 'valeria@gmail.com');