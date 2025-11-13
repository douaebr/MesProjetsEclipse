<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="erreur.jsp"%>
<html>
<body>
<h2>Choisissez une couleur</h2>

<form method="post" action="selection2.jsp">
    <input type="radio" name="couleur" value="Rouge" />Rouge<br />
    <input type="radio" name="couleur" value="Bleu" />Bleu<br />
    <input type="radio" name="couleur" value="Vert" />Vert<br />
    <input type="radio" name="couleur" value="Orange" />Orange<br />
    <input type="submit" value="Valider">
</form>

<%
    String couleur = request.getParameter("couleur");

    if (couleur != null) {
        if (couleur.equals("Orange")) {
            throw new Exception("Cette couleur n'est pas belle");
        }
%>
        <p>Vous avez choisi : <b><%= couleur %></b></p>
<%
    }
%>
</body>
</html>
