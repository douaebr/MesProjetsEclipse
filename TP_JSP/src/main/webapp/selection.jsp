<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<body>
    <form method="POST" action="selection.jsp">
        Choisissez une couleur
        <p>
            <input type="radio" name="couleur" value="rouge" />Rouge<br />
            <input type="radio" name="couleur" value="bleu" />Bleu<br />
            <input type="radio" name="couleur" value="vert" />Vert<br />
        </p>
        <input type="submit" value="Envoyer">
    </form>

    <%
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String couleur = request.getParameter("couleur");
            if (couleur != null) {
    %>
                <p>Vous avez choisi la couleur <b><%= couleur %></b></p>
    <%
            }
        }
    %>
</body>
</html>
