<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>
<html>
<head>
    <title>Ajouter Client</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">

<h2>Ajouter un client</h2>

<form method="post" class="mb-3">
    <div class="mb-3">
        <label>Nom</label>
        <input type="text" name="nom" class="form-control" required>
    </div>
    <div class="mb-3">
        <label>Prénom</label>
        <input type="text" name="prenom" class="form-control" required>
    </div>
    <div class="mb-3">
        <label>Age</label>
        <input type="number" name="age" class="form-control" required>
    </div>
    <input type="submit" value="Ajouter" class="btn btn-primary">
    <a href="listerClients.jsp" class="btn btn-secondary">Annuler</a>
</form>

<%
if(request.getMethod().equalsIgnoreCase("POST")) {
    String nom = request.getParameter("nom");
    String prenom = request.getParameter("prenom");
    int age = Integer.parseInt(request.getParameter("age"));

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestion_clients","root","");
        String sql = "INSERT INTO Client(nom, prenom, age) VALUES (?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, nom);
        ps.setString(2, prenom);
        ps.setInt(3, age);
        int n = ps.executeUpdate();
        ps.close();
        conn.close();

        if(n > 0){
            response.sendRedirect("listerClients.jsp?recherche=" + URLEncoder.encode(nom, "UTF-8"));
        }
    } catch(Exception e){
        out.println("<div class='alert alert-danger'>Erreur : " + e.getMessage() + "</div>");
    }
}
%>

</body>
</html>
