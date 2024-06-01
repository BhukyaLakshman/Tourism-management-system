<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <!-- Add your CSS links here -->
           <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
   <link rel="stylesheet" href="style.css">
</head>
<body>
 <%@ include file="userheader.jsp" %>
   <!-- Registration Start -->
    <div class="container-fluid bg-registration py-5 with-background" style="margin: 90px 0;">
        <div class="container py-5 ">
            <div class="row align-items-center">
                <div class="col-lg-7 mb-5 mb-lg-0">
                    <div class="mb-4">
                        <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">Mega Offer</h6>
                        <h1 class="text-white"><span class="text-primary">30% OFF</span> for Singles</h1>
                    </div>
                    <p class="text-white">Invidunt lorem justo sanctus clita. Erat lorem labore ea, justo dolor lorem ipsum ut sed eos,
                        ipsum et dolor kasd sit ea justo. Erat justo sed sed diam. Ea et erat ut sed diam sea ipsum est
                        dolor</p>
                    <ul class="list-inline text-white m-0">
                        <li class="py-2"><i class="fa fa-check text-primary mr-3"></i>Labore eos amet dolor amet diam</li>
                        <li class="py-2"><i class="fa fa-check text-primary mr-3"></i>Etsea et sit dolor amet ipsum</li>
                        <li class="py-2"><i class="fa fa-check text-primary mr-3"></i>Diam dolor diam elitripsum vero.</li>
                    </ul>
                </div>
               <div class="col-lg-5">
    <div class="card border-0" id="booking">
        <div class="card-header bg-primary text-center p-4">
            <h1 class="text-white m-0">Booking Slot</h1>
        </div>
        <div class="card-body rounded-bottom bg-white p-5">
            <form action="booking" method="POST">
                <div class="form-group">
                    <input type="text" class="form-control p-4" name="name" placeholder="Your name" required="required" />
                </div>
                <div class="form-group">
                    <input type="email" class="form-control p-4" name="email" placeholder="Your email" required="required" />
                </div>
                <div class="form-group">
                    <input type="date" class="form-control p-4" name="fromdate" placeholder="Select date" required="required" />
                </div>
                 <div class="form-group">
                    <input type="date" class="form-control p-4" name="todate" placeholder="Select date" required="required" />
                </div>
                <div class="form-group">
                    <input type="number" class="form-control p-4" name="members" placeholder="Number of members" required="required" />
                </div>
                <div class="form-group">
                    <select class="custom-select px-4" name="destination" style="height: 47px;">
                        <option selected>Select a destination</option>
                        <option value="1">destination 1</option>
                        <option value="2">destination 2</option>
                        <option value="3">destination 3</option>
                         <option value="1">destination 4</option>
                        <option value="2">destination 5</option>
                        <option value="3">destination 6</option>
                    </select>
                </div>
                <div>
                    <button class="btn btn-primary btn-block py-3" type="submit">Book Now</button>
                </div>
            </form>
        </div>
    </div>
</div>


            </div>
        </div>
    </div>
    <!-- Registration End -->
     <%@ include file="userfooter.jsp" %>
</body>
</html>