import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ContactUsServlet")
public class ContactUsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Correct JDBC URL format
    private static final String DB_URL = "jdbc:mysql://monorail.proxy.rlwy.net:31545/railway";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "pVoMsGQKPjkIxKHpHgMTXaKSSlXidZEW";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Set response type
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Retrieve form data
        String firstName = request.getParameter("FirstName");
        String lastName = request.getParameter("LastName");
        String email = request.getParameter("Email");
        String phoneNumber = request.getParameter("PhoneNumber");
        String query = request.getParameter("Query");

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // Load the MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish database connection
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Insert query
            String sql = "INSERT INTO contact_us (first_name, last_name, email, phone_number, query) VALUES (?, ?, ?, ?, ?)";

            // Create a prepared statement
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, firstName);
            preparedStatement.setString(2, lastName);
            preparedStatement.setString(3, email);
            preparedStatement.setString(4, phoneNumber);
            preparedStatement.setString(5, query);

            // Execute the query
            int rowsInserted = preparedStatement.executeUpdate();

            if (rowsInserted > 0) {
                out.println("<h3>Thank you for contacting us! Your query has been submitted successfully.</h3>");
            } else {
                out.println("<h3>Failed to submit your query. Please try again later.</h3>");
            }
        } catch (ClassNotFoundException e) {
            out.println("<h3>MySQL JDBC Driver not found: " + e.getMessage() + "</h3>");
            e.printStackTrace();
        } catch (SQLException e) {
            out.println("<h3>Database error: " + e.getMessage() + "</h3>");
            e.printStackTrace();
        } finally {
            try {
                // Close resources
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
