<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    			
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="daou.ShowDaou" %>
<%	List<String> list = new ArrayList<String>();
	ShowDaou d = new ShowDaou();
	List<String> list1 = new ArrayList<String>();
	String t_name = null;
	list = d.getShowRecordsByQuery("SELECT DISTINCT td.name FROM SHOW_DETAIL sd "+
			"INNER JOIN THEATRE_DETAIL td "+
			"ON td.theatre_id = sd.theatre_id "+
			"WHERE movie_id = '"+request.getParameter("id")+"' "+
			"And trunc(show_date) = (TO_Date('"+request.getParameter("date")+"', 'DD/mm'))");
	for(String str:list){
		%>
		<tr class="" >
			<th id = "abcd" class="center"><%= str %></th>
		</tr>	
		<tr class="alt">
		<td class="center">
		<%
		list1 = d.getShowRecordsByQuery("SELECT TO_CHAR(sd.show_date, 'hh/MI am') FROM SHOW_DETAIL sd "+
				"INNER JOIN THEATRE_DETAIL td ON td.theatre_id = sd.theatre_id "+
				"WHERE movie_id = '"+request.getParameter("id")+"' "+
				"And trunc(show_date) = (TO_Date('"+request.getParameter("date")+"', 'DD/MON')) "+
				"And name = '"+str+"' ");
		//System.out.println(str + "\n "+ list1);
	
		for(String str1:list1){
			String show_id = d.getShowIdByQuery("SELECT sd.show_id FROM SHOW_DETAIL sd "+
					"INNER JOIN THEATRE_DETAIL td ON td.theatre_id = sd.theatre_id "+
					"WHERE movie_id = '"+request.getParameter("id")+"' "+
					"And show_date = (TO_Timestamp('"+request.getParameter("date")+str1+"', 'DD/MON HH12/MI AM')) "+
					"And name = '"+str+"' ");
			//System.out.println("show_id "+show_id);
 		%>
		<button type="button" class = "btn btn-success" value="<%= show_id %>">
		<%= //String strd=request.getParameter("date");
		//System.out.println("Date "+strd);
		//out.println("Date "+strd); 
			// request.getParameter("date") +" "+ 
		str1
		%>
		</button>
		<% } %>
		</td>
	</tr>
<% } %>

