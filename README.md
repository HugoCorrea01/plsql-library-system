# 📚 Sistema de Empréstimos de Livros com Oracle PL/SQL

Este projeto simula um sistema de gestão de biblioteca utilizando **PL/SQL**, a linguagem procedural do banco de dados **Oracle**. Ele abrange desde a criação das tabelas, inserção de dados, até a aplicação de regras de negócio por meio de procedures, functions, triggers e cursores.

---

## 💡 Funcionalidades

- 📖 Cadastro de livros, autores e usuários
- 🔄 Empréstimo de livros (com verificação de disponibilidade)
- ✅ Devolução de livros (com cálculo de multa por atraso)
- ⚠️ Controle de limite de empréstimos por usuário
- 📊 Relatórios com cursores e funções auxiliares
- 🔐 Estrutura segura e modular

---

## 🧠 Tecnologias utilizadas

- Oracle Database
- PL/SQL (Procedures, Functions, Triggers, Cursors)
- SQL Developer (para execução e testes)

---

## 📂 Estrutura dos Arquivos

plsql-library-system/ │ ├── create_tables.sql # Criação das tabelas do sistema ├── insert_data.sql # Inserção de dados de exemplo ├── procedures.sql # Procedures de empréstimo e devolução ├── functions.sql # Function para cálculo de multa ├── triggers.sql # Trigger para limitar empréstimos ├── cursors.sql # Cursor para relatório de livros emprestados ├── teste.sql # Blocos anônimos de teste └── README.md # Este arquivo



---

## 🚀 Como executar o projeto

1. **Crie um usuário no Oracle** (não use o SYS):
   ```sql
   CREATE USER biblioteca IDENTIFIED BY senha123;
   GRANT CONNECT, RESOURCE TO biblioteca;
Conecte-se com esse usuário no Oracle SQL Developer

Execute os scripts na ordem abaixo:

@create_tables.sql
@insert_data.sql
@functions.sql
@procedures.sql
@triggers.sql
@cursors.sql
@teste.sql
🧪 Exemplos de uso

-- Realizar empréstimo
BEGIN
    REALIZAR_EMPRESTIMO(p_livro_id => 1, p_usuario_id => 1);
END;

-- Devolver livro
BEGIN
    DEVOLVER_LIVRO(p_emprestimo_id => 1);
END;

-- Ver multa
SELECT CALCULAR_MULTA(1) AS MULTA_ATUAL FROM DUAL;
🙋‍♂️ Autor
      Desenvolvido por Hugo Farranha
💼 GitHub: https://github.com/hugocorrea01