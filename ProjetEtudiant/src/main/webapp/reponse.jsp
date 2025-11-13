
<html>
<head>
    <title>Réponse</title>
</head>
<body>

<h2>Informations de l'étudiant</h2>

<jsp:useBean id="etu" class="beans.Etudiant" scope="request" />

Nom final : <jsp:getProperty name="etu" property="nom" /><br><br>
Âge final : <jsp:getProperty name="etu" property="age" /><br><br>

</body>
</html>
