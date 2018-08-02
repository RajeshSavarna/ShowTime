package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.UserBean;
import daou.UserDaou;

@WebServlet("/UpdateAccount")
public class UpdateAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public UpdateAccount() {
        super();
    }

    PrintWriter out = null;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		out = response.getWriter();
		UserBean b = new UserBean();
		b.setUser_id(request.getParameter("user_id"));
		b.setName(request.getParameter("title")+" "+request.getParameter("name"));
		b.setGender(request.getParameter("gender"));
		b.setEmail(request.getParameter("email"));
		b.setPassword(request.getParameter("password"));
		b.setContact(request.getParameter("mobile"));
		b.setAddress(request.getParameter("address"));
		b.setCity(request.getParameter("city"));
		b.setState(request.getParameter("state"));
		
		UserDaou d = new UserDaou();
		int res = d.update(b);
		
		if(res!=0) {
			HttpSession session=request.getSession();
			session.setMaxInactiveInterval(20*60);
			
			session.setAttribute("user", b.getEmail());
			session.setAttribute("userid", b.getUser_id());
			session.setAttribute("name", b.getName());
			session.setAttribute("gender", b.getGender());
			session.setAttribute("email", b.getEmail());
			session.setAttribute("pass", b.getPassword());
			session.setAttribute("contact", b.getContact());
			session.setAttribute("address", b.getAddress());
			session.setAttribute("city1", b.getCity());
			session.setAttribute("state1", b.getState());
			
			out.print("Update Successfull");
			String message="Account Updated";
			response.sendRedirect("myAccount.jsp?message="+URLEncoder.encode(message,"UTF-8"));
		}
		else {
			out.print("Update failed");
			String message="Update failed....!!!!";
			response.sendRedirect("myAccount.jsp?message="+URLEncoder.encode(message,"UTF-8"));
		}
		//response.sendRedirect(request.getRequestURI());
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
