-- TESTES: Execução das Procedures criadas

BEGIN
    REALIZAR_EMPRESTIMO(p_livro_id => 1, p_usuario_id => 1);
END;
BEGIN
    DEVOLVER_LIVRO(p_emprestimo_id =>21 );
END;