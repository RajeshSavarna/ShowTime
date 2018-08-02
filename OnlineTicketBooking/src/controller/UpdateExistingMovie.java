package controller;

import java.io.IOException;
import java.io.PrintWriter;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.MovieBean;
import daou.MovieDaou;

@WebServlet("/UpdateExistingMovie")
public class UpdateExistingMovie extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateExistingMovie() {
		super();
	}

	PrintWriter out = null;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		out = response.getWriter();
		MovieBean b = new MovieBean();

		b.setMovie_id(request.getParameter("movie_id"));
		// System.out.println(" movie_id "+request.getParameter("movie_id"));
		b.setTitle(request.getParameter("name"));

		// b.setImage(request.getParameter("image"));
		// String image = request.getParameter("image");

		String poster = request.getParameter("poster");
		System.out.println("poster updateservlet "+poster+" \n "+request.getParameter("trailer")+"\n"+request.getParameter("image"));
		
		if (poster == null || poster.equals(""))
			b.setImage(request.getParameter("image"));
		else {
			// String poster1 = upload(poster);
			b.setImage(poster);
		}

		b.setGenre(request.getParameter("genre"));
		b.setLanguage(request.getParameter("language"));
		b.setCertificate(request.getParameter("certificate"));
		b.setDuration(request.getParameter("duration"));
		b.setCast(request.getParameter("cast"));
		b.setDirector(request.getParameter("director"));
		b.setTrailer_url(request.getParameter("trailer"));
		b.setDescription(request.getParameter("description"));
		b.setRelease_date(request.getParameter("release"));
		b.setRating(request.getParameter("rating"));

		MovieDaou d = new MovieDaou();
		// int res = d.update(b);

		if (d.update(b) != 0) {
			System.out.print("Movie servlet "+"Update Successfull");
			out.println("<script language=\"javascript\">");
			out.println("alert('Update Successfull');");
			out.println("</script>");
			response.sendRedirect("./Admin/view_movie.jsp");
			//RequestDispatcher rd = request.getRequestDispatcher("./Admin/view_movie.jsp");
			//rd.forward(request,response);
			
		}
		else {
			System.out.print("Movie servlet "+"Update failed");
			out.println("<script language=\"javascript\">");
			out.println("alert('Update failed');");
			out.println("</script>");
			response.sendRedirect("./Admin/view_movie.jsp");
			//RequestDispatcher rd = request.getRequestDispatcher("./Admin/view_movie.jsp");
			//rd.include(request,response);			
		}

		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
