import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@MultipartConfig
public class AdminServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String courseName = request.getParameter("course_name");
        String courseDescription = request.getParameter("course_description");
        String courseDuration = request.getParameter("course_duration");
        String courseInstructor = request.getParameter("course_instructor");
        String courseDate = request.getParameter("course_date");
        Part imagePart = request.getPart("course_image");

        String imageName = imagePart.getSubmittedFileName();
        String uploadPath = getServletContext().getRealPath("uploads") + File.separator + imageName;

        try {
            // Save the image to the uploads directory
            File uploadDir = new File(getServletContext().getRealPath("uploads"));
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }
            imagePart.write(uploadPath);

            // Save the course details in the database
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/ems", "root", "tiger");
            String sql = "INSERT INTO courses (course_name, course_description, course_duration, course_instructor, course_date, course_image) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, courseName);
            ps.setString(2, courseDescription);
            ps.setString(3, courseDuration);
            ps.setString(4, courseInstructor);
            ps.setDate(5, java.sql.Date.valueOf(courseDate));
            ps.setString(6, "uploads/" + imageName);

            ps.executeUpdate();
            ps.close();
            conn.close();

            response.sendRedirect("courses.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<p>Error adding course: " + e.getMessage() + "</p>");
        }
    }
}
