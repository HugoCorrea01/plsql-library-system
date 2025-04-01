-- CURSOR: Listar livros emprestados por um usuário
DECLARE
    CURSOR c_livros(p_usuario_id NUMBER) IS
        SELECT L.TITULO, E.DATA_EMPRESTIMO
        FROM EMPRESTIMOS E
        JOIN LIVROS L ON E.LIVROS_ID = L.ID
        WHERE E.USUARIO_ID = p_usuario_id AND E.STATUS = 'EM_ABERTO';

    v_titulo LIVROS.TITULO%TYPE;
    v_data   EMPRESTIMOS.DATA_EMPRESTIMO%TYPE;
BEGIN
    FOR r IN c_livros(1) LOOP
        DBMS_OUTPUT.PUT_LINE('Livro: ' || r.TITULO || ' | Empréstimo em: ' || r.DATA_EMPRESTIMO);
    END LOOP;
END;

