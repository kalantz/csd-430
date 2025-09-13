<%-- 
  Kypton Lantz
  September 10, 2025
  Module 8 Assignment: Project - Part 3
--%>

<%@ page import="java.sql.*" %>
<%@ page import="csd430.MovieBean" %>
<%
    String movieIDStr = request.getParameter("movie_id");
    MovieBean movie = null;

    if(movieIDStr != null && !movieIDStr.isEmpty()){
        int movieID = Integer.parseInt(movieIDStr);
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/CSD430", "student1", "pass");

            String sql = "SELECT * FROM kypton_movies_data WHERE movie_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, movieID);
            rs = pstmt.executeQuery();

            if(rs.next()) {
                movie = new MovieBean();
                movie.setMovie_id(rs.getInt("movie_id"));
                movie.setTitle(rs.getString("title"));
                movie.setRelease_year(rs.getInt("release_year"));
                movie.setDirector(rs.getString("director"));
                movie.setRuntime_minutes(rs.getInt("runtime_minutes"));
                movie.setRating(rs.getString("rating"));
            }
        } catch(Exception e){
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        } finally {
            if(rs != null) try { rs.close(); } catch(SQLException e) {}
            if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
            if(conn != null) try { conn.close(); } catch(SQLException e) {}
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Update Movie</title>
</head>
<body>
    <h2>Update Movie Record</h2>

    <% if(movie != null) { %>
        <form method="post" action="update_submit.jsp">
            <p>
                <strong>Movie ID (cannot be changed):</strong> <%= movie.getMovie_id() %>
                <input type="hidden" name="movie_id" value="<%= movie.getMovie_id() %>">
            </p>

            <p>Title: <input type="text" name="title" value="<%= movie.getTitle() %>" required></p>
            <p>Release Year: <input type="number" name="release_year" value="<%= movie.getRelease_year() %>" required></p>
            <p>Director: <input type="text" name="director" value="<%= movie.getDirector() %>" required></p>
            <p>Runtime (minutes): <input type="number" name="runtime_minutes" value="<%= movie.getRuntime_minutes() %>" required></p>

            <p>Rating: 
                <select name="rating" required>
                    <option value="G" <%= "G".equals(movie.getRating()) ? "selected" : "" %>>G</option>
                    <option value="PG" <%= "PG".equals(movie.getRating()) ? "selected" : "" %>>PG</option>
                    <option value="PG-13" <%= "PG-13".equals(movie.getRating()) ? "selected" : "" %>>PG-13</option>
                    <option value="R" <%= "R".equals(movie.getRating()) ? "selected" : "" %>>R</option>
                    <option value="NC-17" <%= "NC-17".equals(movie.getRating()) ? "selected" : "" %>>NC-17</option>
                </select>
            </p>

            <p><input type="submit" value="Update Movie"></p>
        </form>
    <% } else { %>
        <p style="color:red;">No movie selected or movie not found.</p>
    <% } %>
</body>
</html>
