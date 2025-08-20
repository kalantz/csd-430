<!--
Kypton Lantz
August 19, 2025
Module 3 Assignment: Working with JSP Forms
-->

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Application Submitted</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
  </head>

  <body>
    <!-- Requirement: Title and description -->
     <h1>Application Received</h1>
     <p>Below is a summary of the information you submitted. Please review carefully.</p>

     <%
        // Requirement: Use Scriplets for holding Java code
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String position = request.getParameter("position");
        String experience = request.getParameter("experience");
        String comments = request.getParameter("comments");
     %>

     <!-- Requirement: Display data in an HTML table -->
      <table>
        <tr>
          <th>Field</th>
          <th>Value Submitted</th>
        </tr>
        <tr>
          <td>Full Name</td>
          <td><%= name %></td>
        </tr>
        <tr>
          <td>Email Address</td>
          <td><%= email %></td>
        </tr>
        <tr>
          <td>Position Applied</td>
          <td><%= position %></td>
        </tr>
        <tr>
          <td>Years of Experience</td>
          <td><%= experience %></td>
        </tr>
        <tr>
          <td>Reason for Applying</td>
          <td><%= comments %></td>
        </tr>
      </table>

    <!-- Requirement: Additional display items like field descriptions -->
     <br>
     <p><strong>Field Descriptions:</strong></p>
     <ul>
       <li><b>Full Name:</b> Your legal first and last name.</li>
       <li><b>Email Address:</b> Contact email where responses will be sent.</li>
       <li><b>Position Applied:</b> The role you are applying for.</li>
       <li><b>Years of Experience:</b> Number of years of professional work.</li>
       <li><b>Reason for Applying:</b> Your explanation for why you want the job.</li>
     </ul>

     <p><a href="JobApplicationForm.jsp">Go Back to Form</a></p>
  </body>
</html>