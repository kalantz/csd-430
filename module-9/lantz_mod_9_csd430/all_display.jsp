<%-- 
  Kypton Lantz
  September 4, 2025
  Module 5 Assignment: Working with CRUD (display table)
--%>

<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Horror Movies Table</title>
    <style>
        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #333;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #444;
            color: white;
        }
    </style>
</head>
<body>
    <h1 style="text-align:center;">Horror Movies Database</h1>

<%
    // Database credentials
    String url = "jdbc:mysql://localhost:3306/CSD430";
    String user = "student1";
    String password = "pass";

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL 8+ driver
        conn = DriverManager.getConnection(url, user, password);
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT * FROM kypton_movies_data");

        out.println("<table>");
        out.println("<tr><th>ID</th><th>Title</th><th>Release Year</th><th>Director</th><th>Runtime (min)</th><th>Rating</th></tr>");

        while (rs.next()) {
            out.println("<tr>");
            out.println("<td>" + rs.getInt("movie_id") + "</td>");
            out.println("<td>" + rs.getString("title") + "</td>");
            out.println("<td>" + rs.getInt("release_year") + "</td>");
            out.println("<td>" + rs.getString("director") + "</td>");
            out.println("<td>" + rs.getInt("runtime_minutes") + "</td>");
            out.println("<td>" + rs.getString("rating") + "</td>");
            out.println("</tr>");
        }

        out.println("</table>");

    } catch(Exception e) {
        out.println("<p style='color:red; text-align:center;'>Error: " + e.getMessage() + "</p>");
    } finally {
        if(rs != null) try { rs.close(); } catch(Exception e) {}
        if(stmt != null) try { stmt.close(); } catch(Exception e) {}
        if(conn != null) try { conn.close(); } catch(Exception e) {}
    }
%>

</body>
</html>
