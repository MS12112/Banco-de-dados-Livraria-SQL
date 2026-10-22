CREATE TABLE usuario (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    cell VARCHAR(15) UNIQUE NOT NULL
 	);

CREATE TABLE livros (
    id INTEGER PRIMARY KEY,
    titulo TEXT NOT NULL,
  	editora_id INTEGER NOT NULL,
  	ano_publi SMALLINT NOT NULL,
  	isbn VARCHAR(13) UNIQUE NOT NULL,
  	
  	FOREIGN KEY (editora_id),
	REFERENCES editora(id)
	);

CREATE TABLE autor (
	id INTEGER PRIMARY KEY,
	nome VARCHAR(50) NOT NULL
	);

-- Relacionamento N:N entre livros e autores
CREATE TABLE livro_autor(
    livro_id INTEGER NOT NULL,
    autor_id INTEGER NOT NULL,
	
    PRIMARY KEY (livro_id, autor_id),
    
    FOREIGN KEY (livro_id) REFERENCES livros(id),
	FOREIGN KEY (autor_id) REFERENCES autor(id)
	);

CREATE TABLE editora (
	id INTEGER PRIMARY KEY,
	nome VARCHAR(100) UNIQUE NOT NULL
	);

CREATE TABLE emprestimos (
    id INTEGER PRIMARY KEY,
    usuario_id INTEGER NOT NULL,
    livro_id INTEGER NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE NOT NULL,
    status TEXT NOT NULL CHECK (status IN ('ATIVO', 'DEVOLVIDO', 'ATRASADO')),
    
    FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    FOREIGN KEY (livro_id) REFERENCES livros(id),
	);

    -- Índices para performance
    CREATE INDEX idx_emprestimos_usuario
    ON emprestimos(usuario_id);

    CREATE INDEX idx_emprestimos_livro
    ON emprestimos(livro_id);

    CREATE INDEX idx_emprestimos_status
    ON emprestimos(status);
