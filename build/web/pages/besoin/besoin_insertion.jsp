<%@page import="model.requis.Service"%>
<% Service service = (Service)request.getAttribute("service"); %>
<!DOCTYPE html>
<html>
    <head>
        <title>Saisie besoin</title>
        <meta charset="utf-8" />
    </head>
    <body>
        <h1>Service : <%=service.getService() %></h1>
        <form id="formTask" action="BesoinServlet" method="post" accept-charset="UTF-8">
             <label>Description du besoin</label>
            <p>
                <textarea name="description"></textarea>
            </p>
            <label>Listes des taches</label>
            <p>
                <input type="text" id="task" name="tasks" placeholder="Ajouter une tache"/>
                <button type="submit">Ajouter</button>
            </p>
            <div id="reponse">
                <ul id="valeursSaisies"></ul> <!-- Liste pour afficher les valeurs saisies -->
            </div>
            <p>
                <input type="submit" value="Suivant"/>
            </p>
        </form>
        <script>
            document.getElementById('formTask').addEventListener('submit', function(event) {
            event.preventDefault();  // Empêche le rechargement de la page

            var task = document.getElementById('task').value;

            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'addTaskServlet', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');

            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        // Traitement des données renvoyées par le servlet si besoin
                        //var taskAdded = document.getElementById('taskAdded');
                        //taskAdded.innerHtml = xhr.responseText;
                        var valeursSaisies = document.getElementById('valeursSaisies');
                        var listItem = document.createElement('li');
                        listItem.textContent = xhr.responseText;
                        valeursSaisies.insertBefore(listItem, valeursSaisies.firstChild);
           
                        console.log(xhr.responseText);
                    } else {
                        console.error('Une erreur s\'est produite : ' + xhr.status);
                    }
                }
            };

            // Créez une chaîne de requête avec les données du formulaire
            var formData = 'task=' + encodeURIComponent(task);

            // Envoyez la requête
            xhr.send(formData);
        });

        </script>  
    </body>
</html