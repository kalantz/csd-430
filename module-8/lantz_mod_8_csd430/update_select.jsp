<%-- 
  Kypton Lantz
  September 10, 2025
  Module 8 Assignment: Project - Part 3
--%>

<%@ page import="java.sql.*" %>
<%@ page import="csd430.MovieBean" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Select Movie to Update</title>
  </head>

  <body>
    <h2>Select Movie to Update</h2>

    <form method="get" action="update_form.jsp">
      Select Movie:
      <select name="movie_id" required>
        <%
          Connection conn = null;
          Statement stmt = null;
          ResultSet rs = null;

          try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/CSD430", "student1", "pass");
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT movie_id, title FROM kypton_movies_data ORDER BY title");
  
            while(rs.next()){
              int id = rs.getInt("movie_id");
              String title = rs.getString("title");
        %>
              <option value="<%= id %>"><%= title %></option>
        <%
            }
          } catch(Exception e){
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
          } finally {
            if(rs != null) try { rs.close(); } catch(SQLException e) {}
            if(stmt != null) try { stmt.close(); } catch(SQLException e) {}
            if(conn != null) try { conn.close(); } catch(SQLException e) {}
          }
        %>
      </select>
      <input type="submit" value="Select Movie">
    </form>
  </body>
</html>