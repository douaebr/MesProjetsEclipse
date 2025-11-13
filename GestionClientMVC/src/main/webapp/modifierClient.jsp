<%@ page import="model.Client" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Modifier Client</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
<h2>Modifier le Client</h2>

<%
    Client c = (Client) request.getAttribute("client");
%>

<form method="post" action="ClientController?action=modifier">
    <input type="hidden" name="id" value="<%=c.getId()%>">
    <div class="mb-3">
        <label class="form-label">Nom</label>
        <input type="text" name="nom" class="form-control" value="<%=c.getNom()%>" required>
    </div>
    <div class="mb-3">
        <label class="form-label">Prénom</label>
        <input type="text" name="prenom" class="form-control" value="<%=c.getPrenom()%>" required>
    </div>
    <div class="mb-3">
        <label class="form-label">Âge</label>
        <input type="number" name="age" class="form-control" value="<%=c.getAge()%>" required>
    </div>
    <button type="submit" class="btn btn-warning">Modifier</button>
    <a href="ClientController" class="btn btn-secondary">Annuler</a>
</form>

</body>
</html>
