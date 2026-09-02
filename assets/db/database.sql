INSERT INTO diretores (nome) VALUES
('Francis Ford Coppola'),
('Akira Kurosawa'),
('Sidney Lumet'),
('Bong Joon Ho'),
('Steven Spielberg'),
('Orson Welles'),
('Stanley Kubrick'),
('Quentin Tarantino'),
('Wong Kar-wai'),
('Martin Scorsese'),
('Hayao Miyazaki');

select * from diretores;

INSERT INTO generos (nome) VALUES
('Drama'),
('Sci-Fi'),
('Crime'),
('Romance');

select * from generos;


INSERT INTO filmes
(titulo, ano, duracao, descricao, imagem, diretor_id, genero_id, categoria)
VALUES

(
    'The Godfather',
    1972,
    175,
    NULL,
    'assets/images/The Godfather.jpeg',
    1,
    3,
    'acclaimed'
),

(
    'Seven Samurai',
    1954,
    207,
    NULL,
    'assets/images/Seven Samurai.jpeg',
    2,
    1,
    'acclaimed'
),

(
    '12 Angry Men',
    1957,
    96,
    NULL,
    'assets/images/12 Angry Men.jpeg',
    3,
    1,
    'acclaimed'
),

(
    'Parasite',
    2019,
    132,
    NULL,
    'assets/images/Parasite.jpeg',
    4,
    3,
    'acclaimed'
),

(
    'Schindler''s List',
    1993,
    195,
    NULL,
    'assets/images/Schindlers List.jpeg',
    5,
    1,
    'acclaimed'
);

select * from filmes;


INSERT INTO filmes
(titulo, ano, duracao, descricao, imagem, diretor_id, genero_id, categoria)
VALUES

(
    'Citizen Kane',
    1941,
    119,
    'Um marco do cinema americano e uma investigação sobre poder, memória e identidade.',
    'assets/images/Citizen Kane.jpeg',
    6,
    1,
    'essential'
),

(
    '2001: A Space Odyssey',
    1968,
    149,
    'Uma viagem visual e filosófica sobre humanidade, evolução e inteligência.',
    'assets/images/2001 A Space Odyssey.jpeg',
    7,
    2,
    'essential'
),

(
    'Pulp Fiction',
    1994,
    154,
    'Histórias de crime se cruzam em uma narrativa fragmentada marcada por violência, humor e cultura pop.',
    'assets/images/Pulp Fiction.jpeg',
    8,
    3,
    'essential'
),

(
    'In the Mood for Love',
    2000,
    98,
    'Dois vizinhos desenvolvem uma relação silenciosa enquanto descobrem uma dolorosa conexão entre seus parceiros.',
    'assets/images/In the Mood for Love.jpeg',
    9,
    4,
    'essential'
);


select * from filmes;

SELECT
    filmes.titulo,
    filmes.ano,
    diretores.nome AS diretor
FROM filmes
JOIN diretores
    ON filmes.diretor_id = diretores_id;


SELECT
    filmes.titulo,
    filmes.ano,
    diretores.nome AS diretor,
    generos.nome AS genero
FROM filmes
JOIN diretores
    ON filmes.diretor_id = diretores_id
JOIN generos
    ON filmes.genero_id = generos_id;
    
    


