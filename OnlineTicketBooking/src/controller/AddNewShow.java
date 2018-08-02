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

@WebServlet("/AddNewShow")
public class AddNewShow extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public AddNewShow() {
        super();
    }
    
    PrintWriter out = null;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		out=response.getWriter();
		ShowBean b = new ShowBean();
		b.setMovie_id(request.getParameter("movie_id"));
		b.setTheatre_id(request.getParameter("theatre_id"));
		b.setPrice(request.getParameter("price"));
		b.setShow_date(request.getParameter("show_date"));
		ShowDaou d = new ShowDaou();
		
		//out.println(b.getMovie_id()+"<br>\n"+b.getTheatre_id()+"<br>\n"+b.getPrice()+"<br>\n"+b.getShow_date());
		
		if (d.insert(b) != 0) {
			System.out.println("AddNewShow.java: Show Record Added Successfull");
			response.sendRedirect("./Admin/view_show.jsp");
		} else {
			System.out.println("AddNewShow.java: Show Insertion failed");
			response.sendRedirect("./Admin/view_show.jsp");
		}
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
