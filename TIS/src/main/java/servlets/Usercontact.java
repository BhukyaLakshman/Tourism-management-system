package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/usercontact")
public class Usercontact extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database credentials
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost/tis";
    static final String USER = "root";
    static final String PASS = "root";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Set the content type of the response
        response.setContentType("text/html");
        
        // Retrieve form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        Connection conn = null;
        PreparedStatement stmt = null;
        boolean success = false;

        PrintWriter out = response.getWriter();

        try {
            // Register JDBC driver
            Class.forName(JDBC_DRIVER);

            // Open a connection
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            // Prepare statement
            String sql = "INSERT INTO contactmessages (name, email, subject, message) VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, subject);
            stmt.setString(4, message);

            // Execute the statement
            int rowsInserted = stmt.executeUpdate();
            success = rowsInserted > 0; // Check if any row is inserted

            // Clean-up environment
            stmt.close();
            conn.close();
        } catch (SQLException se) {
            // Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            // Handle errors for Class.forName
            e.printStackTrace();
        } finally {
            // Finally block used to close resources
            try {
                if (stmt != null)
                    stmt.close();
            } catch (SQLException se2) {
            } // nothing we can do
            try {
                if (conn != null)
                    conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            } // end finally try
        } // end try

        // Display SweetAlert based on success or failure
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Contact Response</title>");
        out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
        out.println("</head>");
        out.println("<body>");
        out.println("<script>");
        if (success) {
            out.println("Swal.fire({");
            out.println("    title: 'Success',");
            out.println("    text: 'Data stored successfully!',");
            out.println("    icon: 'success',");
            out.println("    confirmButtonText: 'OK'");
            out.println("}).then(function() {");
            out.println("    window.location.href = 'userdashboard.jsp';");
            out.println("});");
        } else {
            out.println("Swal.fire({");
            out.println("    title: 'Failed',");
            out.println("    text: 'Failed to store data!',");
            out.println("    icon: 'error',");
            out.println("    confirmButtonText: 'OK'");
            out.println("}).then(function() {");
            out.println("    window.location.href = 'userdashboard.jsp';");
            out.println("});");
        }
        out.println("</script>");
        out.println("</body>");
        out.println("</html>");
    }
}
