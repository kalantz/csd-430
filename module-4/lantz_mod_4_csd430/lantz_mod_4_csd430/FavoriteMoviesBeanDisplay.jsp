<%-- 
  Kypton Lantz
  August 27, 2025
  Module 4 Assignment: JavaBean
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="beans.FavoriteMovies,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Favorite Movies (Bean Version)</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<h1>My Favorite Movies</h1>
<p>This table displays my Module 2 favorite movies, now sourced from JavaBeans.</p>

<%
    // === Scriptlet: Java code only (as required) ===
    List<FavoriteMovies> movies = new ArrayList<FavoriteMovies>();

    movies.add(new FavoriteMovies("Inception", 2010, "Sci-Fi"));
    movies.add(new FavoriteMovies("The Matrix", 1999, "Action"));
    movies.add(new FavoriteMovies("Interstellar", 2014, "Sci-Fi"));
    movies.add(new FavoriteMovies("Pulp Fiction", 1994, "Crime"));
    movies.add(new FavoriteMovies("The Shawshank Redemption", 1994, "Drama"));
%>

<table>
    <tr>
        <th>Title</th>
        <th>Release Year</th>
        <th>Genre</th>
    </tr>
<%
    for (FavoriteMovies m : movies) {
%>
    <tr>
        <td><%= m.getTitle() %></td>
        <td><%= m.getReleaseYear() %></td>
        <td><%= m.getGenre() %></td>
    </tr>
<%
    }
%>
</table>

<br>
<p><strong>Field Descriptions:</strong></p>
<ul>
    <li><b>Title</b>: Movie name as marketed.</li>
    <li><b>Release Year</b>: Year of first public release.</li>
    <li><b>Genre</b>: Primary category for the film.</li>
</ul>

</body>
</html>