<%@ page import="java.util.List" %>
<%@ page import="model.Client" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Liste des Clients</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
<h2>Liste des Clients</h2>

<form method="get" action="ClientController" class="row g-3 mb-3">
    <input type="hidden" name="action" value="lister"/>
    <div class="col-auto">
        <input type="text" name="recherche" class="form-control" placeholder="Rechercher par nom">
    </div>
    <div class="col-auto">
        <button type="submit" class="btn btn-primary">Rechercher</button>
    </div>
    <div class="col-auto">
        <a href="ClientController?action=ajouter" class="btn btn-success">Ajouter Client</a>
    </div>
</form>

<table class="table table-bordered">
    <thead class="table-dark">
        <tr>
            <th>ID</th><th>Nom</th><th>Prénom</th><th>Age</th><th>Actions</th>
        </tr>
    </thead>
    <tbody>
    <%
        List<Client> clients = (List<Client>) request.getAttribute("listeClients");
        if (clients != null && !clients.isEmpty()) {
            for (Client c : clients) {
    %>
        <tr>
            <td><%=c.getId()%></td>
            <td><%=c.getNom()%></td>
            <td><%=c.getPrenom()%></td>
            <td><%=c.getAge()%></td>
            <td>
                <a href="ClientController?action=modifier&id=<%=c.getId()%>" class="btn btn-warning btn-sm">Modifier</a>
                <a href="ClientController?action=supprimer&id=<%=c.getId()%>" class="btn btn-danger btn-sm"
                   onclick="return confirm('Supprimer ce client ?')">Supprimer</a>
            </td>
        </tr>
    <%
            }
        } else {
    %>
        <tr><td colspan="5" class="text-center">Aucun client trouvé</td></tr>
    <%
        }
    %>
    </tbody>
</table>
</body>
</html>
