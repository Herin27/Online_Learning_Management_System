<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.0/css/all.min.css" integrity="sha512-9xKTRVabjVeZmc+GUW8GgSmcREDunMM+Dt/GrzchfN8tkwHizc5RP4Ok/MXFFy5rIjJjzhndFScTceq5e6GvVQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        
    <style>
        /* General Body Styling */
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
            color: #333;
        }

        .contact-container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .contact-container h1 {
            text-align: center;
            font-size: 2.5rem;
            color: #444;
            margin-bottom: 20px;
        }

        .contact-form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .contact-form label {
            font-size: 1rem;
            color: #555;
        }

        .contact-form input,
        .contact-form textarea {
            width: 92%;
            padding: 12px;
            font-size: 1rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            outline: none;
            transition: border-color 0.3s ease;
        }

        .contact-form input:focus,
        .contact-form textarea:focus {
            border-color: #007bff;
        }

        .contact-form button {
            padding: 12px;
            font-size: 1.2rem;
            font-weight: bold;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .contact-form button:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .contact-container {
                margin: 20px;
                padding: 15px;
            }

            .contact-container h1 {
                font-size: 2rem;
            }

            .contact-form button {
                font-size: 1rem;
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
    <div class="contact-container">
        <h1>Contact Us</h1>
        <form class="contact-form" action="contactus.jsp" method="POST">
            <label for="name">Name</label>
            <input type="text" id="name" name="name" placeholder="Enter your name" required>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>

            <label for="subject">Subject</label>
            <input type="text" id="subject" name="subject" placeholder="Enter subject" required>

            <label for="message">Message</label>
            <textarea id="message" name="message" placeholder="Write your message here" rows="5" required></textarea>

            <button type="submit">Send Message</button>
        </form>
    </div>
</body>
</html>
