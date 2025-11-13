<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ajouter Client</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
<h2>Ajouter un Client</h2>

<form method="post" action="ClientController?action=ajouter">
    <div class="mb-3">
        <label class="form-label">Nom</label>
        <input type="text" name="nom" class="form-control" required>
    </div>
    <div class="mb-3">
        <label class="form-label">Prénom</label>
        <input type="text" name="prenom" class="form-control" required>
    </div>
    <div class="mb-3">
        <label class="form-label">Âge</label>
        <input type="number" name="age" class="form-control" required>
    </div>
    <button type="submit" class="btn btn-success">Ajouter</button>
    <a href="ClientController" class="btn btn-secondary">Annuler</a>
</form>

</body>
</html>
