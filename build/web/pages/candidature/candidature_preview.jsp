<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Insertion candidature</title>
        <!-- plugins:css -->
        <link rel="stylesheet" href="./assets/vendors/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="./assets/vendors/css/vendor.bundle.base.css">
        <link rel="stylesheet" href="./assets/css/candidature/candidature_preview.css">
        <!-- endinject -->
        <!-- Plugin css for this page -->
        <!-- End plugin css for this page -->
        <!-- inject:css -->
        <!-- endinject -->
        <!-- Layout styles -->
        <link rel="stylesheet" href="./assets/css/style.css">
        <!-- End layout styles -->
        <link rel="shortcut icon" href="./assets/images/favicon.ico" />
    </head>

    <body>
        <div class="container-scroller">
            <div class="container-fluid page-body-wrapper full-page-wrapper">
                <div class="content-wrapper d-flex align-items-center auth">
                    <div class="row flex-grow">
                        <div class="col-lg-10 mx-auto">
                            <div class="auth-form-light text-left p-5">
                                <div class="d-flex align-items-center brand-logo" style="color: #da8cff;">
                                    <i class="mdi mdi-vector-arrange-above" style="font-size: 35px;margin-right: 25px;"></i>
                                    <h3 style="margin: 0;">Huile de bongolava</h3>
                                </div>
                                <h4>Voila une aperçue de votre CV</h4>
                                <h6 class="font-weight-light little-line-height">Nous allons maintenant finaliser la réalisation de votre
                                    candidature en envoyant tous <br> les dossiers que vous penser utile et une photo d'identite</h6> 
                                <div class="col-md-6 p-5">
                                </div>
                                <div class="col-md-6 p-5">
                                    <h6 class="card-title">Uploader les dossiers et le photo d'identité ici</h6>
                                    <form method="post" action="/RessourceHumaine/PreviewCandidatureServlet" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <input type="file" name="dossier" />
                                        </div>
                                        <div class="form-group">
                                            <input type="file" name="image" />
                                        </div>
                                        <input type="submit" value="Upload" />
                                    </form>
                                    <button class="btn form-control  btn-gradient-primary mt-4">POSTULER VOTRE CANDIDATURE</button>
                                    <div class="mt-4 d-flex align-items-center">
                                        <div class="">
                                            <i class="mdi mdi-arrow-left-bold-circle-outline retour-icone"></i>
                                        </div>
                                        <div class="">
                                            <a href="" class="link mx-4">Retour</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- content-wrapper ends -->
        </div>
        <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="../assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="./assets/js/off-canvas.js"></script>
    <script src="./assets/js/hoverable-collapse.js"></script>
    <script src="./assets/js/misc.js"></script>
    <script src="./assets/js/file-upload.js"></script>
    <!-- endinject -->
</body>

</html>