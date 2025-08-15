<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Test JSP Page</title>
</head>
<body>
    <h1>Welcome to My JSP Test Page</h1>

    <% 
        // Java code block
        String userName = "Kypton Lantz";
        int year = 2025;
    %>

    <p>Hello, <%= userName %>!</p>
    <p>The current year is <%= year %>.</p>

    <%
        // Java logic example
        int sum = 0;
        for (int i = 1; i <= 5; i++) {
            sum += i;
        }
    %>
    <p>The sum of numbers 1 to 5 is: <%= sum %></p>
</body>
</html>
