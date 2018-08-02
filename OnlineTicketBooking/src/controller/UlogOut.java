package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UlogOut")
public class UlogOut extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	PrintWriter out = null;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		out = response.getWriter();
		HttpSession session= request.getSession();
		
		response.setHeader("Cache-Control", "no-cache, no-store");
	    response.setHeader("Pragma", "no-cache");

		session.removeAttribute("user");
		session.invalidate();
		
		out.print("Logout Successfully");
		response.sendRedirect("index.jsp");
	}

}
