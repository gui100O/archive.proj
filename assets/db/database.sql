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
    
    
SELECT
    diretores.nome AS diretor,
    filmes.titulo,
    filmes.ano
FROM diretores
JOIN filmes
    ON diretores.diretores_id = filmes.diretores_id
ORDER BY diretores.nome, filmes.ano;



SELECT
    filmes.titulo,
    filmes.ano,
    filmes.imagem,
    filmes.diretores_id
FROM filmes
ORDER BY filmes.diretores_id, filmes.ano;


INSERT INTO filmes
(titulo, ano, duracao, descricao, imagem, diretores_id, generos_id, categoria, ordem_diretor)
VALUES
('Mean Streets', 1973, 112,
 'Um retrato cru da vida, culpa e lealdade entre pequenos criminosos de Little Italy.',
 'assets/images/Mean Streets.jpeg',
 10, 3, 'acclaimed', 1),

('Taxi Driver', 1976, 114,
 'Um veterano isolado percorre as ruas de Nova York enquanto mergulha em uma crescente obsessão por violência e redenção.',
 'assets/images/Taxi Driver.jpeg',
 10, 3, 'acclaimed', 2),

('Raging Bull', 1980, 129,
 'A ascensão e queda de um boxeador marcada por violência, ciúme e autodestruição.',
 'assets/images/Raging Bull.jpeg',
 10, 1, 'acclaimed', 3),

('Goodfellas', 1990, 146,
 'A ascensão e queda de um jovem envolvido com a máfia nova-iorquina.',
 'assets/images/Goodfellas.jpeg',
 10, 3, 'acclaimed', 4);


INSERT INTO generos (nome)
VALUES ('Animação');

INSERT INTO filmes
(titulo, ano, duracao, descricao, imagem, diretores_id, generos_id, categoria, ordem_diretor)
VALUES
('Kiki''s Delivery Service', 1989, 103,
 'Uma jovem bruxa parte sozinha para uma cidade costeira e começa a descobrir seu lugar no mundo.',
 'assets/images/Kikis Delivery Service.jpeg',
 11, 5, 'acclaimed', 1),

('Spirited Away', 2001, 125,
 'Uma garota precisa encontrar coragem e identidade em um mundo misterioso habitado por espíritos.',
 'assets/images/Spirited Away.jpeg',
 11, 5, 'acclaimed', 2),

('My Neighbor Totoro', 1988, 86,
 'Duas irmãs descobrem criaturas mágicas enquanto vivem no interior do Japão.',
 'assets/images/My Neighbor Totoro.jpeg',
 11, 5, 'acclaimed', 3),

('Princess Mononoke', 1997, 133,
 'Um príncipe se envolve em um conflito entre forças da natureza e uma sociedade em expansão.',
 'assets/images/Princess Mononoke.jpeg',
 11, 5, 'acclaimed', 4);
 
 
 
 
 
 SELECT
    filmes.titulo,
    filmes.ano,
    filmes.imagem,
    filmes.diretores_id
FROM filmes
WHERE filmes.ordem_diretor IS NOT NULL
ORDER BY filmes.diretores_id, filmes.ordem_diretor;







-- FRANCIS FORD COPPOLA

UPDATE filmes
SET ordem_diretor = 2
WHERE filmes_id = 1;


-- AKIRA KUROSAWA

UPDATE filmes
SET ordem_diretor = 1
WHERE filmes_id = 2;


-- SIDNEY LUMET

UPDATE filmes
SET ordem_diretor = 1
WHERE filmes_id = 3;


-- BONG JOON HO

UPDATE filmes
SET ordem_diretor = 1
WHERE filmes_id = 4;


-- STEVEN SPIELBERG

UPDATE filmes
SET ordem_diretor = 1
WHERE filmes_id = 5;









-- FRANCIS FORD COPPOLA
-- diretor_id = 1

INSERT INTO filmes
(titulo, ano, duracao, descricao, imagem, diretores_id, generos_id, categoria, ordem_diretor)
VALUES
('The Godfather Part II', 1974, 202,
 'A continuação da saga dos Corleone acompanha a expansão do império de Michael enquanto revisita a juventude de seu pai, Vito.',
 'assets/images/The Godfather Part II.jpeg',
 1, 3, 'acclaimed', 1),

('Apocalypse Now', 1979, 147,
 'Durante a Guerra do Vietnã, um capitão recebe a missão de encontrar e eliminar um coronel que enlouqueceu no meio da guerra.',
 'assets/images/Apocalypse Now.jpeg',
 1, 1, 'acclaimed', 3),

('The Conversation', 1974, 113,
 'Um especialista em vigilância entra em crise ao suspeitar que uma conversa que gravou pode levar ao assassinato de um casal.',
 'assets/images/The Conversation.jpeg',
 1, 1, 'acclaimed', 4);


-- AKIRA KUROSAWA
-- diretor_id = 2

INSERT INTO filmes
(titulo, ano, duracao, descricao, imagem, diretores_id, generos_id, categoria, ordem_diretor)
VALUES
('Rashomon', 1950, 88,
 'Um crime é contado através de diferentes versões, colocando em dúvida a própria natureza da verdade.',
 'assets/images/Rashomon.jpeg',
 2, 3, 'acclaimed', 2),

('Ran', 1985, 162,
 'Um senhor feudal decide dividir seu reino entre os três filhos, desencadeando uma violenta disputa por poder.',
 'assets/images/Ran.jpeg',
 2, 1, 'acclaimed', 3),

('Ikiru', 1952, 143,
 'Um funcionário público confronta a própria mortalidade e passa a buscar um sentido para sua existência.',
 'assets/images/Ikiru.jpeg',
 2, 1, 'acclaimed', 4);


-- SIDNEY LUMET
-- diretor_id = 3

INSERT INTO filmes
(titulo, ano, duracao, descricao, imagem, diretores_id, generos_id, categoria, ordem_diretor)
VALUES
('Network', 1976, 121,
 'Uma emissora de televisão transforma a crise de um apresentador em espetáculo enquanto expõe a lógica implacável da mídia.',
 'assets/images/Network.jpeg',
 3, 1, 'acclaimed', 2),

('Dog Day Afternoon', 1975, 125,
 'Um assalto a banco aparentemente simples se transforma em um longo confronto diante das câmeras e da polícia.',
 'assets/images/Dog Day Afternoon.jpeg',
 3, 3, 'acclaimed', 3),

('Serpico', 1973, 130,
 'Um policial de Nova York enfrenta a corrupção dentro da própria corporação enquanto tenta manter seus princípios.',
 'assets/images/Serpico.jpeg',
 3, 3, 'acclaimed', 4);


-- BONG JOON HO
-- diretor_id = 4

INSERT INTO filmes
(titulo, ano, duracao, descricao, imagem, diretores_id, generos_id, categoria, ordem_diretor)
VALUES
('Memories of Murder', 2003, 131,
 'Dois detetives investigam uma série de assassinatos enquanto enfrentam a ausência de pistas e as próprias limitações.',
 'assets/images/Memories of Murder.jpeg',
 4, 3, 'acclaimed', 2),

('Mother', 2009, 129,
 'Uma mãe começa sua própria investigação para provar a inocência do filho acusado de assassinato.',
 'assets/images/Mother.jpeg',
 4, 3, 'acclaimed', 3),

('The Host', 2006, 120,
 'Uma criatura surge no rio Han e sequestra uma jovem, levando sua família a uma desesperada tentativa de resgate.',
 'assets/images/The Host.jpeg',
 4, 2, 'acclaimed', 4);


-- STEVEN SPIELBERG
-- diretor_id = 5

INSERT INTO filmes
(titulo, ano, duracao, descricao, imagem, diretores_id, generos_id, categoria, ordem_diretor)
VALUES
('E.T. the Extra-Terrestrial', 1982, 115,
 'Um garoto encontra um alienígena perdido na Terra e tenta ajudá-lo a voltar para casa.',
 'assets/images/ET the Extra-Terrestrial.jpeg',
 5, 2, 'acclaimed', 2),

('Raiders of the Lost Ark', 1981, 115,
 'O arqueólogo Indiana Jones parte em busca da Arca da Aliança antes que ela caia nas mãos dos nazistas.',
 'assets/images/Raiders of the Lost Ark.jpeg',
 5, 1, 'acclaimed', 3),

('Jaws', 1975, 124,
 'Um enorme tubarão ameaça uma comunidade costeira e leva um policial, um biólogo marinho e um pescador a enfrentá-lo.',
 'assets/images/Jaws.jpeg',
 5, 1, 'acclaimed', 4);


-- ORSON WELLES
-- diretor_id = 6

INSERT INTO filmes
(titulo, ano, duracao, descricao, imagem, diretores_id, generos_id, categoria, ordem_diretor)
VALUES
('Touch of Evil', 1958, 95,
 'Um policial mexicano e um investigador americano se envolvem em uma investigação marcada por corrupção e manipulação.',
 'assets/images/Touch of Evil.jpeg',
 6, 3, 'acclaimed', 2),

('The Magnificent Ambersons', 1942, 88,
 'A decadência de uma família tradicional é observada enquanto mudanças sociais e tecnológicas transformam sua cidade.',
 'assets/images/The Magnificent Ambersons.jpeg',
 6, 1, 'acclaimed', 3),

('The Lady from Shanghai', 1947, 87,
 'Um marinheiro se envolve em uma complexa trama de desejo, crime e traição.',
 'assets/images/The Lady from Shanghai.jpeg',
 6, 3, 'acclaimed', 4);


-- STANLEY KUBRICK
-- diretor_id = 7

INSERT INTO filmes
(titulo, ano, duracao, descricao, imagem, diretores_id, generos_id, categoria, ordem_diretor)
VALUES
('Dr. Strangelove', 1964, 95,
 'Uma sátira sobre a Guerra Fria acompanha uma cadeia de acontecimentos que ameaça desencadear uma guerra nuclear.',
 'assets/images/Dr Strangelove.jpeg',
 7, 2, 'acclaimed', 2),

('A Clockwork Orange', 1971, 136,
 'Um jovem extremamente violento é submetido a um controverso método de condicionamento psicológico.',
 'assets/images/A Clockwork Orange.jpeg',
 7, 1, 'acclaimed', 3),

('Paths of Glory', 1957, 88,
 'Durante a Primeira Guerra Mundial, soldados são injustamente acusados após uma missão militar fracassar.',
 'assets/images/Paths of Glory.jpeg',
 7, 1, 'acclaimed', 4);


-- QUENTIN TARANTINO
-- diretor_id = 8

INSERT INTO filmes
(titulo, ano, duracao, descricao, imagem, diretores_id, generos_id, categoria, ordem_diretor)
VALUES
('Reservoir Dogs', 1992, 99,
 'Um assalto dá errado e os criminosos sobreviventes começam a suspeitar que existe um informante entre eles.',
 'assets/images/Reservoir Dogs.jpeg',
 8, 3, 'acclaimed', 2),

('Inglourious Basterds', 2009, 153,
 'Durante a Segunda Guerra Mundial, um grupo de soldados americanos planeja assassinar líderes nazistas enquanto uma jovem busca vingança.',
 'assets/images/Inglourious Basterds.jpeg',
 8, 1, 'acclaimed', 3),

('Kill Bill: Vol. 1', 2003, 111,
 'Após acordar de um coma, uma assassina parte em uma jornada de vingança contra aqueles que a traíram.',
 'assets/images/Kill Bill Vol 1.jpeg',
 8, 3, 'acclaimed', 4);


-- WONG KAR-WAI
-- diretor_id = 9

INSERT INTO filmes
(titulo, ano, duracao, descricao, imagem, diretores_id, generos_id, categoria, ordem_diretor)
VALUES
('Chungking Express', 1994, 102,
 'Dois policiais solitários atravessam Hong Kong enquanto vivem encontros inesperados e histórias de amor.',
 'assets/images/Chungking Express.jpeg',
 9, 4, 'acclaimed', 1),

('Happy Together', 1997, 96,
 'Um casal viaja para a Argentina em uma relação marcada por aproximações, afastamentos e conflitos.',
 'assets/images/Happy Together.jpeg',
 9, 4, 'acclaimed', 3),

('Days of Being Wild', 1990, 94,
 'Um jovem busca descobrir suas origens enquanto envolve diferentes pessoas em relações marcadas por desejo e abandono.',
 'assets/images/Days of Being Wild.jpeg',
 9, 4, 'acclaimed', 4);
 
 
 UPDATE filmes
SET ordem_diretor = 2
WHERE filmes_id = 20;

















