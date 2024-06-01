<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User</title>
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
    <h2>Edit User</h2>
    <%
        Connection conn = null;
        PreparedStatement pstmtSelect = null;
        PreparedStatement pstmtUpdate = null;
        ResultSet rs = null;

        try {
            // Get the user ID from request parameter
            int userId = Integer.parseInt(request.getParameter("id"));

            // Establish database connection
            String jdbcUrl = "jdbc:mysql://localhost:3306/tis";
            String dbUsername = "root";
            String dbPassword = "root";
            conn = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);

            // Check if the form has been submitted
            if (request.getMethod().equalsIgnoreCase("post")) {
                // Get updated user data from form parameters
                String updatedUsername = request.getParameter("username");
                String updatedEmail = request.getParameter("email");
                String updatedPassword = request.getParameter("password");

                // Prepare and execute UPDATE query to update the user data
                String updateQuery = "UPDATE users SET username=?, email=?, password=? WHERE id=?";
                pstmtUpdate = conn.prepareStatement(updateQuery);
                pstmtUpdate.setString(1, updatedUsername);
                pstmtUpdate.setString(2, updatedEmail);
                pstmtUpdate.setString(3, updatedPassword);
                pstmtUpdate.setInt(4, userId);

                int rowsAffected = pstmtUpdate.executeUpdate();
                if (rowsAffected > 0) {
    %>
                    <!-- SweetAlert JavaScript -->
                    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
                    <script>
                        Swal.fire({
                            title: 'Updated!',
                            text: 'User data has been updated successfully.',
                            icon: 'success',
                            confirmButtonText: 'OK'
                        }).then(() => {
                            window.location.href = 'manageuser.jsp';
                        });
                    </script>
    <%
                }
            } else {
                // Retrieve user information based on user ID
                String selectQuery = "SELECT * FROM users WHERE id=?";
                pstmtSelect = conn.prepareStatement(selectQuery);
                pstmtSelect.setInt(1, userId);
                rs = pstmtSelect.executeQuery();

                // If user found, fill the form with existing data
                if (rs.next()) {
                    String username = rs.getString("username");
                    String email = rs.getString("email");
                    String password = rs.getString("password");
    %>
                    <form action="edit_user.jsp?id=<%= userId %>" method="post">
                        <div class="form-group">
                            <label for="username">Username:</label>
                            <input type="text" class="form-control" id="username" name="username" value="<%= username %>" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" class="form-control" id="email" name="email" value="<%= email %>" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Password:</label>
                            <input type="password" class="form-control" id="password" name="password" value="<%= password %>" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Update</button>
                    </form>
    <%
                } else {
    %>
                    <div class="alert alert-danger" role="alert">
                        User not found!
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
