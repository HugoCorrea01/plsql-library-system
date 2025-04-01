-- Inserir autores
INSERT INTO AUTORES (NOME) VALUES ('Machado de Assis');
INSERT INTO AUTORES (NOME) VALUES ('J.K. Rowling');

-- Inserir livros
INSERT INTO LIVROS (TITULO, AUTOR_ID) VALUES ('Dom Casmurro', 1);
INSERT INTO LIVROS (TITULO, AUTOR_ID) VALUES ('Harry Potter', 2);

-- Inserir usuários
INSERT INTO USUARIOS (NOME) VALUES ('João Silva');
INSERT INTO USUARIOS (NOME) VALUES ('Maria Souza');
-- Inserir mais livros e usuários
INSERT INTO LIVROS (TITULO, AUTOR_ID) VALUES ('Quincas Borba', 1);
INSERT INTO USUARIOS (NOME) VALUES ('Carlos Alberto');