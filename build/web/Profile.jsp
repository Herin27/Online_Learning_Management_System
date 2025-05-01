<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Retrieve user information from session
    String username = (String) session.getAttribute("firstName");
    String email = (String) session.getAttribute("email");
    String phone = (String) session.getAttribute("lastName");

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.0/css/all.min.css" integrity="sha512-9xKTRVabjVeZmc+GUW8GgSmcREDunMM+Dt/GrzchfN8tkwHizc5RP4Ok/MXFFy5rIjJjzhndFScTceq5e6GvVQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        
    <link rel="stylesheet" href="static/css/profile.css">
</head>
<body>
    <header class="p-3 text-bg-dark">
            <div class="container">
                <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                    <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                        <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href=""/></svg>
                    </a>

                    <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                        <li><a href="home.jsp" class="nav-link px-2 text-secondary">Home</a></li>
                        <li><a href="course.jsp" class="nav-link px-2 text-white">Courses</a></li>
                        <li><a href="quiz.jsp" class="nav-link px-2 text-white">Quiz</a></li>
                        <li><a href="assignments.jsp" class="nav-link px-2 text-white">Assignments</a></li>
                        <li><a href="contactus.jsp" class="nav-link px-2 text-white">Contact Us</a></li>
                        <li><a href="about.jsp" class="nav-link px-2 text-white">About</a></li>
                    </ul>

                    <div class="text-end">
                        <%
                            if (session.getAttribute("email") != null) {
                                String userFirstName = (String) session.getAttribute("firstName");
                                String userLastName = (String) session.getAttribute("lastName");
                        %>
                        <span class="text-white me-2">Welcome, <%= userFirstName%></span>
                        <a href="Profile.jsp" class="btn btn-outline-light me-2"><i class="fa-solid fa-user"></i> Profile</a>
                        <a href="Logout.jsp" class="btn btn-danger">Logout</a>
                        <% } else { %>
                        <a href="Login.jsp" class="btn btn-outline-light me-2">Login</a>
                        <a href="signup.jsp" class="btn btn-warning">Sign-up</a>
                        <% }%>
                    </div>
                </div>
            </div>
        </header>
    <div class="profile-container">
        <h1>Welcome, <%= username %>!</h1>
        <div class="profile-card">
            <!-- Default profile picture -->
            <img class="mb-4 logoimg" src="static/images/Logo_1.jpg" alt="">
            <div class="profile-info">
                <p><strong>Name:</strong> <%= username %> <%= phone %></p>
                <p><strong>Email:</strong> <%= email %></p>
            </div>
            <div class="profile-actions">
                <!-- Links to edit profile and logout -->
                <a href="editProfile.jsp" class="btn-edit">Edit Profile</a>
                <a href="logout.jsp" class="btn-logout">Logout</a>
            </div>
        </div>
    </div>
</body>
</html>
