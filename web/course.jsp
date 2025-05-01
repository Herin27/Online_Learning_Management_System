<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Courses</title>
    <link rel="stylesheet" href="static/css/course.css">
</head>
<body>
    <header>
        <h1>Available Courses</h1>
    </header>
    
    <div class="container">
        <% 
            // Database connection
             Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/ems", "root", "tiger");
            String query = "SELECT * FROM courses";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            
            while(rs.next()) {
                String courseName = rs.getString("course_name");
                String courseDescription = rs.getString("course_description");
                String courseInstructor = rs.getString("course_instructor");
                String courseDuration = rs.getString("course_duration");
        %>
        
        <div class="card">
            <!-- No image column, so just display text -->
            <div class="card-body">
                <h3 class="card-title"><%= courseName %></h3>
                <p class="card-text"><%= courseDescription %></p>
                <div class="card-footer">
                    <span class="instructor">Instructor: <%= courseInstructor %></span>
                    <span class="duration">Duration: <%= courseDuration %></span>
                </div>
            </div>
        </div>
        
        <% 
            }
            rs.close();
            stmt.close();
            con.close();
        %>
    </div>
</body>
</html>
