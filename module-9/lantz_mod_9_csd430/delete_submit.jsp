<%-- 
  Kypton Lantz
  September 19, 2025
  Module 9 Assignment: Project - Part 4
--%>

<%@ page import="java.sql.*, java.util.*, src.csd430.MovieBean" %>

<!DOCTYPE html>
<html>
  <head>
    <title>Movie Deleted</title>
  </head>

  <body>
    <h1>Delete Movie - Confirmation</h1>

    <%
      String deleteId = request.getParameter("deleteId");

      Connection conn = null;
      PreparedStatement ps = null;
      ResultSet rs = null;
      List<MovieBean> movies = new ArrayList<>();

      try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/CSD430", "student1", "pass");

        if(deleteId != null && !deleteId.isEmpty()) {
          ps = conn.prepareStatement("DELETE FROM kypton_movies_data WHERE movie_id = ?");
          ps.setInt(1, Integer.parseInt(deleteId));
          int rows = ps.executeUpdate();
          ps.close();

          if(rows > 0) {
            out.println("<p style='color:green;'>Movie with ID " + deleteId + " has been successfully deleted.</p>");
          } else {
            out.println("<p style='color:red;'>No movie found with ID " + deleteId + ".</p>");
          }
        }

        // Fetch updated movie list
        ps = conn.prepareStatement("SELECT * FROM kypton_movies_data ORDER BY movie_id");
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
      } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
      } finally {
        if(rs != null) try { rs.close(); } catch (SQLException e) {}
        if(ps != null) try { ps.close(); } catch (SQLException e) {}
        if(conn != null) try { conn.close(); } catch (SQLException e) {}
      }
    %>

    <!-- Updated table -->
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
          if(movies.isEmpty()) {
            out.println("<tr><td colspan='6'>No movies found.</td></tr>");
          } else {
            for(MovieBean m : movies) {
              out.println("<tr>");
              out.println("<td>" + m.getMovie_id() + "</td>");
              out.println("<td>" + m.getTitle() + "</td>");
              out.println("<td>" + m.getRelease_year() + "</td>");
              out.println("<td>" + m.getDirector() + "</td>");
              out.println("<td>" + m.getRuntime_minutes() + "</td>");
              out.println("<td>" + m.getRating() + "</td>");
              out.println("</tr>");
            }
          }
        %>
      </tbody>
     </table>

     <!-- Dropdown for further deletes -->
    <form method="post" action="delete_submit.jsp">
      <label for="deleteId">Select Movie ID to Delete:</label>
      <select name="deleteId" id="deleteId" required>
        <%
          for(MovieBean m : movies) {
            out.println("<option value='" + m.getMovie_id() + "'>" + m.getMovie_id() + " - " + m.getTitle() + "</option>");
          }
        %>
      </select>
      <input type="submit" value="Delete Another Movie" />
    </form>
  </body>
</html>