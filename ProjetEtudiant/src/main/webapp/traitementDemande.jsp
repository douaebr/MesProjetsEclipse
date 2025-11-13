<jsp:useBean id="etu" class="beans.Etudiant" scope="request" />

<jsp:setProperty name="etu" property="*" />

<jsp:forward page="TraitementServlet" />
