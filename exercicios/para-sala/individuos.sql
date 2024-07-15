-- SQLite
-- .\sqlite3 individuos.db;

-- Criar a tabela 
CREATE TABLE cidades (
    id INTEGER PRIMARY KEY,
    nome TEXT,
    UF TEXT
);

CREATE TABLE pessoas (
    codigo INTEGER PRIMARY KEY,
    nome TEXT,
    usuario TEXT,
    cod_cidade INTEGER,
    FOREIGN KEY (cod_cidade) REFERENCES cidades(id)
);


-- Inserir dados na tabela cidades
INSERT INTO cidades (id, nome, UF) VALUES
    (1, 'Sao Paulo', 'SP'),
    (2, 'Caxias do Sul', 'RS'),
    (3, 'Florianopolis', 'SC'),
    (4, 'Rio de Janeiro', 'RJ'),
    (5, 'Bahia', 'BA'),
    (6, 'Rio Branco', 'AC')

-- Inserir dados na tabela pessoas
-- Inserir dados na tabela pessoas
INSERT INTO pessoas (codigo, nome, usuario, cod_cidade) VALUES
    (7, 'Anelise Susin', 'anelise', 1),
    (8, 'Lisi', 'lisiane', 2),
    (5, 'José Silva', 'jose', 3),
    (4, 'Patricia Souza', 'patricia', 4),
    (2, 'Paulo Antunes', 'paulo', 4),
    (6, 'Pedro Cardoso', 'pedro', 5),
    (9, 'Mutt Silva', 'mutt',null ),
    (10, 'Virginia Souza', 'virginia', 3),
    (11, 'Turma on 29', 'turma',null  )

select * from pessoas;
select * from cidades;


--inner join
select pessoas.nome, cidades.nome 
from pessoas
inner join cidades ON pessoas.cod_cidade = cidades.id;

select * from pessoas
inner JOIN cidades
ON pessoas.cod_cidade = cidades.id;

--left join
select pessoas.nome, cidades.nome 
from pessoas
left join cidades ON pessoas.cod_cidade = cidades.id;

select * from pessoas left JOIN cidades ON pessoas.cod_cidade = cidades.id;


--full join
SELECT 
    pessoas.nome, 
    cidades.nome
FROM 
    pessoas
FULL JOIN cidades ON pessoas.cod_cidade = cidades.id;