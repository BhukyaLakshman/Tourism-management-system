<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Record</title>
    <!-- Add your CSS links here -->
    <link rel="stylesheet" href="style.css">
    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
</head>
<body>

<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        int bookingId = Integer.parseInt(request.getParameter("id")); // Get the booking ID from request parameter

        // Establish database connection
        String url = "jdbc:mysql://localhost:3306/tis";
        String username = "root";
        String password = "root";
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, username, password);

        // Retrieve data of the record to be deleted (for display purposes)
        String query = "SELECT * FROM Booking WHERE booking_id=?";
        pstmt = conn.prepareStatement(query);
        pstmt.setInt(1, bookingId);
        rs = pstmt.executeQuery();

        if (rs.next()) {
%>
            <!-- SweetAlert2 JavaScript -->
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script>
                Swal.fire({
                    title: "Are you sure?",
                    text: "You are about to delete the booking for <%= rs.getString("name") %>. You won't be able to revert this!",
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#3085d6",
                    cancelButtonColor: "#d33",
                    confirmButtonText: "Yes, delete it!"
                }).then((result) => {
                    if (result.isConfirmed) {
                        <% 
                            // Perform deletion if user confirms
                            String deleteQuery = "DELETE FROM Booking WHERE booking_id=?";
                            pstmt = conn.prepareStatement(deleteQuery);
                            pstmt.setInt(1, bookingId);
                            pstmt.executeUpdate();
                        %>
                        Swal.fire({
                            title: "Deleted!",
                            text: "The booking has been deleted.",
                            icon: "success"
                        }).then(() => {
                            window.location.href = "managebooking.jsp"; // Redirect to booking list page after deletion
                        });
                    } else {
                        Swal.fire({
                            title: "Cancelled",
                            text: "Your booking is safe.",
                            icon: "error"
                        }).then(() => {
                            window.history.back(); // Go back to previous page if deletion is cancelled
                        });
                    }
                });
            </script>
<%
        } else {
            // If no record found for the given ID
            out.println("No booking found with ID: " + bookingId);
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

</body>
</html>
