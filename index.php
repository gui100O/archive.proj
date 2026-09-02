<?php

require_once "conexao.php";

$resultado_diretores = $conexao->query("
    SELECT *
    FROM diretores
    ORDER BY nome
");



$resultado_filmes_diretores = $conexao->query("
    SELECT
        filmes.titulo,
        filmes.ano,
        filmes.duracao,
        filmes.descricao,
        filmes.imagem,
        filmes.diretores_id,
        filmes.ordem_diretor,
        generos.nome AS genero
    FROM filmes
    JOIN generos
        ON filmes.generos_id = generos.generos_id
    ORDER BY
        filmes.diretores_id,
        filmes.ordem_diretor IS NULL,
        filmes.ordem_diretor,
        filmes.ano
");



$filmes_por_diretor = [];

while ($filme = $resultado_filmes_diretores->fetch_assoc()) {

    $id_diretor = $filme["diretores_id"];

    $filmes_por_diretor[$id_diretor][] = $filme;
}



$resultado_destaque = $conexao->query("
    SELECT
        filmes.*,
        diretores.nome AS diretor,
        generos.nome AS genero
    FROM filmes
    JOIN diretores
        ON filmes.diretores_id = diretores.diretores_id
    JOIN generos
        ON filmes.generos_id = generos.generos_id
    WHERE filmes.titulo = 'The Godfather'
");



$filme_destaque = $resultado_destaque->fetch_assoc();



$resultado_aclamados = $conexao->query("
    SELECT
        filmes.*,
        diretores.nome AS diretor,
        generos.nome AS genero
    FROM filmes
    JOIN diretores
        ON filmes.diretores_id = diretores.diretores_id
    JOIN generos
        ON filmes.generos_id = generos.generos_id
    WHERE filmes.categoria = 'acclaimed'
    ORDER BY filmes.filmes_id
    LIMIT 5
");



$resultado_essenciais = $conexao->query("
    SELECT
        filmes.*,
        diretores.nome AS diretor,
        generos.nome AS genero
    FROM filmes
    JOIN diretores
        ON filmes.diretores_id = diretores.diretores_id
    JOIN generos
        ON filmes.generos_id = generos.generos_id
    WHERE filmes.categoria = 'essential'
    ORDER BY filmes.filmes_id
");



?>

<script>
    const filmesPorDiretor = <?= json_encode($filmes_por_diretor) ?>;
</script>

<!DOCTYPE html>

<html lang="pt-BR">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Archive - Digital Collection</title>

    <meta
        name="description"
        content="Archive — uma coleção digital de filmes, diretores e histórias."
    >

    <link rel="stylesheet" href="style.css">

</head>

<body>

    <!-- HEADER -->

    <header>

        <nav>

            <a href="#" class="logo">
                ARCHIVE.
            </a>

            <div class="nav-links">

                <a href="#colecao">
                    Coleção
                </a>

                <a href="#diretores">
                    Diretores
                </a>

                <a href="#sobre">
                    Sobre
                </a>

            </div>

        </nav>

    </header>



    <main>



        <!-- HERO -->

        <section class="hero">

            <p class="eyebrow">
                DIGITAL COLLECTION
            </p>

            <h1>

                A collection<br>

                of <span>stories.</span>

            </h1>

            <p class="hero-description">

                Filmes, diretores e histórias

                reunidos em um único arquivo.

            </p>

            <a href="#colecao" class="button">

                Explorar coleção →

            </a>

        </section>



        <!-- FEATURED -->

        <section id="colecao" class="featured">

            <p class="section-number">

                01 — DESTAQUE

            </p>

            <div class="featured-content">

                <div>

                    <p class="featured-year">

                        <?= htmlspecialchars($filme_destaque["ano"]) ?>

                    </p>

                    <h2>

                        <?= htmlspecialchars($filme_destaque["titulo"]) ?>.

                    </h2>

                    <p class="featured-director">

                        <?= htmlspecialchars($filme_destaque["diretor"]) ?>

                    </p>

                </div>

                <div class="featured-image">

                    <img

                        src="<?= htmlspecialchars($filme_destaque["imagem"]) ?>"

                        alt="<?= htmlspecialchars($filme_destaque["titulo"]) ?>"

                    >

                </div>

            </div>

        </section>



        <!-- CRITICALLY ACCLAIMED -->

        <section class="acclaimed">

            <p class="section-number">

                02 — CRITICALLY ACCLAIMED

            </p>

            <div class="section-heading">

                <h2>

                    Acclaimed<br>

                    by critics.

                </h2>

                <p>

                    Obras reconhecidas por sua direção,

                    roteiro, atuação e impacto na história

                    do cinema.

                </p>

            </div>

            <div class="movie-list">

                <?php

                $numero = 1;

                while ($filme = $resultado_aclamados->fetch_assoc()):

                ?>

                    <article class="movie">

                        <span class="movie-number">

                            <?= str_pad($numero, 2, "0", STR_PAD_LEFT) ?>

                        </span>

                        <div class="movie-image">

                            <img

                                src="<?= htmlspecialchars($filme["imagem"]) ?>"

                                alt="Pôster de <?= htmlspecialchars($filme["titulo"]) ?>"

                            >

                        </div>

                        <div class="movie-info">

                            <h3>

                                <?= htmlspecialchars($filme["titulo"]) ?>

                            </h3>

                            <p>

                                <?= htmlspecialchars($filme["diretor"]) ?>

                            </p>

                        </div>

                        <span class="movie-year">

                            <?= htmlspecialchars($filme["ano"]) ?>

                        </span>

                    </article>

                <?php

                    $numero++;

                endwhile;

                ?>

            </div>

        </section>



        <!-- ESSENTIALS -->

        <section class="essentials">

            <p class="section-number">

                03 — ESSENTIALS

            </p>

            <div class="section-heading">

                <h2>

                    Essential<br>

                    cinema.

                </h2>

                <p>

                    Filmes que atravessaram gerações

                    e ajudaram a definir diferentes

                    períodos e estilos do cinema.

                </p>

            </div>

            <div class="essential-grid">

                <?php

                $numero = 1;

                while ($filme = $resultado_essenciais->fetch_assoc()):

                ?>

                    <article class="essential-film">

                        <div class="essential-image">

                            <img

                                src="<?= htmlspecialchars($filme["imagem"]) ?>"

                                alt="Pôster de <?= htmlspecialchars($filme["titulo"]) ?>"

                            >

                        </div>

                        <div class="essential-info">

                            <span>

                                <?= str_pad($numero, 2, "0", STR_PAD_LEFT) ?>

                            </span>

                            <h3>

                                <?= htmlspecialchars($filme["titulo"]) ?>

                            </h3>

                            <p class="essential-director">

                                <?= htmlspecialchars($filme["diretor"]) ?>

                            </p>

                            <p class="essential-description">

                                <?= htmlspecialchars($filme["descricao"]) ?>

                            </p>

                            <div class="essential-meta">

                                <span>

                                    <?= htmlspecialchars($filme["ano"]) ?>

                                </span>

                                <span>

                                    <?= htmlspecialchars($filme["duracao"]) ?> MIN

                                </span>

                                <span>

                                    <?= strtoupper(htmlspecialchars($filme["genero"])) ?>

                                </span>

                            </div>

                        </div>

                    </article>

                <?php

                    $numero++;

                endwhile;

                ?>

            </div>

        </section>



        <!-- DIRECTORS -->

        <section id="diretores" class="directors">

            <p class="section-number">

                04 — DIRECTORS

            </p>

            <h2>

                Minds<br>

                behind the stories.

            </h2>

            <div class="director-list">

                <?php while ($diretor = $resultado_diretores->fetch_assoc()): ?>

                    <?php

                    $id_diretor = $diretor["diretores_id"];

                    $filmes_diretor = $filmes_por_diretor[$id_diretor] ?? [];

                    ?>

                    <div

                        class="director"

                        data-diretor-id="<?= $id_diretor ?>"

                    >

                        <h3>

                            <?= htmlspecialchars($diretor["nome"]) ?>

                        </h3>

                        <div class="director-posters">

                            <?php foreach (array_slice($filmes_diretor, 0, 4) as $filme_diretor): ?>

                                <img

                                    src="<?= htmlspecialchars($filme_diretor["imagem"]) ?>"

                                    alt="Pôster de <?= htmlspecialchars($filme_diretor["titulo"]) ?>"

                                >

                            <?php endforeach; ?>

                        </div>

                    </div>

                <?php endwhile; ?>

            </div>

        </section>



        <!-- ABOUT -->

        <section id="sobre" class="about">

            <p class="section-number">

                05 — ABOUT

            </p>

            <h2>

                An archive<br>

                of stories.

            </h2>

            <p>

                Um projeto desenvolvido para explorar

                desenvolvimento web, banco de dados

                e experiências digitais através de

                uma coleção de filmes.

            </p>

        </section>

    </main>



    <!-- FOOTER -->

    <footer>

        <p>

            ARCHIVE. - 2026 - by Guilherme Farias

        </p>

    </footer>



    <script src="script.js"></script>

</body>

</html>