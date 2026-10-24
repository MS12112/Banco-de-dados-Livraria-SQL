# Sistema de Biblioteca - SQL

Projeto prático para estudo de SQL e modelagem de banco de dados.

## Objetivo

Simulação de um sistema de biblioteca contendo cadastro de usuários, livros, autores, editoras e controle de empréstimos.

## Diagrama Entidade Relacionamento (DER)

![DER do Sistema de Biblioteca](Sistema_Biblioteca/diagrama_der_biblioteca.png)

## Tecnologias

- SQL
- PostgresSQL
- DBeaver

## Estrutura do Banco

### Livros
- id (PK)
- titulo
- editoras_id (FK)
- ano_publicacao
- isbn (UNIQUE)

### Autor
- id (PK)
- nome

### Livros_Autor
- livros_id (PK, FK)
- autor_id (PK, FK)

Relacionamento N:N entre livros e autores utilizando chave primária composta.

### Editoras
- id (PK)
- nome

### Usuarios
- id (PK)
- nome
- email (UNIQUE)
- cpf (UNIQUE)
- celular

### Emprestimos
- id (PK)
- usuarios_id (FK)
- livros_id (FK)
- data_emprestimo
- data_devolucao
- status

## Regras de Negócio

- CPF único por cliente
- Email único por cliente
- ISBN único por livro
- Status do empréstimo:
  - EMPRESTADO
  - DEVOLVIDO
  - ATRASADO

## Conceitos Aplicados

- PRIMARY KEY
- FOREIGN KEY
- Chave Primária Composta
- Relacionamento N:N
- UNIQUE
- CHECK
- INNER JOIN

## Aprendizados

Durante o desenvolvimento deste projeto foram praticados conceitos de:

- Modelagem relacional
- Integridade referencial
- Normalização de dados
- Chaves primárias e estrangeiras
- Relacionamentos entre tabelas
- Consultas SQL - Básico ao Avançado
