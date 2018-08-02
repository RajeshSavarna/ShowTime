<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@include file="header.jsp"%>
			<!-- 
			<section class="google_map">
				<iframe width="100%" height="300" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=74%2F6+Nguy%E1%BB%85n+V%C4%83n+Tho%E1%BA%A1i,+S%C6%A1n+Tr%C3%A0,+%C4%90%C3%A0+N%E1%BA%B5ng,+Vi%E1%BB%87t+Nam&amp;aq=0&amp;oq=74%2F6+Nguyen+Van+Thoai+Da+Nang,+Viet+Nam&amp;sll=37.0625,-95.677068&amp;sspn=41.546728,79.013672&amp;ie=UTF8&amp;hq=&amp;hnear=74+Nguy%E1%BB%85n+V%C4%83n+Tho%E1%BA%A1i,+Ng%C5%A9+H%C3%A0nh+S%C6%A1n,+Da+Nang,+Vietnam&amp;t=m&amp;ll=16.064537,108.24151&amp;spn=0.032992,0.039396&amp;z=14&amp;iwloc=A&amp;output=embed"></iframe>
			</section>
			<section class="header_text sub">
			<img class="pageBanner" src="themes/images/pageBanner.png" alt="New products" >
				<h4><span>Contact Us</span></h4>
			</section>
			-->
			<section class="header_text sub">
				<h4><span>Contact Us</span></h4>
			</section>
			<section class="main-content">				
				<div class="row">				
					<div class="span5" style="padding-left:20px">
						<div class="text-center">
							<h5>MAIN OFFICE IN MUZAFFARPUR</h5>
							<p><strong>Phone:</strong>&nbsp; 022 6144 5050<br>
							<strong>Fax:</strong>&nbsp;+04 (123) 456-7890<br>
							<strong>Email:</strong>&nbsp;<a href="#">info@showtime.com</a>								
							</p>
							<br/><br/><br/>
							<h5>SECONDARY OFFICE IN VIETNAM</h5>
							<p><strong>Phone:</strong>&nbsp;(113) 023-1125<br>
							<strong>Fax:</strong>&nbsp;+04 (113) 023-1145<br>
							<strong>Email:</strong>&nbsp;<a href="#">vietcuong_it@yahoo.com</a>					
							</p>
						</div>
					</div>
					<div class="span6">
						<form method="post" action="#" class="text-center">
							<fieldset>
								<div class="clearfix">
									<div class="input">
										<input tabindex="1" size="18" id="name" name="name" type="text" value="" class="input-xlarge" placeholder="Name">
									</div>
								</div>
								
								<div class="clearfix">
									<div class="input">
										<input tabindex="2" size="25" id="email" name="email" type="text" value="" class="input-xlarge" placeholder="Email Address">
									</div>
								</div>
								
								<div class="clearfix">
									<div class="input">
										<textarea tabindex="3" class="input-xlarge" id="message" name="body" rows="7" placeholder="Message"></textarea>
									</div>
								</div>
								
								<div class="actions">
									<button tabindex="3" type="submit" class="btn btn-inverse">Send message</button>
								</div>
							</fieldset>
						</form>
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
		<script src="themes/js/common.js"></script>		
    </body>
</html>