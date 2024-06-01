<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Data</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<%@ include file="adminheader.jsp" %>

<div class="container mt-5">
    <h2 align="center">Manage Users</h2>
    <table class="table table-hover">
        <thead>
            <tr>
                <th>Username</th>
                <th>Email</th>
                <th>Password</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% 
            Connection connection = null;
            PreparedStatement statement = null;
            ResultSet resultSet = null;

            try {
                // Load the MySQL JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Connect to the database
                String jdbcUrl = "jdbc:mysql://localhost:3306/tis";
                String dbUsername = "root";
                String dbPassword = "root";
                connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);

                // Prepare the SQL statement
                String sql = "SELECT * FROM users ORDER BY id DESC";
                statement = connection.prepareStatement(sql);

                // Execute the query
                resultSet = statement.executeQuery();

                // Process the result set
                while (resultSet.next()) {
                    String username = resultSet.getString("username");
                    String email = resultSet.getString("email");
                    String password = resultSet.getString("password");
            %>
                    <tr>
                        <td><%= username %></td>
                        <td><%= email %></td>
                        <td><%= password %></td>
                        <td>
                            <a href="edit_user.jsp?id=<%= resultSet.getInt("id") %>" class="btn btn-primary">Edit</a>
                            <a href="delete_user.jsp?id=<%= resultSet.getInt("id") %>" class="btn btn-danger">Delete</a>
                        </td>
                    </tr>
            <% 
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                // Close resources
                try {
                    if (resultSet != null) resultSet.close();
                    if (statement != null) statement.close();
                    if (connection != null) connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            %>
        </tbody>
    </table>
</div><br><br><br>
<%@ include file="userfooter.jsp" %>

<!-- Bootstrap JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
