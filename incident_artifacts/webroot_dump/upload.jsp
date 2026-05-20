<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.io.*, java.nio.file.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>File Upload</title>
</head>
<body>
    <h2>Course Material Upload</h2>
    <form method="post" action="upload.jsp" enctype="multipart/form-data">
        <input type="file" name="file" /><br/>
        <input type="submit" value="Upload" />
    </form>
    <%
        if (request.getContentType() != null && request.getContentType().startsWith("multipart/")) {
            Part p = request.getPart("file");
            if (p != null) {
                String name = p.getSubmittedFileName();
                String path = application.getRealPath("/uploads/" + name);
                File dir = new File(application.getRealPath("/uploads"));
                dir.mkdirs();
                try (InputStream is = p.getInputStream();
                     OutputStream os = new FileOutputStream(path)) {
                    byte[] buf = new byte[4096];
                    int n;
                    while ((n = is.read(buf)) != -1) os.write(buf, 0, n);
                }
                out.println("<p>Uploaded: " + name + "</p>");
            }
        }
    %>
</body>
</html>
