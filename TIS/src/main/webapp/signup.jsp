<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>
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
    background-image: url('img/blog.jpg');
    background-size: cover; /* Adjust as needed */
    background-position: center; /* Adjust as needed */
}
</style>
</head>
<body>

<%@ include file="header.jsp" %>
<div class="container-fluid py-5 with-background">
    <div class="container py-5">
        <div class="text-center mb-3 pb-3">
            <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">Sign Up</h6>
            <h1>Create an Account</h1>
        </div>
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="contact-form bg-white" style="padding: 30px;">
                    <div id="success"></div>
                    <form name="signInForm" id="signInForm" method="POST" action="signin" novalidate="novalidate">
                        <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" class="form-control form-control-md p-4" id="username" name="username" placeholder=" Username"
                                required="required" data-validation-required-message="Please enter your username" />
                            <p class="help-block text-danger"></p>
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control form-control-md p-4" id="email" name="email" placeholder="Email"
                                required="required" data-validation-required-message="Please enter your email" />
                            <p class="help-block text-danger"></p>
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" class="form-control form-control-md p-4" id="password" name="password" placeholder="Password"
                                required="required" data-validation-required-message="Please enter your password" />
                            <p class="help-block text-danger"></p>
                        </div>
                        <div class="text-center">
                            <button class="btn btn-primary py-2 px-4" type="submit" onclick="registration()">Create an Account</button>
                        </div>
                    </form>
                    <div class="text-center mt-3">
                        <p>Already have an account? <a href="login.jsp" class="text-primary">Login here</a></p>
                       </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
function registration()
{
	Swal.fire({
		  icon: "Success",
		  title: "Registration Successfull",
		  text: "you Successfully created your account",
		  timer: 6000,
		  footer: '<a href="login.jsp">Why do I have this issue?</a>'
		});
}
</script>

<%@ include file="footer.jsp" %>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
