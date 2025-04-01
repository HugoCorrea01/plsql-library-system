CREATE OR REPLACE TRIGGER limitar_emprestimos
BEFORE INSERT ON emprestimos
FOR EACH ROW
DECLARE
  v_total NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_total
  FROM emprestimos
  WHERE usuario_id = :new.usuario_id;

  IF v_total >= 5 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Limite de empréstimos atingido.');
  END IF;
END;