<?php

/*
 * Arquivo que faz a configuração incial da página.
 * Por exemplo, conecta-se ao banco de dados.
 */
require($_SERVER['DOCUMENT_ROOT'] . '/_config.php');

/**
 * Seus códigos PHP desta página iniciam aqui! *
 ***/

// Variável que armazena todos os artigos para exibição no HTML.
$artigos = '';

// SQL que obtém todos os artigos.
$sql = <<<SQL
SELECT art_id, art_title, art_intro, art_thumb 
FROM articles
WHERE art_status = 'on'
AND art_date <= NOW()
ORDER BY art_date DESC;
SQL;

// Executa a query. $res contém os artigos encontrados.
$res = $conn->query($sql);

// Obtém cada registro de $res
while ($artigo = $res->fetch_assoc()) :

    $artigos .= <<<HTML
<div class="item">
    <div>
        <a href="/ler/?{$artigo['art_id']}">
            <img src="{$artigo['art_thumb']}" alt="{$artigo['art_title']}">
        </a>
    </div>
    <div>
        <h3><a href="/ler/?{$artigo['art_id']}">{$artigo['art_title']}</a></h3>
        {$artigo['art_intro']}
    </div>
</div>
HTML;

endwhile;

/**
 * Seus códigos PHP desta página terminam aqui! *
 **/

/*
 * Variável que define o título desta página.
 * Essa variável é usada no arquivo "_header.php".
 * OBS: para a página inicial (index.php) usaremos o 'slogan' do site.
 *     Referências:
 *     → https://www.w3schools.com/php/php_variables.asp
 *     → https://www.php.net/manual/pt_BR/language.variables.basics.php
 */
$title = "Quem tem fome tem pressa...";

/*
 * Inclui o cabeçalho da página.
 * A superglobal "$_SERVER['DOCUMENT_ROOT']" retorna o caminho da raiz do site no Windows.
 * Ex.: C:\xampp\htdocs 
 *     Referências:
 *     → https://www.w3schools.com/php/php_includes.asp
 *     → https://www.php.net/manual/pt_BR/function.include.php
 *     → https://www.php.net/manual/pt_BR/language.variables.superglobals.php
 */
require($_SERVER['DOCUMENT_ROOT'] . '/_header.php');

?>

<section>

    <?php
    // Exibe todos os artigos.
    echo $artigos;
    ?>

</section>

<aside>

    <h3>Lateral</h3>
    <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Officia, aperiam corporis culpa consequatur
        iusto.</p>

</aside>

<?php

// Inclui o rodapé da página
require($_SERVER['DOCUMENT_ROOT'] . '/_footer.php');