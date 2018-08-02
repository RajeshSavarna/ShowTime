<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@include file="header.jsp"%>
			<section class="main-content">	
			<div class="row">
			<div class="span4">
				<div class="payment-right">
					<h3>Ticket Summary</h3>
					<h6><span>Movie-Name:</span>Baahubali</h6>
					<p><span>Theatre:</span> Lorem Ipsum </p>
					<p><span>Lake:</span> Kerala</p>
					<p><span>Location:</span> Trivandrum, Trivandrum</p>
					<p><span>Date:</span> Sat, 8 Aug, 2015</p>
					<p><span>Time:</span> 11:30am</p>
					<p><span>Seat Info:</span> Balkani-s12(a)</p>
					<p><span>Qty:</span> 4</p>
					<h4><span>Total :</span>Rs. 150.00</h4>
					<p>+ (Internet handling fees : Rs. 42.00 (incl. of Service Tax))</p>
					<h5>Grand Total :Rs. 192.00</h5>
				</div>
				<div class="ticket-note">
					<h3>Note:</h3>
					<ol>
						<li><p>Registrations/Tickets once booked cannot be exchanged, cancelled or refunded.</p></li>
						<li><p>In case of Credit/Debit Card bookings, the Credit/Debit Card and Card holder must be present at the ticket counter while collecting the ticket(s).</p></li>
					</ol>
				</div>
			</div>


						 
		<div class="e-payment-section">
			<div class="span8 payment-left">
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
					<div class="span8">
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
														<input type="submit" class="go-to-pay" value="make payment">
						</div>
						<div id="tab2" class="tab-grid">
							<div class="row">
		                        <div class="span5">
		                            <img src="themes/images/paytm1.png" alt="Image Alternative text" title="Image Title">
		                            <p>Important: You will be redirected to PayTm's website to securely complete your payment.</p><a class="btn btn-primary">Checkout via PayTm</a>	
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
		                            <p>Important: You will be redirected to PayPal's website to securely complete your payment.</p><a class="btn btn-primary">Checkout via Paypal</a>	
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
		</section>	
			
			
			
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
    </body>
</html>