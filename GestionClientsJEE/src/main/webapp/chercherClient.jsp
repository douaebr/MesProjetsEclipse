<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Chercher Client</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">

<h2>Chercher un client</h2>

<form method="post" class="mb-3">
    <div class="mb-3">
        <label>Nom</label>
        <input type="text" name="nom" class="form-control" placeholder="Entrez le nom" required>
    </div>
    <input type="submit" value="Chercher" class="btn btn-primary">
    <a href="listerClients.jsp" class="btn btn-secondary">Retour à la liste</a>
</form>

<%
if(request.getMethod().equalsIgnoreCase("POST")) {

    String nom = request.getParameter("nom");

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestion_clients","root","");
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM Client WHERE nom LIKE ?");
        ps.setString(1, "%" + nom + "%");
        ResultSet rs = ps.executeQuery();
%>

<table class="table table-bordered mt-3">
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
            <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Voulez-vous vraiment supprimer ce client ?')">Supprimer</button>
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
    }catch(Exception e){
%>
<tr><td colspan="5" class="text-danger">Erreur : <%= e.getMessage() %></td></tr>
<%
    }
}
%>
    </tbody>
</table>

</body>
</html>
