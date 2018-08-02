package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.UserBean;
import daou.UserDaou;

@WebServlet("/AuthenticateUser")
public class AuthenticateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AuthenticateUser() {
        super();
    }
    PrintWriter out = null;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		out = response.getWriter();
		
		UserBean b = new UserBean();
		b.setEmail(request.getParameter("username"));
		b.setPassword(request.getParameter("password"));
		
		UserDaou d = new UserDaou();
		ResultSet rs = d.checkLogin(b);
		boolean result = false;
		try {
			result = rs.next();
			//b.setCity(rs.getString(8));
			if (result) {
			b.setUser_id(rs.getString(1));
			b.setName(rs.getString(2));
			b.setGender(rs.getString(3));
			b.setEmail(rs.getString(4));
			b.setPassword(rs.getString(5));
			b.setContact(rs.getString(6));
			b.setAddress(rs.getString(7));
			b.setCity(rs.getString(8));
			b.setState(rs.getString(9));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//System.out.print(b.getCity());
		if (result)
		{
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
			
			if(session.getAttribute("city")==null || session.getAttribute("city")=="")
				session.setAttribute("city", b.getCity());
			out.print("Login Successfull");
		}
		else out.print("UserName or Password Wrong");
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
