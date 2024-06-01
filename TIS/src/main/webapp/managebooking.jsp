<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking List</title>
   <!-- Add your CSS links here -->
           <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
   <link rel="stylesheet" href="style.css"></head>
<body>
<%@ include file="adminheader.jsp" %>

</div>
    <div class="container mt-5">
        <h2 align="center">Manage Bookings</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>From Date</th>
                    <th>To Date</th>
                    <th>Members</th>
                    <th>Destination</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                try {
                    // Establish database connection
                    String url = "jdbc:mysql://localhost:3306/tis";
                    String username = "root";
                    String password = "root";
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection(url, username, password);

                    // Retrieve data from Booking table, ordering by a column representing the order of insertion (assuming 'booking_id' is auto-incremented)
                    String query = "SELECT * FROM Booking ORDER BY booking_id DESC"; // Order by booking_id in descending order to get newest rows first
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    // Iterate through the result set and display data in table rows
                    while(rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getString("fromdate") %></td>
                    <td><%= rs.getString("todate") %></td>
                    <td><%= rs.getInt("members") %></td>
                    <td><%= rs.getString("destination") %></td>
                    <td>
                        <a href="edit_booking.jsp?id=<%= rs.getInt("booking_id") %>" class="btn btn-primary">Edit</a>
                        <a href="deleterecord.jsp?id=<%= rs.getInt("booking_id") %>" class="btn btn-danger">Cancel</a>
                    </td>
                </tr>
                <% 
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    // Close JDBC objects
                    try {
                        if (rs != null) rs.close();
                        if (pstmt != null) pstmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                %>
            </tbody>
        </table>
    </div>
    <br><br><br><%@ include file="userfooter.jsp" %>
</body>
</html>
