// PageLoad
$(function () {
    // Recupero i dati utente
    let abbonamento;
    $.ajax({
        type: "GET",
        url: "../ashx/DatiUtente.ashx",
        datatype: "text",
        success: function (text) {
            abbonamento = text;
        }
    });

    // Recupero i dati dei film
    $.ajax({
        type: "GET",
        url: "../ashx/Film.ashx",
        datatype: "xml",
        success: function (xml) {
            // Itero nella tabella dati
            $(xml).find('Video').each(function () {
                // Determino variabili
                let nome = $(this).find('nome').text();
                let sinossi = $(this).find('sinossi').text();
                let img = $(this).find('immagine').text();
                let link = $(this).find('link').text();
                let incluso = $(this).find('incluso').text();

                // Creo il riquadro del film
                $('#content').append($('<div class="card" style="width: 18rem;">')
                    // creo l'immagine
                    .append($('<img class="card-img-top miniatura">').attr('src', 'data:image/jpeg;base64,' + img))
                    .append($('<div class="card-body">')
                        // scrivo titolo
                        .append($('<h5 class="card-title">').text(nome))
                        // scrivo descrizione
                        .append($('<p class="card-text overflow-auto" style="height: 200px;">').text(sinossi))
                    )
                );

                // metto fascetta se non incluso
                if (incluso === 'false') {
                    $('.card:last-child').append($('<div class="fascetta">€</div>'))
                    $('.card:last-child').click(function () {
                        alert("Acquista questo film per poterlo guardare!");
                    })
                    return;
                }

                // Creo link responsivo allo status di abbonato
                switch (abbonamento) {
                    case 'NESSUNO':
                        $('.card:last-child').click(function () {
                            alert("Esegui il login per guardare video");
                        })
                        break;
                    case 'True':
                        $('.card:last-child').click(function () {
                            window.location.href = link;
                        })
                        break;
                    case 'False':
                        $('.card:last-child').click(function () {
                            alert("Abbonati per guardare video");
                        })
                        break;
                }
            })
        }
    });
})