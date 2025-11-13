<%@ page import="java.sql.*" %>
<%
int id = Integer.parseInt(request.getParameter("id"));
String nom="", prenom="";
int age=0;

try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestion_clients","root","");
    PreparedStatement ps = conn.prepareStatement("SELECT * FROM Client WHERE id=?");
    ps.setInt(1, id);
    ResultSet rs = ps.executeQuery();
    if(rs.next()){
        nom = rs.getString("nom");
        prenom = rs.getString("prenom");
        age = rs.getInt("age");
    }
    rs.close();
    ps.close();
    conn.close();
}catch(Exception e){
    out.println("Erreur : "+ e.getMessage());
}
%>
<html>
<head>
    <title>Modifier Client</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">

<h2>Modifier Client</h2>

<form method="post" class="mb-3">
    <div class="mb-3">
        <label>Nom</label>
        <input type="text" name="nom" value="<%=nom%>" class="form-control" required>
    </div>
    <div class="mb-3">
        <label>Prénom</label>
        <input type="text" name="prenom" value="<%=prenom%>" class="form-control" required>
    </div>
    <div class="mb-3">
        <label>Age</label>
        <input type="number" name="age" value="<%=age%>" class="form-control" required>
    </div>
    <input type="submit" value="Modifier" class="btn btn-warning">
</form>

<%
if(request.getMethod().equalsIgnoreCase("POST")){
    String newNom = request.getParameter("nom");
    String newPrenom = request.getParameter("prenom");
    int newAge = Integer.parseInt(request.getParameter("age"));
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestion_clients","root","");
        PreparedStatement ps = conn.prepareStatement("UPDATE Client SET nom=?, prenom=?, age=? WHERE id=?");
        ps.setString(1, newNom);
        ps.setString(2, newPrenom);
        ps.setInt(3, newAge);
        ps.setInt(4, id);
        int n = ps.executeUpdate();
        if(n>0){
            out.println("<div class='alert alert-success'>Client modifié avec succès !</div>");
        }
        ps.close();
        conn.close();
    }catch(Exception e){
        out.println("<div class='alert alert-danger'>Erreur : "+ e.getMessage() +"</div>");
    }
}
%>

<a href="listerClients.jsp" class="btn btn-secondary mt-3">Retour</a>

</body>
</html>
