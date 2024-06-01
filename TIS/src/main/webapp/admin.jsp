<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Traveller | Admin Login </title>
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<style>
    .card {
        border-radius: 15px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    }

    .form-group {
        margin-bottom: 25px;
    }

    .form-control {
        border-radius: 10px;
    }

    .btn-primary {
        border-radius: 10px;
    }
    .with-background {
    background-image: url('img/bg.jpg');
    background-size: cover; /* Adjust as needed */
    background-position: center; /* Adjust as needed */
    height: 100vh; /* Set height to 100 viewport height */
    overflow: hidden; /* Prevent background overflow */
     }

</style>
</head>
<body class="with-background">

<%@ include file="header.jsp" %>
<div class="container-fluid py-5 ">
    <div class="container py-5">
        <div class="text-center mb-3 pb-3">
            <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;"> Admin Login</h6>
         
        </div>
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="contact-form bg-white" style="padding: 30px;">
                    <div id="success"></div>
                    <form name="loginForm" id="loginForm" method="POST" action="adminLogin" novalidate="novalidate">
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" class="form-control form-control-md p-4" id="password" name="password" placeholder="Password"
                                required="required" data-validation-required-message="Please enter your password" />
                            <p class="help-block text-danger"></p>
                        </div>
                        <div class="text-center">
                            <button class="btn btn-primary py-2 px-5" type="submit">Login</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>






<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
<%@ include file="footer.jsp" %>
