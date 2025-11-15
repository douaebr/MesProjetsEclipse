package com.estn.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;
import java.time.Period;

import com.estn.model.PrimeModel;

@WebServlet("/calculer")
public class PrimeServletController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id_employe"));

        String url_db = "jdbc:mysql://localhost:3306/tp_mvc"; // base en minuscules
        String user_db = "root";
        String pwd_db = "";

        String nom = "";
        String prenom = "";
        java.sql.Date embauche = null;
        double salaire = 0;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url_db, user_db, pwd_db);
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM employe WHERE id=?");
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                nom = rs.getString("nom");
                prenom = rs.getString("prenom");
                salaire = rs.getDouble("salaire");
                embauche = rs.getDate("date_embauche");
            } else {
                // Si aucun employé trouvé, rediriger vers 404
                request.getRequestDispatcher("404.html").forward(request, response);
                return;
            }

            rs.close();
            ps.close();
            connection.close();

            // Calcul de la prime
            Period p = Period.between(embauche.toLocalDate(), LocalDate.now());
            double prime = salaire + (p.getYears() * 500);

            // Création du modèle
            PrimeModel pm = new PrimeModel();
            pm.setNom(nom);
            pm.setPrenom(prenom);
            pm.setPrime(prime);

            // Envoi vers resultat.jsp
            request.setAttribute("pm", pm);
            request.getRequestDispatcher("resultat.jsp").forward(request, response);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.getRequestDispatcher("404.html").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
