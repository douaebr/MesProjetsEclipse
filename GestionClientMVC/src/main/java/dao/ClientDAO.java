package dao;

import java.sql.*;
import java.util.*;
import model.Client;

public class ClientDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/gestion_clients";
    private String jdbcUser = "root";
    private String jdbcPassword = "";

    private Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(jdbcURL, jdbcUser, jdbcPassword);
    }

    public List<Client> listerClients(String recherche) {
        List<Client> liste = new ArrayList<>();
        String sql = "SELECT * FROM Client";
        if(recherche != null && !recherche.trim().isEmpty()) {
            sql += " WHERE nom LIKE ?";
        }
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            if(recherche != null && !recherche.trim().isEmpty()){
                ps.setString(1, recherche + "%"); // Filtrage par début du nom
            }
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                liste.add(new Client(rs.getInt("id"), rs.getString("nom"), rs.getString("prenom"), rs.getInt("age")));
            }
        } catch(Exception e){
            e.printStackTrace();
        }
        return liste;
    }

    public void ajouterClient(Client c) {
        String sql = "INSERT INTO Client(nom, prenom, age) VALUES (?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, c.getNom());
            ps.setString(2, c.getPrenom());
            ps.setInt(3, c.getAge());
            ps.executeUpdate();
        } catch(Exception e){
            e.printStackTrace();
        }
    }

    public void modifierClient(Client c) {
        String sql = "UPDATE Client SET nom=?, prenom=?, age=? WHERE id=?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, c.getNom());
            ps.setString(2, c.getPrenom());
            ps.setInt(3, c.getAge());
            ps.setInt(4, c.getId());
            ps.executeUpdate();
        } catch(Exception e){
            e.printStackTrace();
        }
    }

    public void supprimerClient(int id) {
        String sql = "DELETE FROM Client WHERE id=?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch(Exception e){
            e.printStackTrace();
        }
    }

    public Client trouverClient(int id) {
        Client c = null;
        String sql = "SELECT * FROM Client WHERE id=?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                c = new Client(rs.getInt("id"), rs.getString("nom"), rs.getString("prenom"), rs.getInt("age"));
            }
        } catch(Exception e){
            e.printStackTrace();
        }
        return c;
    }
}
