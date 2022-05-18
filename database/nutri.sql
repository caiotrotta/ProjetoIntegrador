-- Apaga o banco de dados caso exista.
DROP DATABASE IF EXISTS nutrireceitas;

-- Cria o banco de dados
CREATE DATABASE nutrireceitas CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Seleciona banco de dados.
USE nutrireceitas; 

-- Cria tabela de usuários/autores.
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(255),
    user_email VARCHAR(255),
    user_birth DATE,
    user_photo VARCHAR(255),
    user_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_profile TEXT,
    user_password VARCHAR(255),
    user_type ENUM('user', 'author', 'admin') DEFAULT 'user',
    user_status ENUM('on', 'off', 'deleted') DEFAULT 'on'
);

-- Cria tabela de artigos
CREATE TABLE articles (
    art_id INT PRIMARY KEY AUTO_INCREMENT,
    art_title VARCHAR(127),
    art_intro VARCHAR(255),
    art_thumb VARCHAR(255),
    art_content TEXT,
    art_author INT,
    art_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    art_status ENUM('on', 'off', 'deleted') DEFAULT 'on',
    art_views INT DEFAULT 0,
    FOREIGN KEY (art_author) REFERENCES users (user_id)
);

-- Cria tabela de comentários nos artigos
CREATE TABLE comments (
    cmt_id INT PRIMARY KEY AUTO_INCREMENT,
    cmt_article INT,
    cmt_author INT,
    cmt_comment TEXT,
    cmt_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cmt_status ENUM('on', 'off', 'deleted') DEFAULT 'on',
    FOREIGN KEY (cmt_article) REFERENCES articles (art_id),
    FOREIGN KEY (cmt_author) REFERENCES users (user_id)
);

-- Cria tabela com contatos do site
CREATE TABLE contacts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(127),
    email VARCHAR(255),
    subject VARCHAR(255),
    message TEXT,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('on', 'off', 'deleted') DEFAULT 'on'
);

-- Insere dados em 'users'
INSERT INTO users (
    user_name,
    user_email,
    user_birth,
    user_photo,
    user_profile,
    user_password,
    user_type
) VALUES 
(
    'Setembrino Trocatapas',
    'set@brino.com',
    '1990-10-14',
    'https://randomuser.me/api/portraits/lego/6.jpg',
    'Chefe de Cozinha a mais de 10 anos.',
    SHA1('Qw3rtyui0P'),
    'author'
),
(
    'Emegarda Sirineuza',
    'emen@siri.com',
    '2000-01-11',
    'https://randomuser.me/api/portraits/lego/3.jpg',
    'Participei do Masterchef 2013, Chefe desde então.',
    SHA1('Qw3rtyui0P'),
    'user'
),
(
    'Eletricildo Chocante',
    'eletro@choque.com',
    '1981-05-02',
    'https://randomuser.me/api/portraits/lego/5.jpg',
    'Aprendendo a cozinhar, futuro chefe de cozinha.',
    SHA1('Qw3rtyui0P'),
    'admin'
),
(
    'Juanita Malita',
    'nitamalita@gmail.com',
    '1991-10-12',
    'https://randomuser.me/api/portraits/lego/1.jpg',
    'Chefe de cozinha a mais de 5 anos.',
    SHA1('Qw3rtyui0P'),
    'author'
),
(
    'Genesito Malito',
    'genemalito@google.com',
    '2000-11-01',
    'https://randomuser.me/api/portraits/lego/2.jpg',
    'Chefe de cozinha á 5 meses.',
    SHA1('Qw3rtyui0P'),
    'author'
);

-- Insere dados em 'articles'
INSERT INTO articles (
    art_title,
    art_intro,
    art_thumb,
    art_content,
    art_author
) VALUES
(
    'Bife acebolado com fritas',
    'Como fazer bife acebolado com fritas.',
    '/img/articles/artigo1.jpg',
    '<img src="/img/articles/artigo1.jpg" alt="Bife acebolado com fritas">
    <p>Ingredientes para fazer bife acebolado com fritas:</p>
        <p>. 1 bife</p>
        <p>. 1 cebola pequena</p>
        <p>. 1 dente de alho</p>
        <p>. 1 colher de sopa de molho shoyu</p>
        <p>. 4 colheres de sopa de azeite</p>
        <p>. 1 colher de sopa de manteiga</p>
        <p>. sal</p>
        <p>. pimenta</p>
        <p>. 3 batatas pequenas</p>
        <p>. óleo suficiente para fritar as batatas</p>',
    '1'
),
(
    'Macarrão com frutos do mar.',
    'Aprenda a fazer essa receita!',
    '/img/articles/artigo2.jpg',
    '<img src="/img/articles/artigo2.jpg" alt="Macarrão com frutos do mar">
     <p>Ingredientes para fazer macarrão com frutos do mar:</p>   
        <p>. 1 pacote de macarrão pene</p>
        <p>. 1 cebola picadinha</p>
        <p>. 1 maço de salsinha picadinha</p>
        <p>. 100 g de camarão limpo</p>
        <p>. 100 g de lula picadinha</p>
        <p>. 100 g de polvo picadinho</p>
        <p>. 100 g de lambelambe</p>
        <p>. 500 ml de molho de tomate</p>
        <p>. 2 colheres de sopa de shoyo</p>
        <p>. sal a gosto</p>
        <p>. 3 xícaras de chá de suco de limão</p>
        <p>. 2 colheres de sopa de azeite</p>',
    '5'
),
(
    'Pão de abóbora com polvilho',
    'Neste artigo aprenderemos a fazer pão de abóbora com polvilho.',
    '/img/articles/artigo3.jpg',
    '<img src="/img/articles/artigo3.jpg" alt="Pão de abóbora com polvilho">
    <p>Ingredientes para fazer pão de abóbora com polvilho:</p>
        <p>. 1 xicara de abobora cabotiá cozida xícara de 240 ml</p>
        <p>. 4 colheres de sopa de polvilho doce</p>
        <p>. 2 colheres de sopa de polvilho azedo</p>
        <p>. 2 colheres de sopa água</p>
        <p>. sal a gosto</p>
        <p>. 1 colher de sopa de óleo de coco (pode usar azeite, mais o de coco fica melhor</p>',
    '1'
);

-- Insere dados em 'articles'
INSERT INTO articles (
    art_title,
    art_intro,
    art_thumb,
    art_content,
    art_author
) VALUES
(
    'Crepioca de queijo com tomate e orégano',
    'Aprenda como fazer crepioca de queijo com tomate e orégano.',
    '/img/articles/artigo4.jpg',
    '<img src="/img/articles/artigo4.jpg" alt="Crepioca de queijo com tomate e orégano">
    <p>Ingredientes para fazer crepioca de queijo com tomate e orégano:</p>
        <p>. 1 ovo</p>
        <p>. 2 colheres de sopa de tapioca</p>
        <p>. 1 pitada de sal rosa</p>
        <p>. 1 fio de azeite de oliva</p>
        <p>. 1 fatia de queijo mussarela</p>
        <p>. 1 colher de sopa de tomate picadinho</p>
        <p>. orégano a gosto</p>',
    '1'
),
(
    'Lasanha de frango',
    'Lasanha de frango, rápido e prático!',
    '/img/articles/artigo5.jpg',
    '<img src="/img/articles/artigo5.jpg" alt="Lasanha de frango">
    <p>Ingredientes para fazer lasanha de frango:</p>
        <p>. 1 peito de frango</p>
        <p>. 500 g de queijo muçarela fatiado</p>
        <p>. 400 g de presunto fatiado</p>
        <p>. 1 pacote médio de massa para lasanha (direto ao forno, sem cozimento prévio)</p>
        <p>. 1 pote de requeijão cremoso</p>
        <p>. 2 caldos de galinha (ou tempero completo sabor galinha)</p>
        <p>. 2 copos de leite</p>
        <p>. 1 caixa de creme de leite</p>
        <p>. 2 colheres de farinha</p>
        <p>. 3 colheres de manteiga</p>
        <p>. 1 cebola média</p>',
    '3'
),
(
    'Feijoada',
    'Feijoada de domingo para toda a família.',
    '/img/articles/artigo6.jpg',
    '<img src="/img/articles/artigo6.jpg" alt="Feijoada">
    <p>Ingredientes para fazer feijoada:</p>
        <p>. 1 Kg de feijão preto
        <p>. 100 g de carne seca
        <p>. 70 g de orelha de porco
        <p>. 70 g de rabo de porco
        <p>. 70 g de pé de porco
        <p>. 100 g de costelinha de porco
        <p>. 50 g de lombo de porco
        <p>. 100 g de paio  
        <p>. 150 g de linguiça portuguesa
        <p>. 2 cebolas grandes picadas
        <p>. 1 maço de cebolinha verde picadinha
        <p>. 3 folhas de louro
        <p>. 6 dentes de alho
        <p>. pimenta do reino a gosto
        <p>. 1 ou 2 laranjas
        <p>. 40 ml de de pinga
        <p>. sal (se precisar)',
    '1'
),
(
    'Carne de sol com mandioca',
    'Receita deliciosa para todos.',
    '/img/articles/artigo7.jpg',
    '<img src="/img/articles/artigo7.jpg" alt="Carne de sol com mandioca">
    <p>Ingredientes para fazer carne de sol com mandioca:</p>
        <p>. 500 g carne de sol</p>
        <p>. 300 ml óleo</p>
        <p>. 3 dentes alho, cortado em lâminas</p>
        <p>. 300 g mandioca</p>
        <p>. 300 ml óleo</p>
        <p>. sal a gosto</p>',
    '4'
),
(
    'Baião de dois',
    'Aprenda como fazer baião de dois.',
    '/img/articles/artigo8.jpg',
    '<img src="/img/articles/artigo8.jpg" alt="Baião de dois">
    <p>Ingredientes para fazer baião de dois:</p>
        <p>. 1/2 kg de feijão verde</p>
        <p>. 1 paio cortado em rodelas</p>
        <p>. 2 tabletes de caldo de carne</p>
        <p>. 1 cebola ralada</p>
        <p>. 1 dente de alho amassado</p>
        <p>. 3 colheres (sopa) de óleo</p>
        <p>. 1/2 colher (sopa) de coento picado</p>
        <p>. 2 xícaras e 1/2 (chá) de arroz lavado e escorrido</p>
        <p>. 150 g de queijo de coalho cortado em fatias finas</p>',
    '2'
),
(
    'Feijão tropeiro',
    'Receita de como preparar feijão tropeiro.',
    '/img/articles/artigo9.jpg',
    '<img src="/img/articles/artigo9.jpg" alt="Feijão tropeiro">
    <p>Ingredientes para fazer feijão tropeiro:</p>
        <p>. 500 g de feijão carioquinha cozido</p>
        <p>. 200 g de toucinho</p>
        <p>. 1 concha de óleo</p>
        <p>. 1 cebola média picada</p>
        <p>. 4 dentes de alho</p>
        <p>. 5 ovos</p>
        <p>. 1 colher (sopa) de sal com alho</p>
        <p>. cheiro-verde a gosto</p>
        <p>. 200 g de farinha de mandioca</p>',
    '5'
);