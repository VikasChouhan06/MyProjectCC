<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    
        
        <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #0d1b2a;
            color: #e0e0e0;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 90%;
            margin: 20px auto;
            background: #1a2a3a;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
        }

        h2 {
            text-align: center;
            color: #00b0ff;
            font-size: 2.5rem;
            margin-bottom: 20px;
        }

        h3 {
            color: #00b0ff;
            font-size: 1.8rem;
            margin-top: 20px;
            margin-bottom: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
            background-color: #1a2a3a;
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 14px;
            text-align: left;
            border: 1px solid #444;
        }

        th {
            background-color: #00b0ff;
            color: #ffffff;
            text-transform: uppercase;
        }

        td {
            color: #e0e0e0;
        }

        tr:nth-child(even) {
            background-color: #2a3a4a;
        }

        tr:hover {
            background-color: #2c3c4c;
        }

        .footer {
            text-align: center;
            padding: 15px;
            background-color: #00b0ff;
            color: white;
            border-radius: 8px;
            margin-top: 30px;
        }

        .footer a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

        .footer a:hover {
            text-decoration: underline;
        }

        /* Responsive Styles */
        @media screen and (max-width: 768px) {
            body {
                font-size: 14px;
            }

            .container {
                padding: 15px;
            }

            h2 {
                font-size: 2rem;
            }

            h3 {
                font-size: 1.5rem;
            }

            table {
                font-size: 14px;
            }

            th, td {
                padding: 8px;
            }

            .footer {
                font-size: 14px;
            }
        }

        @media screen and (max-width: 480px) {
            h2 {
                font-size: 1.5rem;
            }

            h3 {
                font-size: 1.2rem;
            }

            table {
                font-size: 12px;
            }

            th, td {
                padding: 6px;
            }
        }
    </style>
    
</head>
<body>
    <div class="container">
        <h2>Admin Dashboard</h2>

        <!-- Database credentials -->
        <%
            final String DB_URL = "jdbc:mysql://monorail.proxy.rlwy.net:31545/railway?useSSL=false&allowPublicKeyRetrieval=true";
            final String DB_USER = "root";
            final String DB_PASSWORD = "pVoMsGQKPjkIxKHpHgMTXaKSSlXidZEW";
        %>

        <!-- Contact Us Section -->
        <h3>Contact Us Queries</h3>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>Query</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                         Statement stmt = conn.createStatement();
                         ResultSet rs = stmt.executeQuery("SELECT * FROM contact_us")) {

                        while (rs.next()) {
                            out.println("<tr>");
                            out.println("<td>" + rs.getInt("id") + "</td>");
                            out.println("<td>" + rs.getString("first_name") + "</td>");
                            out.println("<td>" + rs.getString("last_name") + "</td>");
                            out.println("<td>" + rs.getString("email") + "</td>");
                            out.println("<td>" + rs.getString("phone_number") + "</td>");
                            out.println("<td>" + rs.getString("query") + "</td>");
                            out.println("</tr>");
                        }
                    } catch (Exception e) {
                        out.println("<tr><td colspan='6'>Error loading data: " + e.getMessage() + "</td></tr>");
                    }
                %>
            </tbody>
        </table>

        <!-- Login Details Section -->
        <h3>Login Details</h3>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Email</th>
                    <th>Login Time</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                         Statement stmt = conn.createStatement();
                         ResultSet rs = stmt.executeQuery("SELECT * FROM Login")) {

                        while (rs.next()) {
                            out.println("<tr>");
                            out.println("<td>" + rs.getInt("id") + "</td>");
                            out.println("<td>" + rs.getString("email") + "</td>");
                            out.println("<td>" + rs.getTimestamp("login_time") + "</td>");
                            out.println("</tr>");
                        }
                    } catch (Exception e) {
                        out.println("<tr><td colspan='3'>Error loading data: " + e.getMessage() + "</td></tr>");
                    }
                %>
            </tbody>
        </table>

        <!-- Product Orders Section -->
        <h3>Product Orders</h3>
        <table>
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Country</th>
                    <th>Street Address</th>
                    <th>City</th>
                    <th>Phone Number</th>
                    <th>Email</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                         Statement stmt = conn.createStatement();
                         ResultSet rs = stmt.executeQuery("SELECT * FROM ProductOrder")) {

                        while (rs.next()) {
                            out.println("<tr>");
                            out.println("<td>" + rs.getInt("order_id") + "</td>");
                            out.println("<td>" + rs.getString("first_name") + "</td>");
                            out.println("<td>" + rs.getString("last_name") + "</td>");
                            out.println("<td>" + rs.getString("country") + "</td>");
                            out.println("<td>" + rs.getString("street_address") + "</td>");
                            out.println("<td>" + rs.getString("city") + "</td>");
                            out.println("<td>" + rs.getString("phone_number") + "</td>");
                            out.println("<td>" + rs.getString("email") + "</td>");
                            out.println("</tr>");
                        }
                    } catch (Exception e) {
                        out.println("<tr><td colspan='8'>Error loading data: " + e.getMessage() + "</td></tr>");
                    }
                %>
            </tbody>
        </table>
    </div>

    <div class="footer">
        &copy; 2024 Admin Dashboard | All Rights Reserved
    </div>
</body>
</html>
