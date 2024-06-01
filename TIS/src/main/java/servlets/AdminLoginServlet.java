package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Extract form data
        String password = request.getParameter("password");

        // Authenticate admin
        boolean isAuthenticated = authenticateAdmin(password);

        response.setContentType("text/html");
        try (PrintWriter out = response.getWriter()) {
            out.println("<html><head>");
            out.println("<script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@11\"></script>");
            out.println("</head><body>");

            if (isAuthenticated) {
                // Store the password in the session
                

                out.println("<script>");
                out.println("Swal.fire({");
                out.println("  icon: 'success',");
                out.println("  title: 'Login Successful!',");
                out.println("  text: 'Welcome back Administrator.',");
                out.println("  showConfirmButton: false,");
                out.println("  timer: 1590");
                out.println("}).then(() => {");
                out.println("  window.location.href = 'admindash.jsp';");
                out.println("});");
                out.println("</script>");
            } else {
                out.println("<script>");
                out.println("Swal.fire({");
                out.println("  icon: 'error',");
                out.println("  title: 'Login Failed!',");
                out.println("  text: 'Invalid password or invalid userid.',");
                out.println("  showConfirmButton: false,");
                out.println("  timer: 1590");
                out.println("}).then(() => {");
                out.println("  window.location.href = 'admin_login.jsp';");
                out.println("});");
                out.println("</script>");
            }

            out.println("</body></html>");
        }
    }

    private boolean authenticateAdmin(String password) {
        // Database credentials
        String jdbcUrl = "jdbc:mysql://localhost:3306/tis";
        String dbUsername = "root";
        String dbPassword = "root";

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the database
            Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);

            // Prepare the SQL statement
            String sql = "SELECT * FROM admin WHERE password = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, password);

            // Execute the query
            ResultSet resultSet = statement.executeQuery();

            // Check if a row is returned
            if (resultSet.next()) {
                // Admin is authenticated
                statement.close();
                connection.close();
                return true;
            }
            // Admin authentication failed
            statement.close();
            connection.close();
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            // Handle exceptions
            return false;
        }
    }
}
