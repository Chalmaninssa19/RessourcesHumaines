document.addEventListener("DOMContentLoaded", function () {
    var formulaireDiplome = document.getElementById("formulaireDiplome");
    formulaireDiplome.addEventListener("submit", function (event) {
        event.preventDefault();

        // Récupérez les données du formulaire
        var diplome = document.getElementById("diplome").value;
        var diplomeNote = document.getElementById("diplomeNote").value;

        var xhr = new XMLHttpRequest();

        xhr.open("POST", "WantedProfileServlet", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        xhr.onload = function () {
            if (xhr.status === 200) {
                alert("Données envoyées vers le servlet : " + xhr.responseText);

                var donnees = JSON.parse(xhr.responseText);
                var listeDonneesDiv = document.getElementById("listeDonnees");
                listeDonneesDiv.innerHTML = "";

                for (var i = 0; i < donnees.length; i++) {
                    var donnee = donnees[i];
                    var paragraphe = document.createElement("p");
                    paragraphe.textContent = donnee;
                    listeDonneesDiv.appendChild(paragraphe);
                }
            } else {
                alert("Erreur lors de la requête : " + xhr.status);
            }
        };

        // Envoyez les données au Servlet
        var formData = "diplome=" + encodeURIComponent(diplome) + "&diplomenote=" + encodeURIComponent(diplomeNote);
        xhr.send(formData);
    });
});



