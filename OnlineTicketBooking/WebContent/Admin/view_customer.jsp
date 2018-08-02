<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp"%>

<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="bean.UserBean"%>
<%@ page import="daou.UserDaou"%>
<section>
	<h3 class="text-center">User Record</h3>
	<!--
	<div style="margin-bottom: 50px;">
		<h2 class="text-center">User Details</h2>
		<button class="btn btn-info pull-right" title="search">
			<i class="icon icon-search" style="font-size: 0px"></i>
		</button>
		<input type="search" class="pull-right" style="margin: 0px;">
	</div>
	-->
</section>


<section>
	<div class=row>
		<div class="span12">
			<table cellpadding="0" cellspacing="0" border="0"
			class="table table-striped table-bordered" id="example">
			<thead>
				<tr>
					<th>Id</th>
					<th>Name</th>
					<th>Gender</th>
					<th>Email</th>
					<th>Contact</th>
					<th>Address</th>
					<th>City</th>
					<th>State</th>
				</tr>
			</thead>
			<tbody>
				<%
					List<UserBean> list = new ArrayList<UserBean>();
					UserDaou d = new UserDaou();
					list = d.getAllUserRecords();
					for (UserBean b : list) {
				%>
				<tr>
					<td><%=b.getUser_id()%></td>
					<td><%=b.getName()%></td>
					<td><%=b.getGender()%></td>
					<td><%=b.getEmail()%></td>
					<td><%=b.getContact()%></td>
					<td><%=b.getAddress()%></td>
					<td><%=b.getCity()%></td>
					<td><%=b.getState()%></td>
				</tr>
				<%
					}
				%>
			<tbody>
			</table>
		</div>
	</div>
</section>

<section id="footer-bar">
	<div class="row">
		<div class="span3">
			<h4>Navigation</h4>
			<ul class="nav">
				<li><a href="index.jsp">Homepage</a></li>
				<li><a href="view_movie.jsp">Movie</a></li>
				<li><a href="view_theater.jsp">Theater</a></li>
				<li><a href="../Admin_Logout">Logout</a></li>
			</ul>
		</div>
		<div class="span4">
			<h4>My Account</h4>
			<ul class="nav">
				<li><a href="view_show.jsp">Show Details</a></li>
				<li><a href="view_bookings.jsp">Booking History</a></li>
				<li><a href="#">Newsletter</a></li>
			</ul>
		</div>
		<div class="span5">
			<p class="logo">
				<img src="../themes/images/logo.png" class="site_logo" alt="">
			</p>
			<p>showtime.com is an online movie and events ticket booking
				portal started and based in Bihar. It is a third party ticketing
				facility with presence in Muzaffarpur, Darbhanga and Patna. The
				company's online platform caters to ticket sales for movies as well
				as plays, concerts and sporting events. It was founded in 2018 and
				is headquartered in Muzaffarpur, Bihar.</p>
			<br />
		</div>
	</div>
</section>
<section id="copyright">
	<span>Copyright 2018 &copy; Showtime Entertainment Pvt. Ltd. All
		Rights Reserved.</span>
</section>
</div>
</body>
</html>