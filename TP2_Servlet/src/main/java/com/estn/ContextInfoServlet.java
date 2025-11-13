package com.estn;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/ContextInfo")
public class ContextInfoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

      
        String Webmaster = getServletContext().getInitParameter("Webmaster");
        String email = getServletContext().getInitParameter("email");

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println("<html>");
        out.println("<head>");
        out.println("<title>Paramètres du contexte</title></head><body>");
        out.println("<h1>Paramètres du contexte</h1>");
        out.println("<p>Webmaster : " + Webmaster + "</p>");
        out.println("<p>Email : " + email + "</p>");
        out.println("</body>");
        out.println("</html>");
    }
}
