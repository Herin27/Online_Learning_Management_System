<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Add Course</title>
    <link rel="stylesheet" href="static/css/admin.css">
</head>
<body>
    <h2>Admin Panel - Add Course</h2>

    <form action="admin.jsp" method="POST">
        <div>
            <label for="course_name">Course Name:</label>
            <input type="text" id="course_name" name="course_name" required>
        </div>

        <div>
            <label for="course_description">Course Description:</label>
            <textarea id="course_description" name="course_description" required></textarea>
        </div>

        <div>
            <label for="course_duration">Course Duration:</label>
            <input type="text" id="course_duration" name="course_duration" required>
        </div>

        <div>
            <label for="course_instructor">Course Instructor:</label>
            <input type="text" id="course_instructor" name="course_instructor" required>
        </div>

        <div>
            <label for="course_date">Course Start Date:</label>
            <input type="date" id="course_date" name="course_date" required>
        </div>

        <button type="submit">Add Course</button>
    </form>

    <% 
        if(request.getMethod().equalsIgnoreCase("POST")) {
            String courseName = request.getParameter("course_name");
            String courseDescription = request.getParameter("course_description");
            String courseDuration = request.getParameter("course_duration");
            String courseInstructor = request.getParameter("course_instructor");
            String courseDate = request.getParameter("course_date");

            try {
                // Database connection
                Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/ems", "root", "tiger");

                String query = "INSERT INTO courses (course_name, course_description, course_duration, course_instructor, course_date) VALUES (?, ?, ?, ?, ?)";
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setString(1, courseName);
                ps.setString(2, courseDescription);
                ps.setString(3, courseDuration);
                ps.setString(4, courseInstructor);
                ps.setDate(5, Date.valueOf(courseDate));
                ps.executeUpdate();
                
                ps.close();
                conn.close();

                out.println("<script>alert('Course added successfully!');</script>");
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<script>alert('Error adding course');</script>");
            }
        }
    %>

</body>
</html>
