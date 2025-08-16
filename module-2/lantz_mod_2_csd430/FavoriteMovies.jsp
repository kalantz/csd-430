<!--
Kypton Lantz
August 16, 2025
Module 2 Assignment: Java Scriptlet - Data Display
-->

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>JSP Page</title>
    <!-- Requirement: External CSS sheet -->
    <link rel="stylesheet" type="text/css" href="styles.css">
  </head>

  <body>
    <!-- Requirement: Title and overall description -->
    <h1>My Favorite Movies</h1>
    <p>This table displays five movies I enjoyed watching. Each record contains the movie title, year released, and genre. The data is stored in arrays and rendered dynamically using JSP scriptlets.</p>

    <%
    // --- Requirement: Java Code Block (Scriptlet) ---
    // Arrays hold the movie data
    String[] titles = {"Inception", "The Matrix", "Interstellar", "Pulp Fiction", "The Shawshank Redemption"};
    int[] years = {2010, 1999, 2014, 1994, 1994};
    String[] genres = {"Sci-Fi", "Action", "Sci-Fi", "Crime", "Drama"};
    %>

    <!-- Requirement: Display data in an HTML table format -->
    <table>
      <tr>
        <!-- Requirement: Field/column descriptions -->
        <th>Title</th>
        <th>Year</th>
        <th>Genre</th>
      </tr>

      <%
      // Requirement: Loop through and display records dynamically
      for (int i = 0; i < titles.length; i++) {
      %>
      <tr>
        <!-- Requirement: All HTML tags outside of Java Scriptlets-->
        <td><%= titles[i] %></td>
        <td><%= years[i] %></td>
        <td><%= genres[i] %></td>
      </tr>
      <%
      } // End loop
      %>
    </table>

    <!-- Requirement: Additional display items, field descriptions -->
    <br>
    <p><strong>Field Descriptions:</strong></p>
    <ul>
      <li><b>Title</b>: The name of the movie.</li>
      <li><b>Year</b>: The year the movie was released.</li>
      <li><b>Genre</b>: The category or type of the movie.</li>
    </ul>
  </body>
</html>