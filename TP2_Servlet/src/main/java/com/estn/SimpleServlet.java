package com.estn;

import jakarta.servlet.Servlet;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;


@WebServlet("/simple")

public class SimpleServlet implements Servlet {

    private ServletConfig config;

    @Override
    public void init(ServletConfig config) throws ServletException {
        this.config = config;
    }

    @Override
    public ServletConfig getServletConfig() {
        return config;
    }

    @Override
    public void service(ServletRequest arg0, ServletResponse arg1) throws ServletException, IOException {

    	arg1.setContentType("text/html");
		PrintWriter out =arg1.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>ma première servlet</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h2 align=center ><u>Simple Servlet Generic</u></h2>");
		out.println("<h2 align='center'>"+ new Date()+"</h2>");
		out.println("</body>");
		out.println("</html>");
    }

    @Override
    public String getServletInfo() {
        return "SimpleServlet - exemple";
    }

    @Override
    public void destroy() {
        
    }
}
