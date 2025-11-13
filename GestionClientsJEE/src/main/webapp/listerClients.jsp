<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>
<html>
<head>
    <title>Gestion Clients</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">

<h2 class="mb-4">Gestion Clients</h2>

<!-- Barre de recherche + Bouton Ajouter -->
<form method="post" class="row g-3 mb-3">
    <div class="col-auto">
        <input type="text" name="recherche" class="form-control" placeholder="Rechercher par nom" 
               value="<%= request.getParameter("recherche") != null ? request.getParameter("recherche") : "" %>">
    </div>
    <div class="col-auto">
        <button type="submit" class="btn btn-primary">Rechercher</button>
    </div>
    <div class="col-auto">
        <a href="ajouterClient.jsp" class="btn btn-success">Ajouter Client</a>
    </div>
</form>

<%
String message = "";

if(request.getParameter("supprimerId") != null) {
    int supId = Integer.parseInt(request.getParameter("supprimerId"));
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestion_clients","root","");
        PreparedStatement ps = conn.prepareStatement("DELETE FROM Client WHERE id=?");
        ps.setInt(1, supId);
        int n = ps.executeUpdate();
        if(n>0) message = "Client supprimé avec succès !";
        ps.close();
        conn.close();
    }catch(Exception e){
        message = "Erreur : " + e.getMessage();
    }
}

if(!message.isEmpty()){
%>
<div class="alert alert-info"><%=message%></div>
<%
}

String recherche = request.getParameter("recherche");
String sql = "SELECT * FROM Client";
if(recherche != null && !recherche.trim().isEmpty()){
    sql += " WHERE nom LIKE ?";
}
%>

<table class="table table-bordered">
    <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Age</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestion_clients","root","");
    PreparedStatement ps = conn.prepareStatement(sql);
    if(recherche != null && !recherche.trim().isEmpty()){
        ps.setString(1, recherche + "%"); // <-- filtrage uniquement par début du nom
    }
    ResultSet rs = ps.executeQuery();
    boolean found = false;
    while(rs.next()){
        found = true;
%>
<tr>
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getString("nom") %></td>
    <td><%= rs.getString("prenom") %></td>
    <td><%= rs.getInt("age") %></td>
    <td>
        <a href="modifierClient.jsp?id=<%=rs.getInt("id")%>" class="btn btn-sm btn-warning">Modifier</a>
        <form method="post" style="display:inline;">
            <input type="hidden" name="supprimerId" value="<%=rs.getInt("id")%>">
            <button type="submit" class="btn btn-sm btn-danger" 
                    onclick="return confirm('Voulez-vous vraiment supprimer ce client ?')">Supprimer</button>
        </form>
    </td>
</tr>
<%
    }
    if(!found){
%>
<tr><td colspan="5" class="text-center">Aucun client trouvé</td></tr>
<%
    }
    rs.close();
    ps.close();
    conn.close();
} catch(Exception e){
%>
<tr><td colspan="5" class="text-danger">Erreur : <%= e.getMessage() %></td></tr>
<%
}
%>
    </tbody>
</table>

</body>
</html>
