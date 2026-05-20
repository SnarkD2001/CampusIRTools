package com.univ.admin;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class HealthCheckServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("text/plain");
        PrintWriter w = resp.getWriter();
        w.println("Status: OK");
        w.println("Uptime: " + System.currentTimeMillis());
        w.println("Heap: " + Runtime.getRuntime().totalMemory());
    }
}
