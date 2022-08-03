// PageLoad
$(function () {
    CreaRiquadri();
})

// Funzioni
function CreaRiquadri() {
    // Recupero i dati utente
    var abbonamento;
    $.ajax({
        type: "GET",
        url: "../ashx/DatiUtente.ashx",
        datatype: "text",
        success: function (text) {
            abbonamento = text;
        }
    });

    // Recupero i dati dei film
    var xmlVideo;
    $.ajax({
        type: "GET",
        url: "../ashx/Film.ashx",
        datatype: "xml",
        success: function (xml) {
            xmlVideo = xml
        }
    });

    // Itero nella tabella dati
    $(xmlVideo).find('Video').each(function () {
        // Determino variabili
        let nome = this.find('nome').text;
        let sinossi = this.find('sinossi').text;
        let img = this.find('immagine').text;
        let link = this.find('link').text;
        let incluso = this.find('incluso').text;

        // Creo il riquadro del film
        let card = $('#content').append($('#card')
            // creo l'immagine
            .append($('<img class="card-img-top">').attr('src', 'data:image/jpeg;base64,' + btoa(img)))
            .append($('<div class="card-body">')
                // scrivo titolo
                .append($('<h5 class="card-title">').text(nome))
                // scrivo descrizione
                .append($('<p class="card-text">').text(sinossi))
            )
        );

        // metto fascetta se non incluso
        if (incluso === False) {
            card.append($('<div class="fascetta">€</div>'))
            return;
        }

        // Creo link responsivo allo status di abbonato
        switch (abbonamento) {
            case 'NESSUNO':
                card.click(function () {
                    alert("Esegui il login per guardare video");
                })
                break;
            case 'True':
                card.click(function () {
                    window.location.href = link;
                })
                break;
            case 'False':
                card.click(function () {
                    alert("Abbonati per guardare video");
                })
                break;
        }
    })
}