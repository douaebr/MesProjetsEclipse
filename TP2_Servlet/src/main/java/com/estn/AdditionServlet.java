package com.estn;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Add")
public class AdditionServlet extends HttpServlet {

    private void renderForm(PrintWriter out, String a, String b, String result, String error) {
        out.println("<form action='Add' method='POST'>");
        out.println("Valeur 1 : <input type='text' size='20' name='a' value='" + (a==null?"":a) + "'/> <br/><br>");
        out.println("Valeur 2 : <input type='text' size='20' name='b' value='" + (b==null?"":b) + "'/> <br/><br>");
        out.println("<input type='submit' value='Additionner'/>");
        out.println("</form>");
        
        if (error != null) out.println("<p style='color:red'>" + error + "</p>");
        if (result != null) out.println("<p>Résultat : " + result + "</p>");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = resp.getWriter()) {
            out.println("<h1 style='color:pink'align=center>Additionneur</h1>");
            renderForm(out, null, null, null, null);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String sa = req.getParameter("a");
        String sb = req.getParameter("b");
        String error = null;
        String resStr = null;

        try {
            double a = Double.parseDouble(sa != null ? sa.trim() : "0");
            double b = Double.parseDouble(sb != null ? sb.trim() : "0");
            resStr = String.valueOf(a + b);
        } catch (NumberFormatException e) {
            error = "Veuillez entrer des nombres valides.";
        }

        resp.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = resp.getWriter()) {
            out.println("<h1 style='color:pink'align=center >Additionneur</h1>");
            renderForm(out, sa, sb, resStr, error);
        }
    }
}
