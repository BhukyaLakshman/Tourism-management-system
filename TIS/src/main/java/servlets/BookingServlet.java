package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/booking")
public class BookingServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String fromDate = request.getParameter("fromdate");
        String toDate = request.getParameter("todate");
        int members = Integer.parseInt(request.getParameter("members"));
        String destination = request.getParameter("destination");

        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/tis";
        String username = "root";
        String password = "root";

        // JDBC variables
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Establish database connection
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);

            // Prepare SQL statement for inserting data into the Booking table
            String query = "INSERT INTO Booking (name, email, fromdate, todate, members, destination) VALUES (?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, fromDate);
            pstmt.setString(4, toDate);
            pstmt.setInt(5, members);
            pstmt.setString(6, destination);

            // Execute the SQL statement
            int rowsAffected = pstmt.executeUpdate();

            // Check if booking was successful
            response.setContentType("text/html"); // Set content type to HTML
            if (rowsAffected > 0) {
                response.getWriter().write(
                    "<html><body>" +
                    "<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>" +
                    "<script>" +
                    "Swal.fire({" +
                    "    title: 'Success'," +
                    "    text: 'Booking successful'," +
                    "    icon: 'success'," +
                    "    confirmButtonText: 'OK'" +
                    "}).then(function() {" +
                    "    window.location.href = 'userdashboard.jsp';" +
                    "});" +
                    "</script>" +
                    "</body></html>"
                );
            } else {
                response.getWriter().write(
                    "<html><body>" +
                    "<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>" +
                    "<script>" +
                    "Swal.fire({" +
                    "    title: 'Failed'," +
                    "    text: 'Booking failed'," +
                    "    icon: 'error'," +
                    "    confirmButtonText: 'OK'" +
                    "}).then(function() {" +
                    "    window.location.href = 'userdashboard.jsp';" +
                    "});" +
                    "</script>" +
                    "</body></html>"
                );
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            // Send failure response in case of an exception
            response.setContentType("text/html"); // Set content type to HTML
            response.getWriter().write(
                "<html><body>" +
                "<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>" +
                "<script>" +
                "Swal.fire({" +
                "    title: 'Error'," +
                "    text: 'An error occurred while processing the request'," +
                "    icon: 'error'," +
                "    confirmButtonText: 'OK'" +
                "}).then(function() {" +
                "    window.location.href = 'userdashboard.jsp';" +
                "});" +
                "</script>" +
                "</body></html>"
            );
        } finally {
            // Close JDBC objects
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
