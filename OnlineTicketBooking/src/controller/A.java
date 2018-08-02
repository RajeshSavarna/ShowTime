package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.List;
import java.util.ArrayList;
import daou.ShowDaou;

@WebServlet("/A")
public class A extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public A() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<String> list = new ArrayList<String>();
		List<String> list1 = new ArrayList<String>();
		ShowDaou d = new ShowDaou();
		PrintWriter out = response.getWriter();
		//String a = request.getParameter("value");
		list = d.getShowRecordsByQuery("SELECT DISTINCT td.name FROM SHOW_DETAIL sd "+
										"INNER JOIN THEATRE_DETAIL td "+
										"ON td.theatre_id = sd.theatre_id "+
										"WHERE movie_id = '"+request.getParameter("value")+"' "+
										"And trunc(show_date) = (TO_Date('27-may', 'DD/mm'))");
		
		/*
		list = d.getShowRecordsByQuery("SELECT DISTINCT td.name FROM SHOW_DETAIL sd"+
										"INNER JOIN THEATRE_DETAIL td"+
										"ON td.theatre_id = sd.theatre_id"+
										"WHERE movie_id = '"+request.getParameter("value")+"' "+
										"AND trunc(show_date) = (TO_Date('27-may', 'DD/mm'))");
		*/
		/*
		list = d.getShowRecordsByQuery("SELECT TO_CHAR(sd.show_date, 'hh/mm am') FROM SHOW_DETAIL sd "+
				"INNER JOIN THEATRE_DETAIL td ON td.theatre_id = sd.theatre_id "+
				"WHERE sd.movie_id = 1 "+
				"And trunc(sd.show_date) = (TO_Date('27-may', 'DD/mm')) "+
				"And td.name = ' Carnival (Amar/Jyoyi) ' ");
		*/
		for(String str:list){
			out.println(str+"<br>");
			list1 = d.getShowRecordsByQuery("SELECT TO_CHAR(sd.show_date, 'hh/mm am') FROM SHOW_DETAIL sd "+
					"INNER JOIN THEATRE_DETAIL td ON td.theatre_id = sd.theatre_id "+
					"WHERE movie_id = '"+request.getParameter("value")+"' "+
					"And trunc(show_date) = (TO_Date('27-may', 'DD/mm')) "+
					"And name = '"+str+"' ");
			
			for(String str1:list1){
				out.println(str1+"<br>");
			}
		}
	}

}
