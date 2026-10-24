CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    cell VARCHAR(15) UNIQUE NOT NULL
 	);

CREATE TABLE editoras (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100) UNIQUE NOT NULL
	);

CREATE TABLE autor (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL
	);

CREATE TABLE livros (
    id SERIAL PRIMARY KEY,
    titulo TEXT NOT NULL,
  	editoras_id INTEGER NOT NULL,
  	ano_publi SMALLINT NOT NULL,
  	isbn VARCHAR(13) UNIQUE NOT NULL,
  	FOREIGN KEY (editoras_id) REFERENCES editoras(id)
	);

-- Relacionamento N:N entre livros e autores
CREATE TABLE livros_autor(
    livros_id INTEGER NOT NULL,
    autor_id INTEGER NOT NULL,
    PRIMARY KEY (livros_id, autor_id),
    FOREIGN KEY (livros_id) REFERENCES livros(id),
	FOREIGN KEY (autor_id) REFERENCES autor(id)
	);

CREATE TABLE emprestimos (
    id SERIAL PRIMARY KEY,
    usuarios_id INTEGER NOT NULL,
    livros_id INTEGER NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE NOT NULL,
    status TEXT NOT NULL CHECK (status IN ('ATIVO', 'DEVOLVIDO', 'ATRASADO')),
    FOREIGN KEY (usuarios_id) REFERENCES usuarios(id),
    FOREIGN KEY (livros_id) REFERENCES livros(id)
	);

    -- Índices para performance
    CREATE INDEX idx_emprestimos_usuario
    ON emprestimos(usuarios_id);

    CREATE INDEX idx_emprestimos_livro
    ON emprestimos(livros_id);

    CREATE INDEX idx_emprestimos_status
    ON emprestimos(status);
