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

@WebServlet("/AddNewTheatre")
public class AddNewTheatre extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddNewTheatre() {
        super();
    }

    PrintWriter out = null;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		out = response.getWriter();
		TheatreBean b = new TheatreBean();

		b.setName(request.getParameter("name"));
		b.setAddress(request.getParameter("address"));
		b.setCity(request.getParameter("city"));
		b.setState(request.getParameter("state"));
		b.setContact_person(request.getParameter("contact"));
		b.setContact_number(request.getParameter("contact1"));

		TheatreDaou d = new TheatreDaou();
		// int res = d.insert(b);

		if (d.insert(b) != 0) {
			out.print(request.getParameter("name") + " Record Added Successfull");
			response.sendRedirect("./Admin/view_theater.jsp");
		} else {
			out.print("Insertion failed");
			response.sendRedirect("./Admin/view_theater.jsp");
		}

		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
