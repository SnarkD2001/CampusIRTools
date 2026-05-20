<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Campus Portal — Login</title>
</head>
<body>
    <h2>Unified Campus Portal Login</h2>
    <form method="post" action="login.jsp">
        <label>Username: <input type="text" name="username" /></label><br/>
        <label>Password: <input type="password" name="password" /></label><br/>
        <input type="submit" value="Login" />
    </form>
    <%
        String u = request.getParameter("username");
        String p = request.getParameter("password");
        if (u != null && p != null) {
            if ("admin".equals(u) && "campus2026".equals(p)) {
                session.setAttribute("user", u);
                response.sendRedirect("upload.jsp");
            } else {
                out.println("<p style='color:red'>Invalid credentials.</p>");
            }
        }
    %>
</body>
</html>
