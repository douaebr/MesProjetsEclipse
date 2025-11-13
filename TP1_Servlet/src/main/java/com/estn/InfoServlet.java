package com.estn;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Enumeration;

/**
 * Servlet qui affiche les informations du client et les paramètres passés par GET.
 */
@WebServlet("/InfoServlet")
public class InfoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public InfoServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    	// TODO Auto-generated method stub
    			response.setContentType("text/html");
    			PrintWriter out =response.getWriter();
    			out.println("<html>");
    			out.println("<head>");
    			out.println("<title>ma première servlet</title>");
    			out.println("</head>");
    			out.println("<body>");
    			out.println("<h2 align=center ><u>TP n1</u></h2>");
    			out.println("<table align='center'>");
    			out.println("<tr>");
    			out.println("<td>Type mime de la requête</td>");
    			out.println("<td>"+ request.getContentType() +"</td>");
    			out.println("</tr>");
    			
    			out.println("<tr>");
    			out.println("<td> Protocole de la requête</td>");
    			out.println("<td>"+ request.getProtocol() +"</td>");
    			out.println("</tr>");
    			
    			out.println("<tr>");
    			out.println("<td>Adresse IP du client</td>");
    			out.println("<td>"+ request.getRemoteAddr() +"</td>");
    			out.println("</tr>");
    			
    			out.println("<tr>");
    			out.println("<td>Nom du client</td>");
    			out.println("<td>"+ request.getRemoteHost() +"</td>");
    			out.println("</tr>");
    			
    			out.println("<tr>");
    			out.println("<td>Nom du serveur qui a reçu la requête</td>");
    			out.println("<td>"+ request.getServerName() +"</td>");
    			out.println("</tr>");
    			
    			out.println("<tr>");
    			out.println("<td>Port du serveur qui a reçu la requête</td>");
    			out.println("<td>"+ request.getServerPort() +"</td>");
    			out.println("</tr>");
    			
    			out.println("<tr>");
    			out.println("<td>Scheme</td>");
    			out.println("<td>"+ request.getScheme() +"</td>");
    			out.println("</tr>");
    			
    			for(Enumeration<String> paramsListe= request.getParameterNames();paramsListe.hasMoreElements();) {
    				String param =paramsListe.nextElement();
    				out.println("<tr>");
        			out.println("<td>"+param+"</td>");
        			out.println("<td>"+ request.getParameter(param) +"</td>");
        			out.println("</tr>");
    			}
    			
    			out.println("</table>");
    			out.println("</body>");
    			out.println("</html>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}
