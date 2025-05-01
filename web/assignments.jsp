<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Assignments</title>
    <link rel="stylesheet" href="static/css/assignments.css">
</head>
<body>

<h1>Assignments</h1>

<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    String jdbcURL = "jdbc:derby://localhost:1527/ems";
    String dbUsername = "root";
    String dbPassword = "tiger";

    try {
        conn = DriverManager.getConnection(jdbcURL, dbUsername, dbPassword);
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT * FROM assignments");

        while (rs.next()) {
            String title = rs.getString("title");
            String description = rs.getString("description");
            String dueDate = rs.getString("due_date");
%>
            <div>
                <h3><%= title %></h3>
                <p><%= description %></p>
                <p>Due Date: <%= dueDate %></p>
            </div>
<%
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        try { if (rs != null) rs.close(); } catch (SQLException e) {}
        try { if (stmt != null) stmt.close(); } catch (SQLException e) {}
        try { if (conn != null) conn.close(); } catch (SQLException e) {}
    }
%>

</body>
</html>
