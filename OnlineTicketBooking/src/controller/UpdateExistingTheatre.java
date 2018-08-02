package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.TheatreBean;
import daou.TheatreDaou;

@WebServlet("/UpdateExistingTheatre")
public class UpdateExistingTheatre extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateExistingTheatre() {
        super();
    }
    PrintWriter out = null;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		out = response.getWriter();
		TheatreBean b = new TheatreBean();
		
		b.setTheatre_id(request.getParameter("theatre_id"));
		//System.out.println("hello "+b.getTheatre_id());
		b.setName(request.getParameter("name"));
		b.setAddress(request.getParameter("address"));
		b.setCity(request.getParameter("city"));
		b.setState(request.getParameter("state"));
		b.setContact_person(request.getParameter("contact"));
		b.setContact_number(request.getParameter("contact1"));

		TheatreDaou d = new TheatreDaou();
		// int res = d.insert(b);

		if (d.update(b) != 0) {
			System.out.println("Theatre servlet "+request.getParameter("name") + " Record Updated Successfull");
			response.sendRedirect("./Admin/view_theater.jsp");
		} else {
			System.out.print("Theatre servlet: Updation failed");
			response.sendRedirect("./Admin/view_theater.jsp");
		}

		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		doGet(request, response);
	}

}
