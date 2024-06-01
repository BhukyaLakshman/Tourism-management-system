<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Messages</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="adminheader.jsp" %>
    <div class="container mt-5">
        <h2 align="center">Contact Messages</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Subject</th>
                    <th>Message</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        // Database credentials
                        String JDBC_DRIVER = "com.mysql.jdbc.Driver";
                        String DB_URL = "jdbc:mysql://localhost/tis";
                        String USER = "root";
                        String PASS = "root";

                        // Register JDBC driver
                        Class.forName(JDBC_DRIVER);

                        // Open a connection
                        conn = DriverManager.getConnection(DB_URL, USER, PASS);

                        // Execute SQL query
                        String sql = "SELECT * FROM contactmessages ORDER BY id DESC";
                        stmt = conn.createStatement();
                        rs = stmt.executeQuery(sql);

                        // Iterate through result set
                        while (rs.next()) {
                            String name = rs.getString("name");
                            String email = rs.getString("email");
                            String subject = rs.getString("subject");
                            String message = rs.getString("message");
                %>
                            <tr>
                                <td><%= name %></td>
                                <td><%= email %></td>
                                <td><%= subject %></td>
                                <td><%= message %></td>
                                <td>
                                   
                                    <a href="deletecontact.jsp?id=<%= rs.getInt("id") %>" class="btn btn-danger btn-sm">Delete</a>
                                </td>
                            </tr>
                <%
                        }
                    } catch (SQLException se) {
                        se.printStackTrace();
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        // Close resources
                        try {
                            if (stmt != null) stmt.close();
                            if (conn != null) conn.close();
                        } catch (SQLException se) {
                            se.printStackTrace();
                        }
                    }
                %>
            </tbody>
        </table>
    </div><br><br><br>
    <%@ include file="userfooter.jsp" %>
</body>
</html>
