package controller;

import java.io.IOException;
//import java.io.PrintWriter;
import java.net.URLEncoder;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Admin_Login")
public class Admin_Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//PrintWriter pw=response.getWriter();			//printwriter initialized
		response.setContentType("text/HTML");					
		String admin=request.getParameter("admin");		//username stored in a variable
		String password=request.getParameter("password");		//passowrd strored in a variable
		
		if(admin.equals("Show") && password.equals("97")){		//matching is being done here not from the database
			HttpSession session=request.getSession(); 			//session created
			session.setAttribute("admin", admin);			//value provided to the session
			response.sendRedirect("Admin/index.jsp");
			//RequestDispatcher rd=request.getRequestDispatcher("admin_home.jsp");
			//rd.include(request,response);
		}else{
			String message="invalid credentials....!!!!";
			response.sendRedirect("Admin/admin_login.jsp?message="+URLEncoder.encode(message,"UTF-8"));
			//RequestDispatcher rd=request.getRequestDispatcher("../admin_login.jsp");
			//rd.include(request, response);
			//pw.print("invalid credentials..!!");
			
		}
	}

}
