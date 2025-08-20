<!--
Kypton Lantz
August 19, 2025
Module 3 Assignment: Working with JSP Forms
-->

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Job Application Form</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
  <!-- Requirement: Title and description -->
    <h1>Job Application</h1>
    <p>Please fill out the following form with your details. All fields are required.</p>

    <!-- Requirement: Form with at least 3 types of inputs and 5 data points -->
    <form action="JobApplicationResults.jsp" method="post">
      <!-- Text input -->
       <label for="name">Full Name:</label><br>
       <input type="text" id="name" name="name" required><br><br>

      <!-- Email input -->
       <label for="email">Email:</label><br>
       <input type="email" id="email" name="email" required><br><br>

      <!-- Radio button input -->
       <label>Position Applied For:</label><br>
       <input type="radio" name="position" value="Ring Leader" required> Ring Leader<br>
       <input type="radio" name="position" value="Clown"> Clown<br>
       <input type="radio" name="position" value="Animal Trainer"> Animal Trainer<br><br>
       
      <!-- Dropdown select -->
       <label for="experience">Years of Experience:</label><br>
       <select id="experience" name="experience" required>
           <option value="">Select...</option>
           <option value="0-1">0-1 years</option>
           <option value="1-3">1-3 years</option>
           <option value="3-5">3-5 years</option>
           <option value="5+">5+ years</option>
       </select><br><br>

       <!-- Textarea for additional information -->
        <label for="comments">Why do you want to join the circus?</label><br>
        <textarea id="comments" name="comments" rows="4" cols="50" required></textarea><br><br>

      <!-- Submit button -->
       <input type="submit" value="Submit Application">

      <!-- Reset button -->
       <input type="reset" value="Reset Form">
    </form>
</body>
</html>