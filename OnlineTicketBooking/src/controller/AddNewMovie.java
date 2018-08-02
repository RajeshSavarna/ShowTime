package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.MovieBean;
import daou.MovieDaou;

@WebServlet("/AddNewMovie")
public class AddNewMovie extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddNewMovie() {
		super();
	}

	PrintWriter out = null;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		out = response.getWriter();
		MovieBean b = new MovieBean();

		// b.setMovie_id(request.getParameter("movie_id"));
		// System.out.println(" movie_id "+request.getParameter("movie_id"));
		b.setTitle(request.getParameter("name"));
		b.setImage(request.getParameter("poster"));
		System.out.println(" poster Addnew movie" + request.getParameter("poster"));
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
		// int res = d.insert(b);

		if (d.insert(b) != 0) {
			out.print(request.getParameter("name") + " Record Added Successfull");
			response.sendRedirect("./Admin/view_movie.jsp");
		} else {
			out.print("Insertion failed");
			response.sendRedirect("./Admin/view_movie.jsp");
		}

		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
