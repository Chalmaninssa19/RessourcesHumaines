<!-- <%@ page contentType="text/html; charset=UTF-8" %> -->
<%@page import="java.util.ArrayList"%>
<%@page import="model.requis.Service"%>
<%@page import="model.gestionBesoin.Unity"%>
<%@page import=" java.util.List "%>
<%@page import=" model.gestionProfile.Diplome "%>
<%@page import=" model.gestionProfile.Adresse "%>
<%@page import=" model.gestionProfile.Salaire "%>
<%@page import=" model.gestionProfile.Sexe "%>
<%@page import=" model.gestionProfile.Experience "%>
<%@include file="../header.jsp" %>
<%
    List<Diplome> listeDiplome = (List<Diplome>) request.getAttribute("listeDiplome");
    List<Adresse> listeAdresse = (List<Adresse>) request.getAttribute("listeAdresse");
    List<Experience> listeExperience = (List<Experience>) request.getAttribute("listeExperience");
    List<Salaire> listeSalaire = (List<Salaire>) request.getAttribute("listeSalaire");
    List<Sexe> listeSexe = (List<Sexe>) request.getAttribute("listeSexe");
%>

            <!-- Modal pour l'insertion d'un nouveau profil -->
            <div class="modal fade" id="newProfil" tabindex="-1" aria-labelledby="newProfilLabel" aria-hidden="true">
                <div class="modal-dialog  modal-xl modal-dialog-centered">
                    <div class="modal-content card-body">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="newProfilLabel">Insertion nouveau profile</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            <hr>
                        </div>
                        <div class="modal-body">
                            <form class="forms-sample">
                                <div class="form-group row">
                                    <label for="profileName" class="col-sm-2 col-form-label">Nom du profile</label>
                                    <div class="col-sm-5">
                                        <input type="text" class="form-control" id="profileName">
                                    </div>
                                </div>

                                <hr>

                                <div class="row">
                                    <div class="side-by-side col-md-6">
                                        <!-- Section diplome -->
                                        <div class="diplome">
                                            <div
                                                class="form-group row d-flex align-items-center justify-content-center">
                                                <label for="diplomeChoice"
                                                    class="col-sm-2 col-form-label">Diplome</label>
                                                <div class="col-sm-5 reduce-padding">
                                                    <select name="" id="diplomeChoice"
                                                        class="form-control form-control-sm form-select">
                                                        <option value="">License en Informatique</option>
                                                        <option value="">Master en Informatique</option>
                                                    </select>
                                                </div>
                                                <div class="col-sm-2 reduce-padding">
                                                    <input type="number" class="form-control form-control-sm" name=""
                                                        placeholder="Note">
                                                </div>
                                                <div class="col-sm-2 reduce-padding">
                                                    <button type="button"
                                                        class="btn btn-gradient-primary btn-sm">Ajouter</button>
                                                </div>
                                            </div>
                                            <div class="profil-critere-container">
                                                <div class="row d-flex align-items-center border-bottom">
                                                    <div class="col-sm-7">
                                                        License en Informatique
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <strong>5</strong>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <i class="remove mdi mdi-close-circle-outline"></i>
                                                    </div>
                                                </div>

                                                <div class="row d-flex align-items-center border-bottom">
                                                    <div class="col-sm-7">
                                                        License en Informatique
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <strong>5</strong>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <i class="remove mdi mdi-close-circle-outline"></i>
                                                    </div>
                                                </div>

                                                <div class="row d-flex align-items-center border-bottom">
                                                    <div class="col-sm-7">
                                                        License en Informatique
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <strong>5</strong>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <i class="remove mdi mdi-close-circle-outline"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="side-by-side col-md-6">
                                        <div class="experience">
                                            <div
                                                class="form-group row d-flex align-items-center justify-content-center">
                                                <label for="diplomeChoice"
                                                    class="col-sm-2 col-form-label">Experience</label>
                                                <div class="col-sm-5 reduce-padding">
                                                    <select name="" id="diplomeChoice"
                                                        class="form-control form-control-sm form-select">
                                                        <option value="">2 ans d'experience</option>
                                                        <option value="">5 ans d'experience</option>
                                                    </select>
                                                </div>
                                                <div class="col-sm-2 reduce-padding">
                                                    <input type="number" class="form-control form-control-sm" name=""
                                                        placeholder="Note">
                                                </div>
                                                <div class="col-sm-2 reduce-padding">
                                                    <button type="button"
                                                        class="btn btn-gradient-primary btn-sm">Ajouter</button>
                                                </div>
                                            </div>

                                            <div class="profil-critere-container">
                                                <div class="row d-flex align-items-center border-bottom">
                                                    <div class="col-sm-7">
                                                        5 ans d'éxperience
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <strong>5</strong>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <i class="remove mdi mdi-close-circle-outline"></i>
                                                    </div>
                                                </div>

                                                <div class="row d-flex align-items-center border-bottom">
                                                    <div class="col-sm-7">
                                                        3 ans d'éxperience
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <strong>5</strong>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <i class="remove mdi mdi-close-circle-outline"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="side-by-side col-md-6">
                                        <div class="salaire mt-3">
                                            <div
                                                class="form-group row d-flex align-items-center justify-content-center">
                                                <label for="diplomeChoice"
                                                    class="col-sm-2 col-form-label">Salaire</label>
                                                <div class="col-sm-5 reduce-padding">
                                                    <select name="" id="diplomeChoice"
                                                        class="form-control form-control-sm form-select">
                                                        <option value="">3 000 000 Ar</option>
                                                        <option value="">2 000 000 Ar</option>
                                                    </select>
                                                </div>
                                                <div class="col-sm-2 reduce-padding">
                                                    <input type="number" class="form-control form-control-sm" name=""
                                                        placeholder="Note">
                                                </div>
                                                <div class="col-sm-2 reduce-padding">
                                                    <button type="button"
                                                        class="btn btn-gradient-primary btn-sm">Ajouter</button>
                                                </div>
                                            </div>
                                            <div class="profil-critere-container">
                                                <div class="row d-flex align-items-center border-bottom">
                                                    <div class="col-sm-7">
                                                        3 000 000 Ar
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <strong>5</strong>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <i class="remove mdi mdi-close-circle-outline"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="side-by-side col-md-6">
                                        <div class="sexe mt-3">
                                            <div
                                                class="form-group row d-flex align-items-center justify-content-center">
                                                <label for="diplomeChoice" class="col-sm-2 col-form-label">Sexe</label>
                                                <div class="col-sm-5 reduce-padding">
                                                    <select name="" id="diplomeChoice"
                                                        class="form-control form-control-sm form-select">
                                                        <option value="">Male</option>
                                                        <option value="">Femelle</option>
                                                    </select>
                                                </div>
                                                <div class="col-sm-2 reduce-padding">
                                                    <input type="number" class="form-control form-control-sm" name=""
                                                        placeholder="Note">
                                                </div>
                                                <div class="col-sm-2 reduce-padding">
                                                    <button type="button"
                                                        class="btn btn-gradient-primary btn-sm">Ajouter</button>
                                                </div>
                                            </div>
                                            <div class="profil-critere-container">
                                                <div class="row d-flex align-items-center border-bottom">
                                                    <div class="col-sm-7">
                                                        Male
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <strong>5</strong>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <i class="remove mdi mdi-close-circle-outline"></i>
                                                    </div>
                                                </div>

                                                <div class="row d-flex align-items-center border-bottom">
                                                    <div class="col-sm-7">
                                                        Femelle
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <strong>3</strong>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <i class="remove mdi mdi-close-circle-outline"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="side-by-side col-md-6">
                                        <div class="adresse mt-3">
                                            <div
                                                class="form-group row d-flex align-items-center justify-content-center">
                                                <label for="diplomeChoice" class="col-sm-2 col-form-label">Adresse</label>
                                                <div class="col-sm-5 reduce-padding">
                                                    <select name="" id="diplomeChoice"
                                                        class="form-control form-control-sm form-select">
                                                        <option value="">Andoharanofotsy</option>
                                                        <option value="">Mahamasina</option>
                                                        <option value="">Iavoloha</option>
                                                    </select>
                                                </div>
                                                <div class="col-sm-2 reduce-padding">
                                                    <input type="number" class="form-control form-control-sm" name=""
                                                        placeholder="Note">
                                                </div>
                                                <div class="col-sm-2 reduce-padding">
                                                    <button type="button"
                                                        class="btn btn-gradient-primary btn-sm">Ajouter</button>
                                                </div>
                                            </div>
                                            <div class="profil-critere-container">
                                                <div class="row d-flex align-items-center border-bottom">
                                                    <div class="col-sm-7">
                                                        Andoharanofotsy
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <strong>5</strong>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <i class="remove mdi mdi-close-circle-outline"></i>
                                                    </div>
                                                </div>

                                                <div class="row d-flex align-items-center border-bottom">
                                                    <div class="col-sm-7">
                                                        Autre
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <strong>1</strong>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <i class="remove mdi mdi-close-circle-outline"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </form>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-gradient-primary">Valider</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal pour le choix d'un profil -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog  modal-xl modal-dialog-centered">
                    <div class="modal-content card-body">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Choisir le profil</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            <hr>
                        </div>
                        <div class="modal-body">
                            <button type="submit" class="btn btn-gradient-primary me-2" data-bs-toggle="modal"
                                data-bs-target="#newProfil">Crée un nouveau profile</button>

                            <div class="mt-4">
                                <h4 class="card-title mb-4">Liste des ancien profiles existants</h4>
                                <div class="row profile-list">

                                    <div class="col-md-3 stretch-card grid-margin" onclick="clicked(1)">
                                        <div class="card ">
                                            <div class="profile-card">
                                                <div class="remove-floating">
                                                    <i class="remove mdi mdi-close-circle-outline"></i>
                                                </div>
                                                <h5 class="profile-title">Développeur JAVA</h5>
                                                <ul>
                                                    <li class="profile-diplome">Master en Informatique</li>
                                                    <li class="profile-experience">5 ans d'éxperience</li>
                                                    <li class="profile-salary">2 200 000 Ar</li>
                                                    <li class="profile-sexe">Male</li>
                                                    <li class="profile-adress">Andoharanofotsy</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-3 stretch-card grid-margin" onclick="clicked(2)">
                                        <div class="card ">
                                            <div class="profile-card">
                                                <div class="remove-floating">
                                                    <i class="remove mdi mdi-close-circle-outline"></i>
                                                </div>
                                                <h5 class="profile-title">Développeur JAVA</h5>
                                                <ul>
                                                    <li class="profile-diplome">Master en Informatique</li>
                                                    <li class="profile-experience">5 ans d'éxperience</li>
                                                    <li class="profile-salary">2 200 000 Ar</li>
                                                    <li class="profile-sexe">Male</li>
                                                    <li class="profile-adress">Andoharanofotsy</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-3 stretch-card grid-margin" onclick="clicked(3)">
                                        <div class="card ">
                                            <div class="profile-card">
                                                <div class="remove-floating">
                                                    <i class="remove mdi mdi-close-circle-outline"></i>
                                                </div>
                                                <h5 class="profile-title">Développeur JAVA</h5>
                                                <ul>
                                                    <li class="profile-diplome">Master en Informatique</li>
                                                    <li class="profile-experience">5 ans d'éxperience</li>
                                                    <li class="profile-salary">2 200 000 Ar</li>
                                                    <li class="profile-sexe">Male</li>
                                                    <li class="profile-adress">Andoharanofotsy</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button onclick="profileValided()" type="button" class="btn btn-gradient-primary">Valider</button>
                        </div>
                    </div>
                </div>
            </div>


            <%  if(request.getAttribute("service") != null) {
                    Service service = (Service)request.getAttribute("service");
                    ArrayList<Unity> unitys = (ArrayList<Unity>)request.getAttribute("unitys");
            %>
            <!-- partial -->
            <div class="main-panel">
                <div class="content-wrapper">
                    <div class="row">
                        <div class="col-md-6 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Service : <%=service.getService() %></h4>
                                    <p class="card-description"> Veuillez bien remplir les formulaires et bien décrire
                                        vos demandes </p>
                                    <form id="formTask" class="forms-sample" method="post" accept-charset="UTF-8">
                                        <div class="form-group">
                                            <label for="besoinDescription">Description du besoin</label>
                                            <textarea name="description" id="description" class="form-control" cols="30"
                                                rows="10"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Liste des taches</label>
                                            <div class="row d-flex align-items-center">
                                                <div class="col-md-6">
                                                    <input type="text" id="task" name="tasks" class="form-control"
                                                        placeholder="Nouvelle tache">
                                                </div>
                                                <div class="col-md-6">
                                                    <button  
                                                       class="btn btn-gradient-primary me-2">Ajouter</button>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group task-list">
                                            <div class="list-wrapper">
                                                <ul id="valueEnter" class="d-flex flex-column-reverse todo-list todo-list-custom">
                                                   
                                                </ul>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="">Charge de travail et profil recherché</h4>
                                    <button data-bs-toggle="modal" data-bs-target="#exampleModal"
                                        class="btn btn-gradient-primary me-1">Choisir le
                                        profil</button>
                                    <form id="formWorkLoad" class="forms-sample mt-3" action="addBesoinServlet" method="post"> 
                                        <div class="row d-flex align-items-start">
                                            <div class="form-group col-md-4">
                                                <label for="volumeHorraire">Volume horraire</label>
                                                <input type="number" class="form-control" id="volumeHorraire"
                                                    placeholder="40">
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label for="unitySelect">Unité</label>
                                                <select name="" id="unitySelect" class="form-control-sm form-select">
                                                    <% for(int i = 0; i < unitys.size(); i++) { %>
                                                    <option value=<%=unitys.get(i).getIdUnity() %>><%=unitys.get(i).getUnity() %></option>
                                                    <% } %>   
                                                </select>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label for="unitySelect">Unité</label>
                                                <button
                                                    class="btn btn-gradient-primary me-2">Ajouter</button>
                                            </div>
                                        </div>
                                        <div class="form-group task-list mt-3" style="height: 250px;">
                                            <div class="list-wrapper">
                                                <table id="tableWorkLoad" class="table">
                                                    
                                                </table>
                                            </div>
                                        </div>
                                    </form>
                                        <a href="veryZaho">
                                            <button onclick="sendBesoin()" class="btn btn-gradient-primary me-2">Envoye du
                                            besoin</button>
                                        </a>
                                   
                                </div>
                            </div>
                        </div>

                    </div>


                </div>
                <!-- content-wrapper ends -->
                <!-- partial:/partials/_footer.html -->
                <footer class="footer">
                    <div class="container-fluid d-flex justify-content-between">
                        <span class="text-muted d-block text-center text-sm-start d-sm-inline-block">Copyright �
                            bootstrapdash.com 2021</span>
                        <span class="float-none float-sm-end mt-1 mt-sm-0 text-end"> Free <a
                                href="https://www.bootstrapdash.com/bootstrap-admin-template/" target="_blank">Bootstrap
                                admin template</a> from Bootstrapdash.com</span>
                    </div>
                </footer>
                <!-- partial -->
            </div>
            <% } %>
            <!-- main-panel ends -->
        </div>
        <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="./assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="./assets/js/off-canvas.js"></script>
    <script src="./assets/js/hoverable-collapse.js"></script>
    <script src="./assets/js/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <!--AJAX -->
    <script>
        var idClicked = -1;
        var tableWorkLoad = document.getElementById("tableWorkLoad");
            
        function remove(logo) {
            // Récupérer l'élément parent (li) du bouton cliqué et le supprimer
            var parentElement = logo.parentNode;
            parentElement.parentNode.removeChild(parentElement);
            var itemValue = parentElement.childNodes[0].textContent;
            
            var xhr = new XMLHttpRequest();
            xhr.open('GET', './addTaskServlet?itemToRemove='+itemValue, true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');

            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        // Traitement de la réponse si nécessaire
                        console.log('Réponse du serveur : ' + xhr.responseText);
                    } else {
                        console.error('Une erreur s\'est produite : ' + xhr.status);
                    }
                }
            };
            
            xhr.send();
        };
         
        function clicked(id) {
            idClicked = id;
        };
         
        function profileValided () {
            var idValue = idClicked;

            var xhr = new XMLHttpRequest();
            xhr.open('POST', './profileValidedServlet', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');

            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        // Traitement de la réponse si nécessaire
                        console.log('Réponse du serveur : ' + xhr.responseText);
                    } else {
                        console.error('Une erreur s\'est produite : ' + xhr.status);
                    }
                }
            };

            // Créez une chaîne de requête avec la valeur à envoyer
            var formData = 'idValue=' + encodeURIComponent(idValue);

            // Envoyez la requête
            xhr.send(formData);
        };
        
        function createListItem(item) {
          
            var valueEnter = document.getElementById('valueEnter');
            var listItem = document.createElement('li');
            var divItem = document.createElement("div");
            divItem.classList.add("form-check");
            var labelItem = document.createElement("label");
            labelItem.classList.add("form-check-label");
            labelItem.textContent = item;

            var logoItem = document.createElement("i");
            logoItem.classList.add("remove");
            logoItem.classList.add("mdi");
            logoItem.classList.add("mdi-close-circle-outline");
            logoItem.setAttribute("onclick", "remove(this)");

            divItem.appendChild(labelItem);
            listItem.appendChild(divItem);
            listItem.appendChild(logoItem);
            valueEnter.appendChild(listItem);
        
        };
        function createTableworkLoad(table, poste, horaire, unity) {
            var tr = document.createElement("tr");

            var td1 = document.createElement("td");
            td1.textContent = poste;

            var td2 = document.createElement("td");
            td2.textContent = horaire + " " + unity;
            td2.classList.add("to-right");

            var td3 = document.createElement("td");
            var logoQuestion = document.createElement("i");
            logoQuestion.classList.add("list-action");
            logoQuestion.classList.add("primary");
            logoQuestion.classList.add("mdi");
            logoQuestion.classList.add("mdi-comment-question-outline");
            td3.appendChild(logoQuestion);

            var td4 = document.createElement("td");
            var logoDelete = document.createElement("i");
            logoDelete.setAttribute("onclick", "removeWorkLoad(this)");
            logoDelete.classList.add("list-action");
            logoDelete.classList.add("danger");
            logoDelete.classList.add("mdi");
            logoDelete.classList.add("mdi-close-circle-outline");
            td4.appendChild(logoDelete);

            tr.appendChild(td1);
            tr.appendChild(td2);
            tr.appendChild(td3);
            tr.appendChild(td4);
            table.appendChild(tr);
        };
        
        function removeWorkLoad(logo) {
            var parentElement = logo.parentNode;
            var parent = parentElement.parentNode;
            parent.parentNode.removeChild(parent);
            var poste = parent.cells[0].textContent;
            var hu = parent.cells[1].textContent.split(' ');
            var volumeHorraire = hu[0];
            var unity = hu[1];
            
            
            var xhr = new XMLHttpRequest();
            xhr.open('GET', './addWorkLoadServlet?poste='+poste+'&vh='+volumeHorraire+'&unity='+unity, true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');

            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        // Traitement de la réponse si nécessaire
                        console.log('Réponse du serveur : ' + xhr.responseText);
                    } else {
                        console.error('Une erreur s\'est produite : ' + xhr.status);
                    }
                }
            };
            
            xhr.send();
        
        }
        
        // Fonction pour ajouter une tâche de travail
            function addWorkLoad() {
                var volumeHorraire = document.getElementById("volumeHorraire").value;
                var unitySelect = document.getElementById("unitySelect").value;

                var xhr = new XMLHttpRequest();
                xhr.open('POST', './addWorkLoadServlet', true);
                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');

                xhr.onreadystatechange = function() {
                    if (xhr.readyState === XMLHttpRequest.DONE) {
                        if (xhr.status === 200) {
                            const res = xhr.responseText.split('&');
                            createTableworkLoad(tableWorkLoad, res[0], volumeHorraire, res[1]);
                        } else {
                            console.error('Une erreur s\'est produite : ' + xhr.status);
                        }
                    }
                };

                // Créez une chaîne de requête avec les données du formulaire
                var formData = 'volumeHorraire=' + encodeURIComponent(volumeHorraire) +'&unitySelect=' + encodeURIComponent(unitySelect);

                // Envoyez la requête
                xhr.send(formData);
            }

            // Ajoutez un gestionnaire d'événements au formulaire
            document.getElementById('formWorkLoad').addEventListener('submit', function(event) {
                event.preventDefault();  // Empêche le rechargement de la page
                addWorkLoad();
            });

            function sendBesoin() {
                var descri = document.getElementById("description").value;
                
                 var xhr = new XMLHttpRequest();
                xhr.open('POST', './addBesoinServlet', true);
                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
                xhr.onreadystatechange = function() {
                    if (xhr.readyState === XMLHttpRequest.DONE) {
                        if (xhr.status === 200) {

                        } else {
                            console.error('Une erreur s\'est produite : ' + xhr.status);
                        }
                    }
                };

                // Créez une chaîne de requête avec les données du formulaire
                var formData = 'descri=' + encodeURIComponent(descri);

                // Envoyez la requête
                xhr.send(formData);
                
            }
        

                //Ajouter une tache
                document.getElementById('formTask').addEventListener('submit', function(event) {
                event.preventDefault();  // Empêche le rechargement de la page

                var task = document.getElementById('task').value;

                var xhr = new XMLHttpRequest();
                xhr.open('POST', './addTaskServlet', true);
                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
                xhr.onreadystatechange = function() {
                    if (xhr.readyState === XMLHttpRequest.DONE) {
                        if (xhr.status === 200) {
                            createListItem(xhr.responseText);
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
    <!-- End custom js for this page -->
</body>
</html>