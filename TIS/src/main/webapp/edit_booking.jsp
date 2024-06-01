<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Booking</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <!-- SweetAlert CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
</head>
<body>

<%@ include file="adminheader.jsp" %>

<div class="container mt-5">
    <h2>Edit Booking</h2>
    <%
        Connection conn = null;
        PreparedStatement pstmtSelect = null;
        PreparedStatement pstmtUpdate = null;
        ResultSet rs = null;

        try {
            // Get the booking ID from request parameter
            int bookingId = Integer.parseInt(request.getParameter("id"));

            // Establish database connection
            String jdbcUrl = "jdbc:mysql://localhost:3306/tis";
            String dbUsername = "root";
            String dbPassword = "root";
            conn = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);

            // Check if the form has been submitted
            if (request.getMethod().equalsIgnoreCase("post")) {
                // Get updated booking data from form parameters
                String updatedName = request.getParameter("name");
                String updatedEmail = request.getParameter("email");
                String updatedFromDate = request.getParameter("fromdate");
                String updatedToDate = request.getParameter("todate");
                int updatedMembers = Integer.parseInt(request.getParameter("members"));
                String updatedDestination = request.getParameter("destination");

                // Prepare and execute UPDATE query to update the booking data
                String updateQuery = "UPDATE Booking SET name=?, email=?, fromdate=?, todate=?, members=?, destination=? WHERE booking_id=?";
                pstmtUpdate = conn.prepareStatement(updateQuery);
                pstmtUpdate.setString(1, updatedName);
                pstmtUpdate.setString(2, updatedEmail);
                pstmtUpdate.setString(3, updatedFromDate);
                pstmtUpdate.setString(4, updatedToDate);
                pstmtUpdate.setInt(5, updatedMembers);
                pstmtUpdate.setString(6, updatedDestination);
                pstmtUpdate.setInt(7, bookingId);

                int rowsAffected = pstmtUpdate.executeUpdate();
                if (rowsAffected > 0) {
    %>
                    <!-- SweetAlert JavaScript -->
                    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
                    <script>
                        Swal.fire({
                            title: 'Updated!',
                            text: 'Booking data has been updated successfully.',
                            icon: 'success',
                            confirmButtonText: 'OK'
                        }).then(() => {
                            window.location.href = 'managebooking.jsp';
                        });
                    </script>
    <%
                }
            } else {
                // Retrieve booking information based on booking ID
                String selectQuery = "SELECT * FROM Booking WHERE booking_id=?";
                pstmtSelect = conn.prepareStatement(selectQuery);
                pstmtSelect.setInt(1, bookingId);
                rs = pstmtSelect.executeQuery();

                // If booking found, fill the form with existing data
                if (rs.next()) {
                    String name = rs.getString("name");
                    String email = rs.getString("email");
                    String fromDate = rs.getString("fromdate");
                    String toDate = rs.getString("todate");
                    int members = rs.getInt("members");
                    String destination = rs.getString("destination");
    %>
                    <form action="edit_booking.jsp?id=<%= bookingId %>" method="post">
                        <div class="form-group">
                            <label for="name">Name:</label>
                            <input type="text" class="form-control" id="name" name="name" value="<%= name %>" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" class="form-control" id="email" name="email" value="<%= email %>" required>
                        </div>
                        <div class="form-group">
                            <label for="fromdate">From Date:</label>
                            <input type="date" class="form-control" id="fromdate" name="fromdate" value="<%= fromDate %>" required>
                        </div>
                        <div class="form-group">
                            <label for="todate">To Date:</label>
                            <input type="date" class="form-control" id="todate" name="todate" value="<%= toDate %>" required>
                        </div>
                        <div class="form-group">
                            <label for="members">Members:</label>
                            <input type="number" class="form-control" id="members" name="members" value="<%= members %>" required>
                        </div>
                        <div class="form-group">
                            <label for="destination">Destination:</label>
                            <input type="text" class="form-control" id="destination" name="destination" value="<%= destination %>" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Update</button>
                    </form>
    <%
                } else {
    %>
                    <div class="alert alert-danger" role="alert">
                        Booking not found!
                    </div>
    <%
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close JDBC objects
            try {
                if (rs != null) rs.close();
                if (pstmtSelect != null) pstmtSelect.close();
                if (pstmtUpdate != null) pstmtUpdate.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</div>
<br><br>
<%@ include file="userfooter.jsp" %>
</body>
</html>
