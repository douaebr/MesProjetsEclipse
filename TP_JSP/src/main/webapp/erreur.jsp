<%@ page isErrorPage="true" contentType="text/html; charset=UTF-8"%>
<html>
<head><title>Erreur</title></head>
<body>
<h2>Une erreur est survenue :</h2>
<p style="color:red;"><%= exception.getMessage() %></p>
</body>
</html>
