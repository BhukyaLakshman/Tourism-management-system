<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Record</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
</head>
<body>
<%
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Get the record ID from the request parameter
        int recordId = Integer.parseInt(request.getParameter("id"));

        // Establish database connection
        String jdbcUrl = "jdbc:mysql://localhost:3306/tis";
        String dbUsername = "root";
        String dbPassword = "root";
        conn = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);

        // Display a confirmation dialog using SweetAlert2
%>
        <!-- SweetAlert2 JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
            Swal.fire({
                title: "Are you sure?",
                text: "You won't be able to revert this!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Yes, delete it!"
            }).then((result) => {
                if (result.isConfirmed) {
                    <% 
                        // Prepare the SQL statement for deletion
                        String deleteQuery = "DELETE FROM users WHERE id=?";
                        pstmt = conn.prepareStatement(deleteQuery);
                        pstmt.setInt(1, recordId);
                        pstmt.executeUpdate();
                    %>
                    Swal.fire({
                        title: "Deleted!",
                        text: "Your record has been deleted.",
                        icon: "success"
                    }).then(() => {
                        window.location.href = "manageuser.jsp"; // Redirect to user data page after deletion
                    });
                } else {
                    // If user cancels, go back to previous page
                    window.history.back();
                }
            });
        </script>
<%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close JDBC objects
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

</body>
</html>
