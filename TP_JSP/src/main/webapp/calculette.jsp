<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head><title>Calculette simple</title></head>
<body>
    <h2>Calculette</h2>

    <form method="post">
        Nombre 1 : <input type="text" name="nbr1"><br>
        Nombre 2 : <input type="text" name="nbr2"><br><br>

        Opération :
        <select name="operation">
            <option value="+">Addition</option>
            <option value="-">Soustraction</option>
            <option value="*">Multiplication</option>
            <option value="/">Division</option>
        </select><br><br>

        <input type="submit" value="Calculer">
    </form>

    <%
        String s1 = request.getParameter("nbr1");
        String s2 = request.getParameter("nbr2");
        String op = request.getParameter("operation");

        if (s1 != null && s2 != null && op != null) {
            try {
                double n1 = Double.parseDouble(s1);
                double n2 = Double.parseDouble(s2);
                double res = 0;

                if (op.equals("+")) res = n1 + n2;
                else if (op.equals("-")) res = n1 - n2;
                else if (op.equals("*")) res = n1 * n2;
                else if (op.equals("/")) res = n2 != 0 ? n1 / n2 : 0;

    %>
                <h3>Résultat = <%= res %></h3>
    <%
            } catch (Exception e) {
    %>
                <p style="color:red;">Erreur : entrez des nombres valides.</p>
    <%
            }
        }
    %>
</body>
</html>
