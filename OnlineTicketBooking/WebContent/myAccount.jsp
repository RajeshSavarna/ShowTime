<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp"%>
<%
	if (session.getAttribute("user") == null) {
		response.sendRedirect("index.jsp");
	}
%>
<section class="header_text sub">
	<img class="pageBanner" src="themes/images/pageBanner.png"
		alt="New products">
	<!-- 
	<h4>
		<span>Your Account</span>
	</h4>
	 -->
</section>
<section class="main-content">
	<div class="row">
		<div class="span12">
			<div class="accordion" id="accordion2">
				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle center" data-toggle="collapse"
							data-parent="#accordion2" href="#collapseOne">Account Details</a>
					</div>
					<div id="collapseOne" class="accordion-body in collapse">
						<div class="accordion-inner">
							<div class="accordion-inner">
								<div class="row-fluid">
									<div style="color:Green;" class="text-center"> ${param.message}</div>
									<div class="control-group">
										<label for="name" class="control-label span6 center">Name:
											<input class="controls"
											style="padding: 0px; width: 40%; min-height: 30px; font-size: 17px; border: 1px solid #aaaaaa; text-align: center; margin-left: 30%; margin-right: 30%; font-size: 17px;"
											value="<%=session.getAttribute("name")%>" readonly>
										</label> <label for="gender" class="control-label span6 center">Gender:
											<input class="controls"
											style="padding: 0px; width: 40%; min-height: 30px; font-size: 17px; border: 1px solid #aaaaaa; text-align: center; margin-left: 30%; margin-right: 30%; font-size: 17px;"
											value="<%=session.getAttribute("gender")%>" readonly>
										</label>
									</div>
									<div class="control-group">
										<label for="email" class="control-label span6 center">E-mail:
											<input class="controls"
											style="padding: 0px; width: 40%; min-height: 30px; font-size: 17px; border: 1px solid #aaaaaa; text-align: center; margin-left: 30%; margin-right: 30%; font-size: 17px;"
											value="<%=session.getAttribute("email")%>" readonly>
										</label> <label for="contact" class="control-label span6 center">Ph.
											Number: <input class="controls"
											style="padding: 0px; width: 40%; min-height: 30px; font-size: 17px; border: 1px solid #aaaaaa; text-align: center; margin-left: 30%; margin-right: 30%; font-size: 17px;"
											value="<%=session.getAttribute("contact")%>" readonly>
										</label>
									</div>
									<div class="control-group">
										<label for="city" class="control-label span6 center">City:
											<input class="controls"
											style="padding: 0px; width: 40%; min-height: 30px; font-size: 17px; border: 1px solid #aaaaaa; text-align: center; margin-left: 30%; margin-right: 30%; font-size: 17px;"
											value="<%=session.getAttribute("city1")%>" readonly>
										</label> <label for="state" class="control-label span6 center">State:
											<input class="controls"
											style="padding: 0px; width: 40%; min-height: 30px; font-size: 17px; border: 1px solid #aaaaaa; text-align: center; margin-left: 30%; margin-right: 30%; font-size: 17px;"
											value="<%=session.getAttribute("state1")%>" readonly>
										</label>
									</div>
									<button title="Edit" class="btn btn-lg btn-primary open-update_modal"
										data-toggle="modal" data-target="#update_modal"
										data-overlay="false" style="margin:auto; display:block; width=50%;">
										<i class="icon icon-edit" style="font-size: 0px"></i> Edit
									</button>
								</div>
							</div>
						</div>
					</div>

						<div class="modal fade" id="update_modal" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title text-center" id="myModalLabel">Update Your Account Details</h4>
				</div>
				<div class="modal-body">
					<div class="row-fluid">
						<div class=""
							style="border-right: 0px dotted #C2C2C2; padding-right: 20px; padding-left: 30px;">
									<div class="row-fluid">
										<form class="form-horizontal" autocomplete="off" action="UpdateAccount">
											<fieldset>
												<div class="control-group">
													<label class="control-label span3" for="Name">Name</label>
													<div class="controls span9">
														<input name="user_id" value="<%=session.getAttribute("userid")%>" style="display: none">
														<%
														String name = (String)session.getAttribute("name");
															//System.out.print("\n\t"+name);
														if (session.getAttribute("user") != null)
															name = name.substring(name.indexOf(" ")+1);
														%>
														<select class="input-mini" name="title">
															<option>Mr.</option>
															<option>Ms.</option>
															<option>Mrs.</option>
														</select> <input type="text" name="name" pattern="[A-Za-z ]{3,}"
															class="input-large" placeholder="Name" value="<%=name %>" required
															title="Name should contains only text and minimum character should be 3" />
													</div>
												</div>

												<div class="control-group">
													<label class="control-label span3" for="Gender">Gender</label>
													<div class="controls span9">
														<select class="input-xlarge" name="gender" value="<%=session.getAttribute("gender")%>">
															<option>Male</option>
															<option>Female</option>
															<option>Others</option>
														</select>
													</div>
												</div>

												<div class="control-group">
													<label class="control-label span3" for="Email">Email</label>
													<div class="controls span9">
														<div class="input-prepend">
															<span class="add-on"><i class="icon-envelope" style="font-size:0px"></i></span>
															<input type="email" class="input-xlarge" name="email" value="<%=session.getAttribute("email")%>" pattern="[a-zA-Z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" placeholder="Email" required />
														</div>
													</div>
												</div>

												<div class="control-group">
													<label class="control-label span3" for="password">Password</label>
													<div class="controls span9"> <% //out.print(session.getAttribute("pass"));%>
														
														<input type="password" name="password" value="" autocomplete="new-password"
															pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
															class="input-xlarge" id="password" placeholder="Password" required
															title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" />
													</div>
												</div>

												<div class="control-group">
													<label class="control-label span3" for="number">Number</label>
													<div class="controls span9">
														<div class="input-prepend">
															<span class="add-on">+91</span> <input type="text" name="mobile" value="<%=session.getAttribute("contact")%>"
																class="input-large" pattern="[0-9]{10,10}"
																placeholder="Mobile" required
																title="Mobile number should be of 10 digits" />
														</div>
													</div>
												</div>

												<div class="control-group">
													<label class="control-label span3" for="Address">Address</label>
													<div class="controls span9">
														<input type="text" class="input-xlarge" name="address" value="<%=session.getAttribute("address")%>"
															placeholder="eg: h.no: B4, street: rahul nagar" required />
													</div>
												</div>

												<div class="control-group">
													<div class="span3"></div>
													<div class="controls span9">
														<div id="selection">
															<select class="input-medium" id="listBox" name="state" value="<%=session.getAttribute("state1")%>"
																onchange='selct_district(this.value)' required></select>
															<select class="input-medium" id='secondlist' name="city" value="<%=session.getAttribute("city1")%>" required></select>
														</div>
													</div>
												</div>
												<div class="control-group">
													<div class="controls span3"></div>
													<div class="controls span4">
														<button type='submit' class="btn btn-success">Update</button>
													</div>
													<div class="controls span4">
														<button class="btn btn-success" data-dismiss="modal">Cancel</button>
													</div>
												</div>

											</fieldset>
										</form>
									</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle center" data-toggle="collapse"
								data-parent="#accordion2" href="#collapseTwo">Booking
								Details</a>
						</div>
						<div id="collapseTwo" class="accordion-body collapse">
							<div class="accordion-inner">
								<div class="row-fluid">
									<div class="span12">
										<h4 class="title">
											<!-- <span class="text"><strong>Your</strong> Bookings</span>  -->
										</h4>
										<table class="table table-striped">
											<thead>
												<tr>
													<th>Booking No</th>
													<th>Order Date</th>
													<th>Movie Name</th>
													<th>Theater Name</th>
													<th>Movie Type</th>
													<th>Show Date</th>
													<th>Show Time</th>
													<th>Seat Number</th>
													<th>Price</th>
												</tr>
											</thead>
											<tbody>
											<%@ page import="daou.BookingDaou" %>
											<%@ page import="java.sql.ResultSet"%>
											<%
												BookingDaou d = new BookingDaou();
												ResultSet rs = d.getBookingRecordsByEmail((String)session.getAttribute("email"));
												while (rs.next())
												{
											%>
												<tr>
													<td><%= rs.getString(1) %></td>
													<td><%= rs.getString(2) %></td>
													<td><%= rs.getString(3) %></td>
													<td><%= rs.getString(6)+", "+rs.getString(7) %></td>
													<td><%= rs.getString(5) %></td>
													<td><%= rs.getString(11) %></td>
													<td><%= rs.getString(12) %></td>
													<td><%= rs.getString(14) %></td>
													<td><b>&#8377; </b><%= rs.getString(18) %></td>
												</tr>
											<% 
												}
											%>
												<!-- 		  
								<tr>
									<td><input type="checkbox" value="option1"></td>
									<td><a href="movie_detail.jsp"><img alt="" src="themes/images/ladies/1.jpg"></a></td>
									<td>Luctus quam ultrices rutrum</td>
									<td><input type="text" placeholder="2" class="input-mini"></td>
									<td>$1,150.00</td>
									<td>$2,450.00</td>
								</tr>
								<tr>
									<td><input type="checkbox" value="option1"></td>
									<td><a href="movie_detail.jsp"><img alt="" src="themes/images/ladies/3.jpg"></a></td>
									<td>Wuam ultrices rutrum</td>
									<td><input type="text" placeholder="1" class="input-mini"></td>
									<td>$1,210.00</td>
									<td>$1,123.00</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td><strong>$3,600.00</strong></td>
								</tr>	
								-->
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle center" data-toggle="collapse"
								data-parent="#accordion2" href="#collapseThree">FeedBack</a>
						</div>
						<div id="collapseThree" class="accordion-body collapse">
							<div class="accordion-inner">
								<div class="row-fluid">
									<div class="control-group">
										<label for="textarea" class="control-label">Comments</label>
										<div class="controls">
											<textarea rows="3" id="textarea" class="span12"></textarea>
										</div>
									</div>
									<button class="btn btn-inverse pull-right">Confirm</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<section id="footer-bar">
	<div class="row">
		<div class="span3">
			<h4>Navigation</h4>
			<ul class="nav">
				<li><a href="./index.jsp">Homepage</a></li>
				<li><a href="./about.jsp">About Us</a></li>
				<li><a href="./contact.jsp">Contact Us</a></li>
				<%
					if (session.getAttribute("user") == null || session.getAttribute("user") == "") {
				%>
				<li><a href="#myModal" data-toggle="modal"
					data-target="#myModal">Login</a></li>
				<%
					} else {
				%>
				<li><a href="UlogOut" id="LogOut">LogOut</a></li>
				<%
					}
				%>
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
			<p class="logo">
				<img src="themes/images/logo.png" class="site_logo" alt="">
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