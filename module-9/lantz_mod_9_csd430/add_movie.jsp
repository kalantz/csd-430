<%--
  Kypton Lantz
  September 9, 2025
  Module 7 Assignment: Project - Part 2
--%>

<%@ page import="csd430.MovieBean" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Add New Movie</title>
  </head>

  <body>
    <h2>Add a New Movie</h2>

    <form method="post" action="add_movie.jsp">
      Title: <input type="text" name="title" required><br><br>
      Release Year: <input type="number" name="release_year" required><br><br>
      Director: <input type="text" name="director" required><br><br>
      Runtime (minutes): <input type="number" name="runtime" required><br><br>
      Rating: <input type="text" name="rating" required><br><br>
      <input type="submit" value="Add Movie">
    </form>

    <%
      String title = request.getParameter("title");
      String yearStr = request.getParameter("release_year");
      String director = request.getParameter("director");
      String runtimeStr = request.getParameter("runtime");
      String rating = request.getParameter("rating");

      if(title != null && yearStr != null && director != null && runtimeStr != null && rating != null) {
          int releaseYear = Integer.parseInt(yearStr);
          int runtime = Integer.parseInt(runtimeStr);

          MovieBean movie = new MovieBean();
          movie.setTitle(title);
          movie.setRelease_year(releaseYear);
          movie.setDirector(director);
          movie.setRuntime_minutes(runtime);
          movie.setRating(rating);

          Connection conn = null;
          PreparedStatement ps = null;
          try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/CSD430", "student1", "pass");

            ps = conn.prepareStatement("INSERT INTO kypton_movies_data (title, release_year, director, runtime_minutes, rating) VALUES (?, ?, ?, ?, ?)");
            ps.setString(1, movie.getTitle());
            ps.setInt(2, movie.getRelease_year());
            ps.setString(3, movie.getDirector());
            ps.setInt(4, movie.getRuntime_minutes());
            ps.setString(5, movie.getRating());

            ps.executeUpdate();
  %>
  <p style="color: green;">Movie added successfully!</p>
  <%
          } catch(Exception e) {
              out.println("<p style='color: red;'>Error adding movie: " + e.getMessage() + "</p>");
          } finally {
              if(ps != null) try { ps.close(); } catch(SQLException e) {}
              if(conn != null) try { conn.close(); } catch(SQLException e) {}
          }
      }
    %>
    <hr>
    <h2>All Movies in Database</h2>
    <table border="1">
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
      Connection conn2 = null;
      Statement stmt = null;
      ResultSet rs = null;
      
      try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/CSD430", "student1", "pass");
        stmt = conn2.createStatement();
        rs = stmt.executeQuery("SELECT * FROM kypton_movies_data");

        while(rs.next()) {
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
      } catch(Exception e) {
          out.println("<tr><td colspan='6' style='color: red;'>Error retrieving movies: " + e.getMessage() + "</td></tr>");
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