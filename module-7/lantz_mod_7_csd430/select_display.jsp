<%--
  Kypton Lantz
  September 6, 2025
  Module 6 Assignment: Project - Part 1
--%>

<%@ page import="csd430.MovieBean" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>Horror Movies Database</title>
    <style>
        table { border-collapse: collapse; width: 80%; margin: 20px auto; }
        th, td { border: 1px solid #333; padding: 8px; text-align: center; }
        th { background-color: #444; color: white; }
        h1, form { text-align: center; }
    </style>
</head>
<body>
<h1>Horror Movies Database</h1>

<%
    // Declare JDBC variables
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    PreparedStatement ps = null;
    ArrayList<MovieBean> movies = new ArrayList<>();
    String selectedYear = request.getParameter("year");

    try {
        // Database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/CSD430", "student1", "pass");

        // Fetch distinct years for dropdown
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT DISTINCT release_year FROM kypton_movies_data ORDER BY release_year");
%>

<form method="get" action="">
    <label for="year">Select Release Year:</label>
    <select name="year" id="year">
<%
        while(rs.next()) {
            int year = rs.getInt("release_year");
            String selected = (selectedYear != null && selectedYear.equals(String.valueOf(year))) ? "selected" : "";
            out.println("<option value='" + year + "' " + selected + ">" + year + "</option>");
        }
        rs.close();
%>
    </select>
    <input type="submit" value="Show Movies">
</form>

<%
        // If a year is selected, fetch movies for that year
        if(selectedYear != null && !selectedYear.isEmpty()) {
            ps = conn.prepareStatement("SELECT * FROM kypton_movies_data WHERE release_year = ?");
            ps.setInt(1, Integer.parseInt(selectedYear));
            rs = ps.executeQuery();

            while(rs.next()) {
                MovieBean m = new MovieBean();
                m.setMovie_id(rs.getInt("movie_id"));
                m.setTitle(rs.getString("title"));
                m.setRelease_year(rs.getInt("release_year"));
                m.setDirector(rs.getString("director"));
                m.setRuntime_minutes(rs.getInt("runtime_minutes"));
                m.setRating(rs.getString("rating"));
                movies.add(m);
            }
            rs.close();
            ps.close();
        }

        // Display movies if available
        if(!movies.isEmpty()) {
%>
<h2>Movies for <%= selectedYear %></h2>
<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Release Year</th>
            <th>Director</th>
            <th>Runtime (min)</th>
            <th>Rating</th>
        </tr>
    </thead>
    <tbody>
<%
            for(MovieBean m : movies) {
%>
        <tr>
            <td><%= m.getMovie_id() %></td>
            <td><%= m.getTitle() %></td>
            <td><%= m.getRelease_year() %></td>
            <td><%= m.getDirector() %></td>
            <td><%= m.getRuntime_minutes() %></td>
            <td><%= m.getRating() %></td>
        </tr>
<%
            }
%>
    </tbody>
</table>
<%
        }

    } catch(Exception e) {
        out.println("<p style='color:red; text-align:center;'>Error: " + e.getMessage() + "</p>");
    } finally {
        // Close all JDBC resources
        try { if(rs != null) rs.close(); } catch(Exception e) {}
        try { if(stmt != null) stmt.close(); } catch(Exception e) {}
        try { if(ps != null) ps.close(); } catch(Exception e) {}
        try { if(conn != null) conn.close(); } catch(Exception e) {}
    }
%>

</body>
</html>