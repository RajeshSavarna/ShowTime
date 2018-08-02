package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.ShowBean;
import daou.ShowDaou;

@WebServlet("/UpdateExistingShow")
public class UpdateExistingShow extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateExistingShow() {
        super();
    }
    PrintWriter out = null;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		out = response.getWriter();
		ShowBean b = new ShowBean();
		b.setShow_id(request.getParameter("show_id"));
		b.setMovie_id(request.getParameter("movie_id"));
		b.setTheatre_id(request.getParameter("theatre_id"));
		b.setPrice(request.getParameter("price"));
		b.setShow_date(request.getParameter("show_date"));
		
		ShowDaou d = new ShowDaou();
		// int res = d.insert(b);
		//out.println(b.getShow_id()+"<br>\n"+b.getMovie_id()+"<br>\n"+b.getTheatre_id()+"<br>\n"+b.getPrice()+"<br>\n"+b.getShow_date());
		
		if (d.update(b) != 0) {
			System.out.println("UpdateExistingShow: Record Updated Successfull");
			response.sendRedirect("./Admin/view_show.jsp");
		} else {
			System.out.print("UpdateExistingShow: Updation failed");
			response.sendRedirect("./Admin/view_show.jsp");
		}
		
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
