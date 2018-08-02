<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		pageEncoding="ISO-8859-1"%>

<%@include file="header.jsp"%>
<%@ page import="daou.ShowDaou" %>
<%@ page import="bean.BookingBean"%>
<% 
ShowDaou d = new ShowDaou();
BookingBean  b = new BookingBean();
b = d.getCompleteShowRecordsById(request.getParameter("show_id"));

String selected_seat = request.getParameter("selected_seat");
int seatCount = selected_seat.split(" ").length;
//System.out.println("Payment page: "+seatCount);
int seatCost = seatCount*Integer.parseInt(b.getPrice());
int tax = seatCount*18;
int total_cost = seatCost+tax;

//b.setSeat_number(selected_seat);
//b.setSeat_qty(seatCount);
//b.setT_cost(seatCost);
//b.setTax(tax);
//b.setTotal_cost(total_cost);
//b.setOrder_date(order_date);

%>
			<div class="fileBody">
			<section class="header_text sub">
			<img class="pageBanner" src="themes/images/pageBanner.png" alt="New products" >
				<!-- <h4><span>Check Out</span></h4> -->
			</section>	
			<section class="main-content">
				<div class="row">
					<div class="span12">
						<div class="accordion" id="accordion2">
							<div class="accordion-group">
								<div class="accordion-heading">
									<a class="accordion-toggle text-center" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">Checkout Options</a>
								</div>
								<div id="collapseOne" class="accordion-body in collapse">
									<div class="accordion-inner">
										<div class="row-fluid">
											<div class="span6">
												<h4>New Customer</h4>
												<p>By creating an account you will be able to shop faster, be up to date on an order's status, and keep track of the orders you have previously made.</p>
												<form action="" method="post">
													<fieldset>
														<label class="radio" for="register">
															<input type="radio" name="account" value="register" id="register" checked="checked">Register Account
														</label>
														<label class="radio" for="guest">
															<input type="radio" name="account" value="guest" id="guest">Guest Checkout
														</label>
														<br>
														<button class="btn btn-inverse" data-toggle="collapse" data-parent="#collapse2" id="submit-btn">Continue</button>
													</fieldset>
												</form>
												
												<div class="ticket-note">
													<h3>Note:</h3>
													<ol>
														<li><h6>Registrations/Tickets once booked cannot be exchanged, cancelled or refunded.</h6></li>
														<li><h6>In case of Credit/Debit Card bookings, the Credit/Debit Card and Card holder must be present at the ticket counter while collecting the ticket(s).</h6></li>
													</ol>
												</div>
											 </div>
											 <div class="span6">
											 	<div class="payment-right">
													<h3>Ticket Summary</h3>
													<h4><span>Movie-Name:</span> <%=b.getMovie_name()%> </h4>
													<h6><span>Theatre:</span> <%=b.getTheatre_name()%> </h6>
													<h6><span>Address:</span> <%=b.getAddress()%> </h6>
													<h6><span>City:</span> <%=b.getCity()+", "+b.getState()%> </h6>
													<h6><span>Date:</span> <%=b.getShow_date()%> </h6>
													<h6><span>Time:</span> <%=b.getShow_time()%></h6>
													<h6><span>Seat Info:</span> <%= selected_seat %></h6>
													<h6><span>Qty:</span> <%= seatCount %></h6>
													<h4><span>Total :</span>Rs. <%=b.getPrice()%>&#215;<%=seatCount%> = 
													<%= seatCost%>.00</h4>
													<p>+ (Internet handling fees : Rs. <%= tax %>.00 (incl. of Service Tax))</p>
													<h5>Grand Total :Rs. <%= total_cost %>.00</h5>
												</div>
												
											 <!-- 
												<h4>Returning Customer</h4>
												<p>I am a returning customer</p>
												<form action="#" method="post">
													<fieldset>
														<div class="control-group">
															<label class="control-label">Username</label>
															<div class="controls">
																<input type="text" placeholder="Enter your username" id="username" class="input-xlarge">
															</div>
														</div>
														<div class="control-group">
															<label class="control-label">Password</label>
															<div class="controls">
															<input type="password" placeholder="Enter your password" id="password" class="input-xlarge">
															</div>
														</div>
														<button class="btn btn-inverse">Continue</button>
													</fieldset>
												</form>
											 -->
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="accordion-group">
								<div class="accordion-heading" >
									<a id="ABC" class="accordion-toggle text-center" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">Account &amp; Billing Details</a>
								</div>
								<div id="collapseTwo" class="accordion-body collapse">
									<div class="accordion-inner">
										<div class="row-fluid">
										<div class="span5">
										<div class="confirm-details">
											<h3>Confirm Your Contact Details</h3>
											<input type="text" value="Email address" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email address';}">
											<input type="text" value="Mobile number" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Mobile number';}">
											<p><i>Your number will be used for transaction confirmations &amp; none of those painful promotions.</i></p>
											<div class="c-lang">
												<input type="checkbox" id="c1" name="cc">
												<label class="lang">International number?</label>
											</div>
											<div class="c-lang">
												<input type="checkbox" id="c1" name="cc">
												<label class="lang">Keep me updated on the latest in entertainment, offers and much more</label>
											</div>
										</div>
										</div>
										
										<div class="span7">
										<div class="e-payment-section">
										<div class="payment-left">
										<div class="payment-options">
											<h3>payment-options</h3>
											<div class="tabs-box">
											<div class="row">
											<ul class="tabs-menu booking-menu span3">
												<li><a href="#tab1">Debit/Credit Card</a></li>
												<li><a href="#tab2">PayTm Karo</a></li>
												<li><a href="#tab3">Net Banking</a></li>
												<li><a href="#tab4">PayPal</a></li>
											</ul>
									
											<div class="clearfix"> </div>
											<div class="span12">
											<div class="tab-grids event-tab-grids">
												<div id="tab1" class="tab-grid">
													<img src="themes/images/payment.png" alt="payment" />
													<input type="text" class="payment" value="Enter Your Card Number" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Enter Your Card Number';}">
													<input type="text" class="payment" value="Your Name On Card" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Your Name On Card';}">
													<p>Expiry:<select class="month">
																				<option value="">Select</option>
																				<option value="01">Jan</option>
																				<option value="02">Feb</option>
																				<option value="03">Mar</option>
																				<option value="04">Apr</option>
																				<option value="05">May</option>
																				<option value="06">Jun</option>
																				<option value="07">Jul</option>
																				<option value="08">Aug</option>
																				<option value="09">Sep</option>
																				<option value="10">Oct</option>
																				<option value="11">Nov</option>
																				<option value="12">Dec</option>
																			</select>
																			<select class="year">
																				<option value="">Year</option>
																				<option value="2015">2015</option><option value="2016">2016</option><option value="2017">2017</option><option value="2018">2018</option><option value="2019">2019</option><option value="2020">2020</option><option value="2021">2021</option><option value="2022">2022</option><option value="2023">2023</option><option value="2024">2024</option><option value="2025">2025</option><option value="2026">2026</option><option value="2027">2027</option><option value="2028">2028</option><option value="2029">2029</option><option value="2030">2030</option><option value="2031">2031</option><option value="2032">2032</option><option value="2033">2033</option><option value="2034">2034</option><option value="2035">2035</option><option value="2036">2036</option><option value="2037">2037</option><option value="2038">2038</option><option value="2039">2039</option><option value="2040">2040</option><option value="2041">2041</option><option value="2042">2042</option><option value="2043">2043</option><option value="2044">2044</option><option value="2045">2045</option><option value="2046">2046</option><option value="2047">2047</option><option value="2048">2048</option><option value="2049">2049</option><option value="2050">2050</option><option value="2051">2051</option><option value="2052">2052</option><option value="2053">2053</option><option value="2054">2054</option><option value="2055">2055</option><option value="2056">2056</option><option value="2057">2057</option><option value="2058">2058</option><option value="2059">2059</option><option value="2060">2060</option><option value="2061">2061</option><option value="2062">2062</option><option value="2063">2063</option><option value="2064">2064</option><option value="2065">2065</option><option value="2066">2066</option><option value="2067">2067</option><option value="2068">2068</option><option value="2069">2069</option><option value="2070">2070</option><option value="2071">2071</option><option value="2072">2072</option><option value="2073">2073</option><option value="2074">2074</option></select>
																				<input type="text" class="cvv" value="cvv" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'cvv';}">
																				</p>
																				<input type="submit" class="go-to-pay btn btn-primary" value="make payment">
												</div>
												<div id="tab2" class="tab-grid">
													<div class="row">
								                        <div class="span5">
								                            <img src="themes/images/paytm1.png" alt="Image Alternative text" title="Image Title">
								                            <p>Important: You will be redirected to PayTm's website to securely complete your payment.</p>
								                            <a class="btn btn-primary">Checkout via PayTm</a>	
								                        </div>
							                    	</div>
												</div>
												<div id="tab3" class="tab-grid">
													<img src="themes/images/netbank.png" alt="payment" />
										
													<p>Select Bank :
													<select class="year">
														<option value="">=== Other Banks ===</option>
														<option value="ALB-NA">Allahabad Bank NetBanking</option>
														<option value="ADB-NA">Andhra Bank</option>
														<option value="BBK-NA">Bank of Bahrain and Kuwait NetBanking</option>
														<option value="BBC-NA">Bank of Baroda Corporate NetBanking</option>
														<option value="BBR-NA">Bank of Baroda Retail NetBanking</option>
														<option value="BOI-NA">Bank of India NetBanking</option>
														<option value="BOM-NA">Bank of Maharashtra NetBanking</option>
														<option value="CSB-NA">Catholic Syrian Bank NetBanking</option>
														<option value="CBI-NA">Central Bank of India</option>
														<option value="CUB-NA">City Union Bank NetBanking</option>
														<option value="CRP-NA">Corporation Bank</option>
														<option value="DBK-NA">Deutsche Bank NetBanking</option>
														<option value="DCB-NA">Development Credit Bank</option>
														<option value="DC2-NA">Development Credit Bank - Corporate</option>
														<option value="DLB-NA">Dhanlaxmi Bank NetBanking</option>
														<option value="FBK-NA">Federal Bank NetBanking</option>
														<option value="IDS-NA">Indusind Bank NetBanking</option>
														<option value="IOB-NA">Indian Overseas Bank</option>
														<option value="ING-NA">ING Vysya Bank (now Kotak)</option>
														<option value="JKB-NA">Jammu and Kashmir NetBanking</option>
														<option value="JSB-NA">Janata Sahakari Bank Limited</option>
														<option value="KBL-NA">Karnataka Bank NetBanking</option>
														<option value="KVB-NA">Karur Vysya Bank NetBanking</option>
														<option value="LVR-NA">Lakshmi Vilas Bank NetBanking</option>
														<option value="OBC-NA">Oriental Bank of Commerce NetBanking</option>
														<option value="CPN-NA">PNB Corporate NetBanking</option>
														<option value="PNB-NA">PNB NetBanking</option>
														<option value="RSD-DIRECT">Rajasthan State Co-operative Bank-Debit Card</option>
														<option value="RBS-NA">RBS (The Royal Bank of Scotland)</option>
														<option value="SWB-NA">Saraswat Bank NetBanking</option>
														<option value="SBJ-NA">SB Bikaner and Jaipur NetBanking</option>
														<option value="SBH-NA">SB Hyderabad NetBanking</option>
														<option value="SBM-NA">SB Mysore NetBanking</option>
														<option value="SBT-NA">SB Travancore NetBanking</option>
														<option value="SVC-NA">Shamrao Vitthal Co-operative Bank</option>
														<option value="SIB-NA">South Indian Bank NetBanking</option>
														<option value="SBP-NA">State Bank of Patiala NetBanking</option>
														<option value="SYD-NA">Syndicate Bank NetBanking</option>
														<option value="TNC-NA">Tamil Nadu State Co-operative Bank NetBanking</option>
														<option value="UCO-NA">UCO Bank NetBanking</option>
														<option value="UBI-NA">Union Bank NetBanking</option>
														<option value="UNI-NA">United Bank of India NetBanking</option>
														<option value="VJB-NA">Vijaya Bank NetBanking</option>
													</select>
													</p>
													
													<input class="btn btn-primary" style="margin-left:100px" type="submit" value="Proceed Payment">
												</div>
												<div id="tab4" class="tab-grid">
													<div class="row">
								                        <div class="span5">
								                            <img src="themes/images/paypal.png" alt="Image Alternative text" title="Image Title">
								                            <p>Important: You will be redirected to PayPal's website to securely complete your payment.</p>
								                            <a class="btn btn-primary" id="PayPal">Checkout via Paypal</a>	
								                        </div>
							                    	</div>
												</div>
											</div>			
											</div>
											<div class="clearfix"> </div>
											</div>
										</div>
										</div>
										</div>
										</div>
										</div>
										<!-- 
											<div class="span6">
												<h4>Your Personal Details</h4>
												<div class="control-group">
													<label class="control-label">First Name</label>
													<div class="controls">
														<input type="text" placeholder="" class="input-xlarge">
													</div>
												</div>
												<div class="control-group">
													<label class="control-label">Last Name</label>
													<div class="controls">
														<input type="text" placeholder="" class="input-xlarge">
													</div>
												</div>					  
												<div class="control-group">
													<label class="control-label">Email Address</label>
													<div class="controls">
														<input type="text" placeholder="" class="input-xlarge">
													</div>
												</div>
												<div class="control-group">
													<label class="control-label">Telephone</label>
													<div class="controls">
														<input type="text" placeholder="" class="input-xlarge">
													</div>
												</div>
												<div class="control-group">
													<label class="control-label">Fax</label>
													<div class="controls">
														<input type="text" placeholder="" class="input-xlarge">
													</div>
												</div>
											</div>
											 -->
											 <!--  
											<div class="span6">
												<h4>Your Address</h4>
												<div class="control-group">
													<label class="control-label">Company</label>
													<div class="controls">
														<input type="text" placeholder="" class="input-xlarge">
													</div>
												</div>
												<div class="control-group">
													<label class="control-label">Company ID:</label>
													<div class="controls">
														<input type="text" placeholder="" class="input-xlarge">
													</div>
												</div>					  
												<div class="control-group">
													<label class="control-label"><span class="required">*</span> Address 1:</label>
													<div class="controls">
														<input type="text" placeholder="" class="input-xlarge">
													</div>
												</div>
												<div class="control-group">
													<label class="control-label">Address 2:</label>
													<div class="controls">
														<input type="text" placeholder="" class="input-xlarge">
													</div>
												</div>
												<div class="control-group">
													<label class="control-label"><span class="required">*</span> City:</label>
													<div class="controls">
														<input type="text" placeholder="" class="input-xlarge">
													</div>
												</div>
												<div class="control-group">
													<label class="control-label"><span class="required">*</span> Post Code:</label>
													<div class="controls">
														<input type="text" placeholder="" class="input-xlarge">
													</div>
												</div>
												<div class="control-group">
													<label class="control-label"><span class="required">*</span> Country:</label>
													<div class="controls">
														<select class="input-xlarge">
															<option value="1">Afghanistan</option>
															<option value="2">Albania</option>
															<option value="3">Algeria</option>
															<option value="4">American Samoa</option>
															<option value="5">Andorra</option>
															<option value="6">Angola</option>
														</select>
													</div>
												</div>
												<div class="control-group">
													<label class="control-label"><span class="required">*</span> Region / State:</label>
													<div class="controls">
														<select name="zone_id" class="input-xlarge">
															<option value=""> --- Please Select --- </option>
															<option value="3513">Aberdeen</option>
															<option value="3514">Aberdeenshire</option>
															<option value="3515">Anglesey</option>
															<option value="3516">Angus</option>
															<option value="3517">Argyll and Bute</option>
														</select>
													</div>
												</div>
											</div>
											-->
										</div>
									</div>
								</div>
							</div>
							<!-- 
							<div class="accordion-group">
								<div class="accordion-heading">
									<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree">Confirm Order</a>
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
											<button class="btn btn-inverse pull-right">Confirm order</button>
										</div>
									</div>
								</div>
							</div>
							-->
						</div>				
					</div>
				</div>
			</section>
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

		<script src="themes/js/common.js"></script>
		<script>
			$(document).ready(function(){
				$('#submit-btn').click(function(e){
					e.preventDefault();
					$('#ABC').click();
				});
			});
		</script>
		<script>
			$(document).ready(function() {
				$("#tab2").hide();
				$("#tab3").hide();
				$("#tab4").hide();
				$(".tabs-menu a").click(function(event){
					event.preventDefault();
					var tab=$(this).attr("href");
					$(".tab-grid").not(tab).css("display","none");
					$(tab).fadeIn("slow");
				});
			});
		</script>	
		<script>
		$(document).ready(function(){
			$('.btn.btn-primary').click(function(e){
			e.preventDefault();
			var selected_seat = '<%=selected_seat%>';
			var show_id = '<%=request.getParameter("show_id")%>';
			
		    $.ajax({
				type : "post",
				url : "UpdateBookedSeat",
				data: { show_id : show_id,
					selected_seat : selected_seat},
				success: function(response) {
						$.redirect("invoice.jsp",{selected_seat : selected_seat , show_id : show_id});
				}
			});
		});
		});
		</script>
    </body>
</html>