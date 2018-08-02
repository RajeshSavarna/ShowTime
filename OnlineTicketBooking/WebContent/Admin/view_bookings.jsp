<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp"%>

<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="bean.BookingBean"%>
<%@ page import="daou.BookingDaou"%>
<section>
	<h3 class="text-center">Booking Record</h3>
	<!--
	<div style="margin-bottom: 50px;">
		<h2 class="text-center">Booking Details</h2>
 
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
					<th>Order Date</th>
					<th>Movie</th>
					<th>Theater</th>
					<th>Show Date</th>
					<th>Show Time</th>
					<th>Customer Contact</th>
					<th>Customer Email</th>
					<th>Total Price</th>
					<th>View Complete Detail</th>
				</tr>
			</thead>
			<tbody>
				<%
					List<BookingBean> list = new ArrayList<BookingBean>();
					BookingDaou d = new BookingDaou();
					list = d.getAllBookingRecords();
					for (BookingBean b : list) {
				%>
				<tr>
					<td><%=b.getBooking_id()%></td>
					<td><%=b.getOrder_date()%></td>
					<td><%=b.getMovie_name()%></td>
					<td><%=b.getTheatre_name()%></td>
					<td><%=b.getShow_date()%></td>
					<td><%=b.getShow_time()%></td>
					<td><%=b.getContact()%></td>
					<td><%=b.getCustomer_email()%></td>
					<td><%=b.getTotal_cost()%></td>
					<td>
						<button title="Delete" class="btn btn-danger delete_booking_details disabled"
							data-id="<%=b.getBooking_id()%>">
							<i class="icon icon-trash" style="font-size: 0px"></i>
						</button>
						
						<button title="View" class="btn btn-primary"
							data-toggle="modal" data-target="#view_booking_details"
							data-overlay="false" data-id="<%=b.getBooking_id()%>">
							<i class="icon icon-eye-open" style="font-size: 0px"></i>
						</button>
					</td>
					<!-- trigger modal with a button  with an id -->
				</tr>
				<%
					}
				%>
			<tbody>
			</table>
		</div>
	</div>
</section>

<!-- Modal -->
<div class="modal fade" id="view_booking_details" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-lg">
		<!-- Modal Content -->
		<div class="modal-content">
			<div class="modal-header" align="center">
				<span style="font-weight: bold; font-size: 20px;">Complete Record</span>
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
			</div>
			<!-- Modal Body -->
			<div class="modal-body">
				
			</div>
			<!-- modal footer -->
			<div class="modal-footer" style="margin-top: -20px;">
				<button class="btn btn-info" data-dismiss="modal">close</button>
			</div>
		</div>
	</div>
</div>

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
<script>
/*
$('.delete_booking_details').click(function (e) {
	e.preventDefault();
	var booking_id = $(this).data('id');
	//alert(booking_id);
	var res = confirm('Confirm OK to Delete');
	if (res == true) {
		$.ajax({
		       type: 'POST',
		       url: '../delete_booking_details',
		       data: { booking_id: booking_id },
		       success: function(response) {
		    	   alert(response);
		    	   location.reload();
		       } 
		    });
	} else location.reload();
});
*/
</script>
</body>
</html>