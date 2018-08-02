package controller;

import java.io.IOException;
import java.io.PrintWriter;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.UserBean;
import daou.UserDaou;

@WebServlet("/RegisterUser")
public class RegisterUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegisterUser() {
        super();
    }
    PrintWriter out = null;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		out = response.getWriter();
		UserBean b = new UserBean();
		b.setName(request.getParameter("title")+" "+request.getParameter("name"));
		b.setGender(request.getParameter("gender"));
		b.setEmail(request.getParameter("email"));
		b.setPassword(request.getParameter("password"));
		b.setContact(request.getParameter("mobile"));
		b.setAddress(request.getParameter("address"));
		b.setCity(request.getParameter("city"));
		b.setState(request.getParameter("state"));
		
		UserDaou d = new UserDaou();
		int res = d.insert(b);
		
		if(res!=0) {
			out.print("Registration Successfull");
			/*out.println("<script language=\"javascript\">");
			out.println("alert('Registration Successfull');");
			out.println("</script>");
			System.out.println((request.getHeader("referer")));
			RequestDispatcher rd = request.getRequestDispatcher(request.getHeader("referer"));
			rd.include(request,response);*/
			//response.sendRedirect(request.getHeader("Referer"));
		}
		else out.print("Registration failed");
		//response.sendRedirect(request.getRequestURI());
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
