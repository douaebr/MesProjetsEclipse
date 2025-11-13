package controller;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.ClientDAO;
import model.Client;

@WebServlet("/ClientController")
public class ClientController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ClientDAO dao;

    @Override
    public void init() throws ServletException {
        dao = new ClientDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "lister";

        switch (action) {
            case "ajouter":
                request.getRequestDispatcher("ajouterClient.jsp").forward(request, response);
                break;

            case "modifier":
                int id = Integer.parseInt(request.getParameter("id"));
                Client c = dao.trouverClient(id);
                request.setAttribute("client", c);
                request.getRequestDispatcher("modifierClient.jsp").forward(request, response);
                break;

            case "supprimer":
                int supId = Integer.parseInt(request.getParameter("id"));
                dao.supprimerClient(supId);
                response.sendRedirect("ClientController");
                break;

            default: // lister
                String recherche = request.getParameter("recherche");
                List<Client> liste = dao.listerClients(recherche);
                request.setAttribute("listeClients", liste);
                request.getRequestDispatcher("listerClients.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("ajouter".equals(action)) {
            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            int age = Integer.parseInt(request.getParameter("age"));
            dao.ajouterClient(new Client(0, nom, prenom, age));
            response.sendRedirect("ClientController?recherche=" + nom);

        } else if ("modifier".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            int age = Integer.parseInt(request.getParameter("age"));
            dao.modifierClient(new Client(id, nom, prenom, age));
            response.sendRedirect("ClientController");
        }
    }
}
