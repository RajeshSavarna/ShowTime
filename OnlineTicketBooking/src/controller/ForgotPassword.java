package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.UserBean;
import daou.UserDaou;

@WebServlet("/ForgotPassword")
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ForgotPassword() {
        super();
    }
    PrintWriter out = null;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		out = response.getWriter();

		HttpSession session=request.getSession();
		
		if (request.getParameter("tab").equals("0")) {
			UserBean b = new UserBean();		
			UserDaou d = new UserDaou();
			b = d.getAllRecordsByEmail(request.getParameter("email"));
	
			//System.out.print("\t\n\t"+b.getEmail()+"\t\n\t"+request.getParameter("email")+"\t\n\t");
			if (b.getEmail() != null && b.getEmail().equals(request.getParameter("email")))
			{
				session.setMaxInactiveInterval(20*60);
				
				session.setAttribute("userid1", b.getUser_id());
				session.setAttribute("name1", b.getName());
				session.setAttribute("gender1", b.getGender());
				session.setAttribute("email1", b.getEmail());
				session.setAttribute("pass1", b.getPassword());
				session.setAttribute("contact1", b.getContact());
				session.setAttribute("address1", b.getAddress());
				session.setAttribute("city1", b.getCity());
				session.setAttribute("state1", b.getState());
				
				out.print("E-mail found");
			}
			else 
				out.print("E-mail not found in our database. Please recheck your E-mail and try again.");
		}
		else if (request.getParameter("tab").equals("1")) {
			String name = request.getParameter("name");
			String name1 = (String)session.getAttribute("name1");
			name1 = name1.substring(name1.indexOf(" ")+1);
			String ph = request.getParameter("ph");
			String ph1 = (String)session.getAttribute("contact1");
			
			if (name.equals(name1) && ph.equals(ph1))
				out.print("Details Matched");
			else
				out.print("Details Not Matched");
		}
		else if (request.getParameter("tab").equals("2")) {
			String state = request.getParameter("state");
			String state1 = (String)session.getAttribute("state1");
			String city = request.getParameter("city");
			String city1 = (String)session.getAttribute("city1");
			
			if (state.equals(state1) && city.equals(city1))
				out.print("Details Matched");
			else
				out.print("Details Not Matched");
		}
		else if (request.getParameter("tab").equals("3")) {
			//String pass = request.getParameter("pass");
			
			UserBean b = new UserBean();
			b.setUser_id((String)session.getAttribute("userid1"));
			b.setName((String)session.getAttribute("name1"));
			b.setGender((String)session.getAttribute("gender1"));
			b.setEmail((String)session.getAttribute("email1"));
			b.setPassword(request.getParameter("pass"));
			b.setContact((String)session.getAttribute("contact1"));
			b.setAddress((String)session.getAttribute("address1"));
			b.setCity((String)session.getAttribute("city1"));
			b.setState((String)session.getAttribute("state1"));
			
			UserDaou d = new UserDaou();
			int res = d.update(b);
			
			if (res != 0) {
				
				response.setHeader("Cache-Control", "no-cache, no-store");
			    response.setHeader("Pragma", "no-cache");

				session.invalidate();
				//System.out.print("Password Updated");
				out.print("Password Updated");
				//response.sendRedirect("index.jsp");
			}
			else {
				
				response.setHeader("Cache-Control", "no-cache, no-store");
			    response.setHeader("Pragma", "no-cache");

				session.invalidate();
				//System.out.print("Something went wrong!!!!!");
				out.print("Something went wrong!!!!!");
			}
		}
		
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
