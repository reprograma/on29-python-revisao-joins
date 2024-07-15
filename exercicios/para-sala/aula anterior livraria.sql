-- SQLite
-- Criar a tabela 'livros'
CREATE TABLE livros (
    id INTEGER PRIMARY KEY,
    titulo TEXT,
    autor TEXT,
    ano_publicacao INTEGER,
    preco REAL
);

-- Inserir os registros de livros
INSERT INTO livros (titulo, autor, ano_publicacao, preco) VALUES ('Dom Quixote', 'Miguel de Cervantes', 1605, 29.90);
INSERT INTO livros (titulo, autor, ano_publicacao, preco) VALUES ('Orgulho e Preconceito', 'Jane Austen', 1813, 25.50);
INSERT INTO livros (titulo, autor, ano_publicacao, preco) VALUES ('1984', 'George Orwell', 1949, 35.75);

---novos inserts
INSERT INTO livros (titulo, autor, ano_publicacao, preco) VALUES 
  ('Emma', 'Jane Austen', 1815, 66.90),
  ('Persuasao', 'Jane Austen', 1818, 12.90),
  ('Guia Prático: um Guia Para o uso de SQL', ' ', 2023, 68.75),
  ('', ' ', 2022, 90.75);


-- Criar a tabela 'vendas'
CREATE TABLE vendas (
    id INTEGER PRIMARY KEY,
    livro_id INTEGER,
    data_venda DATE,
    quantidade INTEGER,
    FOREIGN KEY (livro_id) REFERENCES livros(id)
);

-- Inserir alguns registros de vendas para teste
INSERT INTO vendas (livro_id, data_venda, quantidade) VALUES (1, '2024-05-10', 3);  -- Venda de 3 exemplares de 'Dom Quixote'
INSERT INTO vendas (livro_id, data_venda, quantidade) VALUES (2, '2024-05-09', 5);  -- Venda de 5 exemplares de 'Orgulho e Preconceito'
INSERT INTO vendas (livro_id, data_venda, quantidade) VALUES (3, '2024-05-08', 2);  -- Venda de 2 exemplares de '1984'

select * from livros;
select * from vendas;

-- Realizar JOIN entre as tabelas 'livros' e 'vendas'
SELECT 
    livros.titulo, 
    livros.autor, 
    vendas.data_venda, 
    vendas.quantidade
FROM 
    vendas
JOIN 
    livros ON vendas.livro_id = livros.id;


select * from vendas inner JOIN livros ON vendas.livro_id = livros.id;

select * from vendas left JOIN livros ON vendas.livro_id = livros.id;

select * from vendas right JOIN livros ON vendas.livro_id = livros.id;

--full join
SELECT 
    livros.titulo, 
    livros.autor, 
    vendas.quantidade
FROM 
    vendas
FULL JOIN livros ON vendas.livro_id = livros.id;


--cross join
SELECT 
    livros.id , livros.titulo
FROM 
    vendas
CROSS JOIN livros

--self join  
  SELECT
  L1.titulo,
  L1.autor,
  V2.autor
  
FROM
  livros L1
INNER JOIN
  livros V2
ON L1.autor = V2.autor

---group by
SELECT SUM(quantidade) AS total, data_venda AS mês 
FROM vendas
GROUP BY data_venda;
