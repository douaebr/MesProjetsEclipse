<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <title>Infos du client</title>
</head>
<body>
    <h2>Informations sur la requête</h2>
    <ul>
        <li>Type mime de la requête : <%= request.getContentType() %></li>
        <li>Protocole de la requête : <%= request.getProtocol() %></li>
        <li>Adresse IP du client : <%= request.getRemoteAddr() %></li>
        <li>Nom du client : <%= request.getRemoteHost() %></li>
        <li>Nom du serveur : <%= request.getServerName() %></li>
        <li>Port du serveur : <%= request.getServerPort() %></li>
        <li>Scheme : <%= request.getScheme() %></li>
    </ul>

    <h2>Liste des paramètres :</h2>
    <ul>
        <%
            java.util.Enumeration<String> params = request.getParameterNames();
            while (params.hasMoreElements()) {
                String nom = params.nextElement();
                String valeur = request.getParameter(nom);
        %>
                <li>nom : <%= nom %> valeur : <%= valeur %></li>
        <%
            }
        %>
    </ul>
</body>
</html>
