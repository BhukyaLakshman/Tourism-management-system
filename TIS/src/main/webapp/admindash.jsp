<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Traveller | Admin Dashboard</title>
<!-- Add your CSS links here -->
<link rel="icon" href="img/travel-svgrepo-com.svg" type="image/svg+xml">
           <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet"> 
 <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
   <link rel="stylesheet" href="style.css">
   <style>
   .with-background {
    background-image: url('img/blogbg.jpg');
    background-size: cover; /* Adjust as needed */
    background-position: center; /* Adjust as needed */
}.

</style>
</head>
<body>
<%@ include file="adminheader.jsp" %>
<div class="with-background">
    <div class="container-fluid page-header ">
    
        <div class="container ">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 400px">
                <h3 class="display-5 text-white text-uppercase"> <i>Admin Dashboard</i></h3>
                      

            </div>
        </div>
    </div>
    </div>
<%
    // Define your database connection details
    String jdbcUrl = "jdbc:mysql://localhost:3306/tis";
    String dbUsername = "root";
    String dbPassword = "root";

    // Define variables to hold row counts
    int usersRowCount = 0;
    int bookingRowCount = 0;
    int contactMessagesRowCount = 0;

    try {
        // Load the MySQL JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Connect to the database
        Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);

        // Get row count for users table
        String usersSql = "SELECT COUNT(*) AS total FROM users";
        Statement usersStatement = connection.createStatement();
        ResultSet usersResultSet = usersStatement.executeQuery(usersSql);
        if (usersResultSet.next()) {
            usersRowCount = usersResultSet.getInt("total");
        }
        usersResultSet.close();
        usersStatement.close();

        // Get row count for booking table
        String bookingSql = "SELECT COUNT(*) AS total FROM booking";
        Statement bookingStatement = connection.createStatement();
        ResultSet bookingResultSet = bookingStatement.executeQuery(bookingSql);
        if (bookingResultSet.next()) {
            bookingRowCount = bookingResultSet.getInt("total");
        }
        bookingResultSet.close();
        bookingStatement.close();

        // Get row count for contactmessages table
        String contactMessagesSql = "SELECT COUNT(*) AS total FROM contactmessages";
        Statement contactMessagesStatement = connection.createStatement();
        ResultSet contactMessagesResultSet = contactMessagesStatement.executeQuery(contactMessagesSql);
        if (contactMessagesResultSet.next()) {
            contactMessagesRowCount = contactMessagesResultSet.getInt("total");
        }
        contactMessagesResultSet.close();
        contactMessagesStatement.close();

        // Close database connection
        connection.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

 <section class="container px-5 py-24 mx-auto">
        <div class="flex flex-col text-center w-full mb-20">
            <h1 class="sm:text-3xl text-2xl font-medium title-font mb-4 text-gray-900">A Comprehensive Tourism Website </h1>
            <p class="lg:w-2/3 mx-auto leading-relaxed text-base">
                Whatever cardigan tote bag tumblr hexagon brooklyn asymmetrical gentrify, subway tile poke farm-to-table.
                Franzen you probably haven't heard of them man bun deep jianbing selfies heirloom prism food truck ugh squid celiac humblebrag.
            </p>
        </div>
        <div class="flex flex-wrap -m-4 text-center" style="display:flex;justify-content:center">
           
            <div class="p-4 md:w-1/4 sm:w-1/2 w-full">
                <div class="border-2 border-gray-200 px-4 py-6 rounded-lg">
                    <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                         class="text-indigo-500 w-12 h-12 mb-3 inline-block" viewBox="0 0 24 24">
                        <path d="M17 21v-2a4 4 0 00-4-4H5a4 4 0 00-4 4v2"></path>
                        <circle cx="9" cy="7" r="4"></circle>
                        <path d="M23 21v-2a4 4 0 00-3-3.87m-4-12a4 4 0 010 7.75"></path>
                    </svg>
                    <h3 class="body-font font-medium text-2xl text-gray-600"><%= usersRowCount %></h3>
                    <p class="leading-relaxed">Users</p>
                </div>
            </div>
            <div class="p-4 md:w-1/4 sm:w-1/2 w-full">
                <div class="border-2 border-gray-200 px-4 py-6 rounded-lg">
                    <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                         class="text-indigo-500 w-12 h-12 mb-3 inline-block" viewBox="0 0 24 24">
                        <path class="st0" d="M27,31c-2.9-3.6-7.4-6-12.5-6S4.9,27.4,2,31H27z"/> <path class="st0" d="M8.6,12v1H17c-1.6-2.4-4.2-4-7-4s-5.4,1.6-7,4h3.6L8.6,12z"/> <path class="st0" d="M10.9,5.5l-0.7,0.8l6.2,5.7C17,9,16.2,6,14.1,4.1S9,1.7,6.1,2.5l2.6,2.4L10.9,5.5z"/> <path class="st0" d="M21.6,9.5l0.5,0.9l7.5-3.8c-2.6-1.4-5.5-1.7-8.1-0.4s-4.1,3.8-4.4,6.7l3.2-1.6L21.6,9.5z"/> <path class="st0" d="M16,13L16,13c1.3,3.8,0.7,7.9-1.5,11.3L14,25"/> <path class="st0" d="M18,13l0.9,1.5c2,3.5,2.4,7.7,1.1,11.5l0,0"/> </svg>
                    <h3 class="body-font font-medium text-2xl text-gray-600"><%= bookingRowCount %></h3>
                    <p class="leading-relaxed">Bookings</p>
                </div>
            </div>
            <div class="p-4 md:w-1/4 sm:w-1/2 w-full">
                <div class="border-2 border-gray-200 px-4 py-6 rounded-lg">
                    <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                         class="text-indigo-500 w-12 h-12 mb-3 inline-block" viewBox="0 0 24 24">
                        <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
                    </svg>
                    <h3 class="body-font font-medium text-2xl text-gray-600"><%= contactMessagesRowCount %></h3>
                    <p class="leading-relaxed">Issuesd solved</p>
                </div>
            </div>
        </div>
    </section>
<!-- Bootstrap JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>  
    
<%@ include file="userfooter.jsp" %>
</body>
</html>