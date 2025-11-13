package servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import beans.Etudiant;

public class TraitementServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Etudiant etu = (Etudiant) request.getAttribute("etu");

        etu.setNom(etu.getNom().toUpperCase());
        etu.setAge(etu.getAge() + 1);

        request.setAttribute("etu", etu);
        RequestDispatcher rd = request.getRequestDispatcher("reponse.jsp");
        rd.forward(request, response);
    }
}
