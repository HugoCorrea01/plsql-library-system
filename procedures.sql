-- PROCEDURE: REALIZAR_EMPRESTIMO

CREATE OR REPLACE PROCEDURE REALIZAR_EMPRESTIMO(
    p_livro_id IN NUMBER,
    p_usuario_id IN NUMBER
) IS
    v_disponivel CHAR(1);
BEGIN
    SELECT DISPONIVEL INTO v_disponivel FROM LIVROS WHERE ID = p_livro_id;

    IF v_disponivel = 'N' THEN
        RAISE_APPLICATION_ERROR(-20001, 'Livro indisponível para empréstimo.');
    END IF;

    INSERT INTO EMPRESTIMOS (LIVROS_ID, USUARIO_ID)
    VALUES (p_livro_id, p_usuario_id);

    UPDATE LIVROS SET DISPONIVEL = 'N' WHERE ID = p_livro_id;
    
    DBMS_OUTPUT.PUT_LINE('Empréstimo realizado com sucesso.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;

-- Devolver_livro
CREATE OR REPLACE PROCEDURE DEVOLVER_LIVRO(
    p_emprestimo_id IN NUMBER
) IS
    v_data_emprestimo DATE;
    v_dias_atraso NUMBER;
    v_multa NUMBER(6,2);
    v_livro_id NUMBER;
BEGIN
    SELECT DATA_EMPRESTIMO, LIVROS_ID INTO v_data_emprestimo, v_livro_id
    FROM EMPRESTIMOS WHERE ID = p_emprestimo_id;

    v_dias_atraso := TRUNC(SYSDATE - v_data_emprestimo) - 7; -- prazo de 7 dias
    IF v_dias_atraso > 0 THEN
        v_multa := v_dias_atraso * 2; -- R$2 por dia de atraso
    ELSE
        v_multa := 0;
    END IF;

    UPDATE EMPRESTIMOS
    SET DATA_DEVOLUCAO = SYSDATE,
        STATUS = 'DEVOLVIDO',
        MULTA = v_multa
    WHERE ID = p_emprestimo_id;

    UPDATE LIVROS SET DISPONIVEL = 'S' WHERE ID = v_livro_id;

    DBMS_OUTPUT.PUT_LINE('Livro devolvido. Multa: R$' || v_multa);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;