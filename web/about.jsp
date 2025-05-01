<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.0/css/all.min.css" integrity="sha512-9xKTRVabjVeZmc+GUW8GgSmcREDunMM+Dt/GrzchfN8tkwHizc5RP4Ok/MXFFy5rIjJjzhndFScTceq5e6GvVQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        
    <style>
        /* General Styling */
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            color: #333;
        }

        .about-container {
            max-width: 1200px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .about-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .about-header h1 {
            font-size: 2.5rem;
            color: #444;
        }

        .about-header p {
            font-size: 1.2rem;
            color: #666;
            margin-top: 10px;
        }

        .about-content {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            align-items: center;
        }

        .about-content img {
            flex: 1;
            max-width: 100%;
            height: auto;
            border-radius: 10px;
        }

        .about-text {
            flex: 2;
        }

        .about-text h2 {
            font-size: 2rem;
            margin-bottom: 10px;
            color: #007bff;
        }

        .about-text p {
            font-size: 1rem;
            color: #555;
            line-height: 1.6;
        }

        .about-footer {
            text-align: center;
            margin-top: 30px;
        }

        .about-footer h3 {
            font-size: 1.8rem;
            color: #444;
        }

        .about-footer p {
            font-size: 1rem;
            color: #666;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .about-content {
                flex-direction: column;
                text-align: center;
            }

            .about-text h2 {
                font-size: 1.5rem;
            }

            .about-text p {
                font-size: 0.9rem;
            }
        }
    </style>
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
                        <li><a href="#" class="nav-link px-2 text-white">Courses</a></li>
                        <li><a href="#" class="nav-link px-2 text-white">Quiz</a></li>
                        <li><a href="#" class="nav-link px-2 text-white">Assignments</a></li>
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

    <div class="about-container">
        <div class="about-header">
            <h1>About Us</h1>
            <p>Learn more about our mission, vision, and the people behind our success.</p>
        </div>
        <div class="about-content">
            <img src="static/images/Logo_1.jpg" alt="About Us Image">
            <div class="about-text">
                <h2>Who We Are</h2>
                <p>
                    Welcome to our platform! We are dedicated to providing top-notch services and
                    creating meaningful connections with our audience. Our mission is to empower individuals
                    and businesses through innovative solutions and unparalleled support.
                </p>
                <p>
                    Our team consists of passionate professionals who are committed to excellence.
                    Together, we work to achieve milestones and make a difference in the industry.
                </p>
            </div>
        </div>
        <div class="about-footer">
            <h3>Our Vision</h3>
            <p>To inspire and innovate, fostering a brighter future for everyone we serve.</p>
        </div>
    </div>
</body>
</html>
