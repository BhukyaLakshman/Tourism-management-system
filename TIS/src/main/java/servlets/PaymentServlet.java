package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/process_payment")
public class PaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // JDBC driver class for MySQL
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";

    // JDBC connection parameters
    static final String DB_URL = "jdbc:mysql://localhost:3306/tis";
    static final String USER = "root";
    static final String PASS = "root";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            // Register JDBC driver
            Class.forName(JDBC_DRIVER);

            // Retrieve form data
            String userName = request.getParameter("userName");
            String cardNumber = request.getParameter("cardNumber");
            String expirationDateStr = request.getParameter("expirationDate");

            // Parse expiration date into a java.sql.Date object
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            java.util.Date utilDate;
            try {
                utilDate = sdf.parse(expirationDateStr);
            } catch (ParseException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid expiration date format.");
                return;
            }
            Date expirationDate = new Date(utilDate.getTime());

            // Handle parsing of payment amount
            double paymentAmount;
            try {
                paymentAmount = Double.parseDouble(request.getParameter("paymentAmount"));
            } catch (NumberFormatException e) {
                // If paymentAmount is not a valid double
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid payment amount format.");
                return;
            }

            // SQL query to insert payment data into database
            String sql = "INSERT INTO Payments (user_name, card_number, expiration_date, payment_amount) VALUES (?, ?, ?, ?)";

            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            pstmt = conn.prepareStatement(sql);
            
            // Set parameters for the SQL query
            pstmt.setString(1, userName);
            pstmt.setString(2, cardNumber);
            pstmt.setDate(3, expirationDate);
            pstmt.setDouble(4, paymentAmount);

            // Execute the query
            int rowsAffected = pstmt.executeUpdate();

            // Send confirmation alert to the client
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<script>alert('Payment processed successfully!');");
            out.println("if(confirm('Do you want to proceed to user dashboard?')) {");
            out.println("window.location.href = 'userdashboard.jsp';");
            out.println("} else {");
            out.println("window.location.href = 'payment.jsp';");
            out.println("}");
            out.println("</script>");
            out.println("</body></html>");
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing payment: " + ex.getMessage());
        } finally {
            // Close resources in a finally block to ensure they are released
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
