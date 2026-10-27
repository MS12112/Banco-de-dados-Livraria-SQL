-- Livros por autor
 SELECT l.titulo, a.nome
 FROM autor a
 JOIN livros_autor la
 ON a.id = la.autor_id 
 JOIN livros l
 ON l.id = la.livros_id
 ORDER BY a.nome DESC

-- Quantidade de livros por editora
SELECT
    e.nome,
    COUNT(l.titulo) AS quantidade_livros
FROM livros l
JOIN editoras e
    ON e.id = l.editoras_id
GROUP BY e.nome
ORDER BY quantidade_livros DESC;

-- Usuários com empréstimos ativos
SELECT
    u.nome
FROM usuarios u
JOIN emprestimos e
    ON e.usuarios_id = u.id
WHERE e.status = 'ATIVO'
ORDER BY u.nome;

-- Livros atualmente emprestados
SELECT l.titulo
FROM livros l
JOIN emprestimos e 
ON e.livros_id = l.id
WHERE e.status IN ('ATIVO')
ORDER BY l.titulo DESC;

-- Livros mais antigos cadastrados


-- Quantidade de livros por ano
SELECT
    l.ano_publi,
    COUNT(l.titulo) AS quantidade_livros
FROM livros l
GROUP BY l.ano_publi
ORDER BY l.ano_publi DESC;
