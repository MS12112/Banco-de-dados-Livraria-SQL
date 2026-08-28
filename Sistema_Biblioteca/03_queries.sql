
/* Selecione os livros e usuarios com status ativos*/
SELECT u.nome, l.titulo
FROM emprestimos e
JOIN usuario u ON e.usuario_id = u.id
JOIN livros l ON e.livro_id = l.id
WHERE e.status = 'ATIVO';

/* Quantidade de livros por autor*/
SELECT COUNT(DISTINCT autor )
FROM livros

/*Buscar livros publicados de determinado ano*/
SELECT titulo, ano_publi
FROM livros
WHERE ano_publi BETWEEN 2000 AND 2025
ORDER BY ano_publi ASC

