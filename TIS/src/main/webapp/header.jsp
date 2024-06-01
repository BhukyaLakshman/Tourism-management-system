<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Traveler</title>
    <link rel="icon" href="img/travel-svgrepo-com.svg" type="image/svg+xml">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    
    <style>
        /* Add animation classes */
        .dropdown-menu.animated.fadeInDown {
            animation-duration: 0.3s;
            animation-name: fadeInDown;
        }
        .dropdown-menu.animated.fadeOutUp {
            animation-duration: 0.3s;
            animation-name: fadeOutUp;
        }
        /* Keyframe animations */
        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translate3d(0, -10%, 0);
            }
            to {
                opacity: 1;
                transform: none;
            }
        }
        @keyframes fadeOutUp {
            from {
                opacity: 1;
                transform: none;
            }
            to {
                opacity: 0;
                transform: translate3d(0, -10%, 0);
            }
        }
    </style>
</head>
<body>
    <!-- Topbar Start -->
    <div class="container-fluid bg-light pt-3 d-none d-lg-block">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 text-center text-lg-left mb-2 mb-lg-0">
                    <div class="d-inline-flex align-items-center">
                        <p><i class="fa fa-envelope mr-2"></i>info@example.com</p>
                        <p class="text-body px-3">|</p>
                        <p><i class="fa fa-phone-alt mr-2"></i>+012 345 6789</p>
                    </div>
                </div>
                <div class="col-lg-6 text-center text-lg-right">
                    <div class="d-inline-flex align-items-center">
                        <a class="text-primary px-3" href="#"><i class="fab fa-facebook-f"></i></a>
                        <a class="text-primary px-3" href="#"><i class="fab fa-twitter"></i></a>
                        <a class="text-primary px-3" href="#"><i class="fab fa-linkedin-in"></i></a>
                        <a class="text-primary px-3" href="#"><i class="fab fa-instagram"></i></a>
                        <a class="text-primary pl-3" href="#"><i class="fab fa-youtube"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Navbar Start -->
    <div class="container-fluid position-relative nav-bar p-0">
        <div class="container-lg position-relative p-0 px-lg-3" style="z-index: 9;">
            <nav class="navbar navbar-expand-lg bg-light navbar-light shadow-lg py-3 py-lg-0 pl-3 pl-lg-5">
                <a href="#" class="navbar-brand">
                    <h1 class="m-0 text-primary"><span class="text-dark">TRAVEL</span>ER</h1>
                </a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between px-3" id="navbarCollapse">
                    <div class="navbar-nav ml-auto py-0">
                        <a href="index.jsp" target="_blank" class="nav-item nav-link active">Home</a>
                        <a href="about.jsp" target="_blank" class="nav-item nav-link">About</a>
                        <a href="package.jsp" target="_blank" class="nav-item nav-link">Tour Packages</a>
                        <a href="blog.jsp" target="_blank" class="nav-item nav-link">Blog</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Login</a>
                            <div class="dropdown-menu border-0 rounded-0 m-0 dropdown-menu-right animated fadeInDown">
                                <a href="login.jsp" class="dropdown-item">Users</a>
                                <a href="admin.jsp" class="dropdown-item">Administrator</a>
                            </div>
                        </div>
                        <a href="contact.jsp" target="_blank" class="nav-item nav-link">Contact</a>
                        <a href="signup.jsp" target="_blank" class="nav-item nav-link">Sign Up</a>
                    </div>
                </div>
            </nav>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
