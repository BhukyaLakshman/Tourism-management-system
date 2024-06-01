package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/signin")
public class SignUpServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Extract form data
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        response.setContentType("text/html");
        try (PrintWriter out = response.getWriter()) {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the database
            String jdbcUrl = "jdbc:mysql://localhost:3306/tis";
            String dbUsername = "root";
            String dbPassword = "root";
            try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword)) {
                // Prepare the SQL statement
                String sql = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
                try (PreparedStatement statement = connection.prepareStatement(sql)) {
                    statement.setString(1, username);
                    statement.setString(2, email);
                    statement.setString(3, password);

                    // Execute the statement
                    statement.executeUpdate();
                }
            }

            // Embed SweetAlert script in the servlet's response
            out.println("<html><head>");
            out.println("<script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@11\"></script>");
            out.println("</head><body>");
            out.println("<script>");
            out.println("Swal.fire({");
            out.println("  icon: 'success',");
            out.println("  title: 'Successfully created an account!',");
            out.println("  text: 'Welcome to Travller .',");
            out.println("  showConfirmButton: false,");
            out.println("  timer: 2000");
            out.println("}).then(() => {");
            out.println("  window.location.href = 'index.jsp';");
            out.println("});");
            out.println("</script>");
            out.println("</body></html>");
        } catch (Exception e) {
            e.printStackTrace();
            // Set content type and get PrintWriter object
            response.setContentType("text/html");
            try (PrintWriter out = response.getWriter()) {
                // Embed SweetAlert script in the servlet's response
                out.println("<html><head>");
                out.println("<script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@11\"></script>");
                out.println("</head><body>");
                out.println("<script>");
                out.println("Swal.fire({");
                out.println("  icon: 'error',");
                out.println("  title: 'Error occurred!',");
                out.println("  showConfirmButton: false,");
                out.println("  timer: 2000");
                out.println("}).then(() => {");
                out.println("  window.location.href = 'index.jsp';");
                out.println("});");
                out.println("</script>");
                out.println("</body></html>");
            }
        }
    }
}
