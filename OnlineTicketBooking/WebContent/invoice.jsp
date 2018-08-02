<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp"%>
<%@ page import="daou.BookingDaou" %>
<%@ page import="bean.BookingBean"%>
<% 
String selected_seat = request.getParameter("selected_seat");
String show_id = request.getParameter("show_id");
BookingDaou d = new BookingDaou();
BookingBean  b = new BookingBean();
b = d.getBookingRecordById(selected_seat, show_id);
%>
	<header class="clearfix"></header>

		<div class="top-bar clearfix">
			<div class="container-fluid">
				<div class="row gutter">
					<div class="col-md-12 col-sm-6 col-xs-12">
						<h3 class="page-title text-center">Invoice</h3>
					</div>
				</div>
			</div>
		</div>
		<div class="main-containerr">
			<div class="row gutter">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="printableDiv">
					<div class="invoice">
						<div class="panel no-margin">
							<div class="panel-body">
								<div class="row gutter">
									<div class="col-lg-3 col-md-3 col-sm-3 col-xs-5">
										<a href="index.html">
											<img src="./themes/images/icon.svg" alt="Logo" class="logo" style="padding-left:20px;">
										</a>
									</div>
									<div class="col-md-8 col-sm-8 col-xs-6">
										<div class="right-text">
											<p>
												<b>Invoice ID</b> - <%=b.getBooking_id() %>
											</p>
											<p>
												<b>Booking date</b> - <%=b.getOrder_date() %>
											</p>
											<p>
												<b>Payment status</b> <span class="label label-success">Paid</span>
											</p>
										</div>
									</div>
								</div>
								<hr>
								<br>
								<br>
								<div class="row gutter">
									<div class="col-md-4 col-sm-4 col-xs-4">
										<address class="from" >
											<h4>
												<b><%=b.getMovie_name() %></b>
											</h4>
											<abbr title="Language">Language:</abbr> <a href="mailto:#"
												data-original-title="" title=""><%=b.getLanguage() %></a><br>
											<abbr title="Certificate">Certificate:</abbr> <%=b.getCertificate() %><br>
											<abbr title="Rating">Rotten Tomatoes:</abbr> 99.98%
										</address>
									</div>
									<div class="col-md-4 col-sm-4 col-xs-4">
										<address class="to">
											<h4>
												<b><%=b.getTheatre_name() %></b>
											</h4>
											<abbr title="Address">Address:</abbr> <a href="mailto:#"
												data-original-title="" title=""><%=b.getAddress() %></a><br>
											<abbr title="City">City:</abbr> <%=b.getCity() %><br>
											<abbr title="State">State:</abbr> <%=b.getState() %>
										</address>
									</div>
									<div class="col-md-3 col-sm-3 col-xs-3">
										<address class="to">
											<h4>
												<b>Show Detail </b>
											</h4>
											<abbr title="Seat">Seat:</abbr> <a href="mailto:#"
												data-original-title="" title=""><%=b.getSeat_number() %></a><br>
											<abbr title="Date">Date:</abbr> <%=b.getShow_date() %><br>
											<abbr title="Time">Time:</abbr> <%=b.getShow_time() %>
										</address>
									</div>
								</div>
								<br>
								<div class="row gutter">
									<div class="col-md-12">
										<div class="table-responsive">
											<table class="table table-striped table-bordered table-middle">
												<thead>
													<tr class="text-center">
														<th style="width: 70%">Movie Name</th>
														<th style="width: 20%">Quantity</th>
														<th style="width: 10%">Total</th>
													</tr>
												</thead>
												<tbody class="center">
													<tr>
														<td><b><%=b.getMovie_name() %> Ticket</b></td>
														<td><span class="btn btn-info btn-xs"><%=b.getSeat_qty() %></span> &#215; <%=b.getPrice() %></td>
														<td><b><b>&#8377;</b><%=b.getT_cost() %></b></td>
													</tr>
													<tr>
														<td class="total" colspan="2">Service Tax </td>
														<td><b><b>&#8377;</b>0</b></td>
													</tr>
													<tr>
														<td class="total" colspan="2">Convenience Fee (<b>&#8360;</b>18/Ticket)</td>
														<td><b><b>&#8377;</b><%=b.getTax() %></b></td>
													</tr>
													<tr>
														<td class="total" colspan="2">Total</td>
														<td><h3>
																<b><b>&#8377;</b><%=b.getTotal_cost() %></b>
															</h3></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="row gutter">
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<p style="padding-left:10px">
											<b>Important Notes:</b>
											<br>
											Tickets &amp; food once ordered cannot be exchanged, cancelled or refunded.<br>
											Children aged 3 years and above will require a separate ticket.<br>
											The 3D glasses will be available at the cinema for 3D films and must 
											be returned before you exit the premises. 3D Glasses are chargeable 
											(refundable/ <NOBR>non-refundable)</NOBR> as per individual cinema policies.<br>
											Items like laptop, cameras,knifes, lighter,match box, cigarettes, firearms and 
											all types of inflammable objects are strictly prohibited.<br>
											Items like carrybags eatables, helmets, handbags are not allowed inside the 
											theaters are strictly prohibited. Kindly deposit at the baggage counter of mall/ cinema.
											<br>Please check the suitability of the movie as per the Censor Board rating. 
											Cinema management holds Rights of Admission and can deny admission for compliance of 
											cinema policies.
										</p>
										<ul>
											<li>U : Unrestricted Public Exhibition throughout India, suitable for all age groups</li>
											<li>A : Viewing restricted to adults above 18 years only</li>
											<li>U/A : Unrestricted public exhibition with parental guidance for children below age 12</li>
											<li>S : Film is meant for specialized audience such as doctors</li>
										</ul>
									</div>
								</div>
								<div class="row gutter">
									<div class="col-lg-11 col-md-11 col-sm-11 col-xs-12">
										<div class="btn-group">
											<button type="button" class="btn-lg btn btn-success" onclick="printDiv('printableDiv');">
												<i class="icon-print" style="font-size:0px"></i> Print <i class="icon-print" style="font-size:0px"></i>
											</button>
											<script>
											function printDiv(divName){
												var printContents = document.getElementById(divName).innerHTML;
												var originalContents = document.body.innerHTML;
												document.body.innerHTML = printContents;
												window.print();
												document.body.innerHTML = originalContents;
											}
											 </script>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>	
		 
		<section id="footer-bar">
				<div class="row">
					<div class="span3">
						<h4>Navigation</h4>
						<ul class="nav">
							<li><a href="./index.jsp">Homepage</a></li>  
							<li><a href="./about.jsp">About Us</a></li>
							<li><a href="./contact.jsp">Contact Us</a></li>
							<% if(session.getAttribute("user")==null || session.getAttribute("user")==""){ %>
							<li><a href="#myModal" data-toggle="modal"
							data-target="#myModal">Login</a></li>
							<% } else{ %>
							<li><a href="UlogOut" id="LogOut">LogOut</a></li>
							<% } %>							
						</ul>					
					</div>
					<div class="span4">
						<h4>My Account</h4>
						<ul class="nav">
							<li><a href="javascript:myAccountPage()">My Account</a></li>
							<li><a href="javascript:myAccountPage()">Booking History</a></li>
							<li><a href="#">Newsletter</a></li>
						</ul>
					</div>
					<div class="span5">
						<p class="logo"><img src="themes/images/logo.png" class="site_logo" alt=""></p>
						<p>showtime.com is an online movie and events ticket booking portal started and based in Bihar. It is a third party ticketing facility with presence in Muzaffarpur, Darbhanga and Patna. The company's online platform caters to ticket sales for movies as well as plays, concerts and sporting events. It was founded in 2018 and is headquartered in Muzaffarpur, Bihar.</p>
						<br/>
					</div>					
				</div>	
			</section>
			<section id="copyright">
				<span>Copyright 2018 &copy; Showtime Entertainment Pvt. Ltd. All Rights Reserved.</span>
			</section>
		</div>
</body>
</html>