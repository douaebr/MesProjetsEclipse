<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    com.estn.model.PrimeModel pm = (com.estn.model.PrimeModel) request.getAttribute("pm");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Résultat Prime</title>
</head>
<body>
    <h2 align="center">Résultat du calcul de la prime</h2>
    <p align="center">
        Nom : <%= pm.getNom() %> <br>
        Prénom : <%= pm.getPrenom() %> <br>
        Prime : <%= pm.getPrime() %> DH
    </p>
    <p align="center">
        <a href="index.html">Retour</a>
    </p>
</body>
</html>
