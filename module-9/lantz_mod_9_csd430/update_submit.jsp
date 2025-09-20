<%-- 
  Kypton Lantz
  September 10, 2025
  Module 8 Assignment: Project - Part 3
--%>

<%@ page import="java.sql.*" %>
<%@ page import="csd430.MovieBean" %>
<%
  String movieIdStr = request.getParameter("movie_id");
  String title = request.getParameter("title");
  String releaseYearStr = request.getParameter("release_year");
  String director = request.getParameter("director");
  String runtimeMinutesStr = request.getParameter("runtime_minutes");
  String rating = request.getParameter("rating");

  MovieBean movie = null;

  if(movieIdStr != null && title != null && releaseYearStr != null && director != null && runtimeMinutesStr != null && rating != null){
    int movieId = Integer.parseInt(movieIdStr);
    int releaseYear = Integer.parseInt(releaseYearStr);
    int runtimeMinutes = Integer.parseInt(runtimeMinutesStr);

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/CSD430", "student1", "pass");

      pstmt = conn.prepareStatement("UPDATE kypton_movies_data SET title=?, release_year=?, director=?, runtime_minutes=?, rating=? WHERE movie_id=?");
      pstmt.setString(1, title);
      pstmt.setInt(2, releaseYear);
      pstmt.setString(3, director);
      pstmt.setInt(4, runtimeMinutes);
      pstmt.setString(5, rating);
      pstmt.setInt(6, movieId);

      int rows = pstmt.executeUpdate();
      if(rows > 0){
        movie = new MovieBean();
        movie.setMovie_id(movieId);
        movie.setTitle(title);
        movie.setRelease_year(releaseYear);
        movie.setDirector(director);
        movie.setRuntime_minutes(runtimeMinutes);
        movie.setRating(rating);
      }
    } catch(Exception e){
      out.println("<p style='color:red;'> " + e.getMessage() + "</p>");
    } finally {
      if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
      if(conn != null) try { conn.close(); } catch(SQLException e) {}
    }
  }
%>

<!DOCTYPE html>
<html>
  <head>
    <title>Updated Movie Records</title>
  </head>

  <body>
    <h2>Updated Movie Record</h2>

    <% if(movie != null) { %>
      <p style="color:green;">Movie record updated successfully.</p>
      <table border="1">
        <thead>
          <tr>
            <th>Movie ID</th>
            <th>Title</th>
            <th>Release Year</th>
            <th>Director</th>
            <th>Runtime (minutes)</th>
            <th>Rating</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><%= movie.getMovie_id() %></td>
            <td><%= movie.getTitle() %></td>
            <td><%= movie.getRelease_year() %></td>
            <td><%= movie.getDirector() %></td>
            <td><%= movie.getRuntime_minutes() %></td>
            <td><%= movie.getRating() %></td>
          </tr>
        </tbody>
      </table>
    <% } %>

    <hr>
    <h2>All Movies in Database</h2>
    <table border="1">
      <thead>
        <tr>
          <th>Movie ID</th>
          <th>Title</th>
          <th>Release Year</th>
          <th>Director</th>
          <th>Runtime (minutes)</th>
          <th>Rating</th>
        </tr>
      </thead>
      <tbody>
      <%
        Connection conn2 = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
          Class.forName("com.mysql.cj.jdbc.Driver");
          conn2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/CSD430", "student1", "pass");
          stmt = conn2.createStatement();
          rs = stmt.executeQuery("SELECT * FROM kypton_movies_data");

          while(rs.next()){
            MovieBean m = new MovieBean();
            m.setMovie_id(rs.getInt("movie_id"));
            m.setTitle(rs.getString("title"));
            m.setRelease_year(rs.getInt("release_year"));
            m.setDirector(rs.getString("director"));
            m.setRuntime_minutes(rs.getInt("runtime_minutes"));
            m.setRating(rs.getString("rating"));
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
        } catch(Exception e){
          out.println("<tr><td colspan='6' style='color:red;'>Error retrieving movies: " + e.getMessage() + "</td></tr>");
        } finally {
          if(rs != null) try { rs.close(); } catch(SQLException e) {}
          if(stmt != null) try { stmt.close(); } catch(SQLException e) {}
          if(conn2 != null) try { conn2.close(); } catch(SQLException e) {}
        }
      %>
      </tbody>
    </table>
  </body>
</html>
