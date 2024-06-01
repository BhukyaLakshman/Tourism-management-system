<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Record</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- SweetAlert CSS -->
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
        String JDBC_DRIVER = "com.mysql.jdbc.Driver";
        String DB_URL = "jdbc:mysql://localhost/tis";
        String USER = "root";
        String PASS = "root";

        Class.forName(JDBC_DRIVER);
        conn = DriverManager.getConnection(DB_URL, USER, PASS);
%>
        <!-- SweetAlert JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
            // Display confirmation dialog using SweetAlert
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    <% 
                        // Prepare the SQL statement for deletion
                        String sql = "DELETE FROM contactmessages WHERE id=?";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setInt(1, recordId);
                        pstmt.executeUpdate();
                    %>
                    Swal.fire(
                        'Deleted!',
                        'Your message has been deleted.',
                        'success'
                    ).then(() => {
                        window.location.href = "managecontacts.jsp"; // Redirect to contact_messages.jsp after deletion
                    });
                } else {
                    // If user cancels, go back to previous page
                    window.history.back();
                }
            });
        </script>
<%
    } catch (SQLException se) {
        se.printStackTrace();
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close resources
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }
%>
</body>
</html>
