-- Livros por autor
 SELECT l.titulo, a.nome
 FROM autor a
 JOIN livros_autor al
 ON a.id = al.autor_id 
 JOIN livros l
 ON l.id = al.livros_id
 ORDER BY a.nome DESC

-- Quantidade de livros por editora

-- Usuários com empréstimos ativos

-- Livros atualmente emprestados

-- Livros mais antigos cadastrados

-- Quantidade de livros por ano
