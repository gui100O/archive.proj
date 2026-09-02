//HEADER

const header = document.querySelector("header");

window.addEventListener("scroll", () => {

    if (window.scrollY > 50) {

        header.classList.add("scrolled");

    } else {

        header.classList.remove("scrolled");

    }

});



//ANIMAÇÃO DAS SEÇÕES

const sections = document.querySelectorAll(

    ".hero, .featured, .acclaimed, .essentials, .directors, .about"

);

const observer = new IntersectionObserver((entradas) => {

    entradas.forEach((entrada) => {

        if (entrada.isIntersecting) {

            entrada.target.classList.add("visible");

        }

    });

}, {

    threshold: 0.15

});



sections.forEach((section) => {

    observer.observe(section);

});



//FILMES

const filmes = document.querySelectorAll(

    ".movie, .essential-film"

);



filmes.forEach((filme) => {

    filme.addEventListener("click", () => {

        const titulo = filme.querySelector("h3").textContent.trim();

        const diretor = filme.querySelector(

            ".movie-info p, .essential-director"

        ).textContent.trim();

        const ano = filme.querySelector(

            ".movie-year, .essential-meta span"

        ).textContent.trim();

        const imagem = filme.querySelector("img").src;

        abrirFicha(titulo, diretor, ano, imagem);

    });

});



// DIRETORES

const diretores = document.querySelectorAll(".director");



diretores.forEach((diretor) => {

    diretor.addEventListener("click", () => {

        const idDiretor = diretor.dataset.diretorId;

        const nomeDiretor = diretor.querySelector("h3").textContent.trim();

        const filmes = filmesPorDiretor[idDiretor] || [];

        abrirFichaDiretor(nomeDiretor, filmes);

    });

});



//ABRIR FICHA DO DIRETOR

function abrirFichaDiretor(nomeDiretor, filmes) {

    const modal = document.createElement("div");

    modal.classList.add("modal", "modal-diretor");



    let listaFilmes = "";



    filmes.slice(0, 4).forEach((filme, index) => {

        listaFilmes += `

            <div class="diretor-filme">

                <div class="diretor-filme-imagem">

                    <img

                        src="${filme.imagem}"

                        alt="Pôster de ${filme.titulo}"

                    >

                </div>



                <div class="diretor-filme-info">

                    <span class="diretor-filme-numero">

                        ${String(index + 1).padStart(2, "0")}

                    </span>



                    <h3>

                        ${filme.titulo}

                    </h3>



                    <p class="diretor-filme-descricao">

                        ${filme.descricao || "Descrição não disponível."}

                    </p>



                    <div class="diretor-filme-meta">

                        <span>

                            ${filme.ano}

                        </span>

                        <span>

                            ${filme.duracao} MIN

                        </span>

                        <span>

                            ${filme.genero.toUpperCase()}

                        </span>

                    </div>

                </div>

            </div>

        `;

    });



    if (filmes.length === 0) {

        listaFilmes = `

            <p class="diretor-sem-filmes">

                Nenhum filme cadastrado.

            </p>

        `;

    }



    modal.innerHTML = `

        <div class="modal-conteudo">

            <button class="modal-fechar">

                ×

            </button>



            <div class="modal-diretor-info">

                <p class="modal-label">

                    ARCHIVE DIRECTOR

                </p>



                <h2>

                    ${nomeDiretor}

                </h2>



                <div class="diretor-lista">

                    ${listaFilmes}

                </div>

            </div>

        </div>

    `;



    document.body.appendChild(modal);



    setTimeout(() => {

        modal.classList.add("ativo");

    }, 10);



    const botaoFechar = modal.querySelector(".modal-fechar");



    botaoFechar.addEventListener("click", () => {

        fecharFicha(modal);

    });



    modal.addEventListener("click", (evento) => {

        if (evento.target === modal) {

            fecharFicha(modal);

        }

    });



    document.addEventListener("keydown", fecharComEsc);



    function fecharComEsc(evento) {

        if (evento.key === "Escape") {

            fecharFicha(modal);

            document.removeEventListener("keydown", fecharComEsc);

        }

    }

}



//CRIAR FICHA DO FILME

function abrirFicha(titulo, diretor, ano, imagem) {

    const modal = document.createElement("div");

    modal.classList.add("modal");



    modal.innerHTML = `

        <div class="modal-conteudo">

            <button class="modal-fechar">

                ×

            </button>



            <div class="modal-imagem">

                <img

                    src="${imagem}"

                    alt="Pôster de ${titulo}"

                >

            </div>



            <div class="modal-info">

                <p class="modal-label">

                    ARCHIVE ENTRY

                </p>



                <h2>

                    ${titulo}

                </h2>



                <p class="modal-diretor">

                    ${diretor}

                </p>



                <p class="modal-ano">

                    ${ano}

                </p>

            </div>

        </div>

    `;



    document.body.appendChild(modal);



    setTimeout(() => {

        modal.classList.add("ativo");

    }, 10);



    const botaoFechar = modal.querySelector(".modal-fechar");



    botaoFechar.addEventListener("click", () => {

        fecharFicha(modal);

    });



    modal.addEventListener("click", (evento) => {

        if (evento.target === modal) {

            fecharFicha(modal);

        }

    });



    document.addEventListener("keydown", fecharComEsc);



    function fecharComEsc(evento) {

        if (evento.key === "Escape") {

            fecharFicha(modal);

            document.removeEventListener("keydown", fecharComEsc);

        }

    }

}



//FECHAR FICHA DO FILME

function fecharFicha(modal) {

    modal.classList.remove("ativo");



    setTimeout(() => {

        modal.remove();

    }, 300);

}