<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@include file="header.jsp"%>
				<section  class="homepage-slider" id="home-slider">
				<div class="flexslider">
					<ul class="slides">
						<li>
							<img src="themes/images/carousel/banner-1.jpg" alt="" />
						</li>
						<li>
							<img src="themes/images/carousel/banner-2.jpg" alt="" />
							<div class="intro">
							<!-- 
								<h1>Mid season offer</h1>
								<p><span>Up to 50% Cashback</span></p>
								<p><span>and win a Deadpool shirt</span></p>
							 -->
							</div>
						</li>
						<li>
							<img src="themes/images/carousel/banner-3.jpg" alt="" />
						</li>
					</ul>
				</div>			
			</section>
			<section class="header_text">
				Showtime offers movie tickets, reviews, trailers, concert tickets and events near you . Also features promotional offers and coupons. 
				<br/>Don't miss to use our cheap and best portal to buy the tickets.
			</section>
			<section class="main-content">
				<div class="row">
					<div class="span12">													
						<div class="row">
							<div class="span12">
								<h4 class="title">
									<span class="pull-left"><span class="text"><span class="line">Now <strong>Showing</strong></span></span></span>
									<span class="pull-right">
										<a class="left button" href="#myCarousel" data-slide="prev"></a><a class="right button" href="#myCarousel" data-slide="next"></a>
									</span>
								</h4>
								<div id="myCarousel" class="myCarousel carousel slide">
									<div class="carousel-inner">
										<div class="active item">
											<ul class="thumbnails">	
											
											<%@ page import="java.util.List" %>
											<%@ page import="java.util.ArrayList" %>
											<%@ page import="bean.MovieBean" %>
											<%@ page import="daou.MovieDaou" %>
											<%@ page import="daou.ShowDaou" %>
											<%@ page import="java.util.Arrays" %>
											<%
												ShowDaou da = new ShowDaou();
												String m[] = da.getShowingMovieId().split(" ");
												List<MovieBean> list = new ArrayList<MovieBean>();
												MovieDaou d = new MovieDaou();
												list = d.getAllMovieRecords();
												int check = 0;
												for(MovieBean b:list){
													if (!Arrays.asList(m).contains(b.getMovie_id()))
														continue;
													String picname=b.getImage();
													String newpicadd= picname.substring(picname.lastIndexOf('\\')+1,picname.length());
											%>											
												<li class="span3">
													<div class="product-box">
														<span class="sale_tag"></span>
														<p><a href="movie_detail.jsp?id=<%= b.getMovie_id() %>"><img src="${pageContext.request.contextPath}/themes/images/movies/<%=newpicadd %>" alt="" /></a></p>
														<a href="movie_detail.jsp?id=<%= b.getMovie_id() %>" class="title"><%= b.getTitle() %></a><br/>
														
													  
													
													   <!-- 
													   <form action="movie_detail.jsp">
													   <p><input type="image" name="moviename" value="<%=b.getImage() %>"><img src="<%=b.getImage() %>" alt="" /></a></p>
													   <input type="submit" class="title"  name="moviename" value="<%=b.getTitle()%>">
													   </form>
													   -->
													</div>
												</li>
											<% 
												check++;
												if(check == 4)
													{
														check=0;
											%>
											</ul>
											</div>
											<div class="item">
												<ul class="thumbnails">	
														
											<% 													}
												} 
											%>			
											</ul>
										</div>
									</div>							
								</div>
							</div>						
						</div>
						<br/>
						<div class="row">
							<div class="span12">
								<h4 class="title">
									<span class="pull-left"><span class="text"><span class="line">Upcoming <strong>Movies</strong></span></span></span>
									<span class="pull-right">
										<a class="left button" href="#myCarousel-2" data-slide="prev"></a><a class="right button" href="#myCarousel-2" data-slide="next"></a>
									</span>
								</h4>
								<div id="myCarousel-2" class="myCarousel carousel slide">
									<div class="carousel-inner">
										<div class="active item">
											<ul class="thumbnails">	
											
											<%
												check = 0;
												for(MovieBean b:list){
													if (Arrays.asList(m).contains(b.getMovie_id()))
														continue;
													String picname=b.getImage();
													String newpicadd= picname.substring(picname.lastIndexOf('\\')+1,picname.length());
											%>											
												<li class="span3">
													<div class="product-box">
														<span class="sale_tag"></span>
														<p><a href="movie_detail.jsp?id=<%= b.getMovie_id() %>"><img src="${pageContext.request.contextPath}/themes/images/movies/<%=newpicadd %>" alt="" /></a></p>
														<a href="movie_detail.jsp?id=<%= b.getMovie_id() %>" class="title"><%= b.getTitle() %></a><br/>
														
													  
													
													   <!-- 
													   <form action="movie_detail.jsp">
													   <p><input type="image" name="moviename" value="<%=b.getImage() %>"><img src="<%=b.getImage() %>" alt="" /></a></p>
													   <input type="submit" class="title"  name="moviename" value="<%=b.getTitle()%>">
													   </form>
													   -->
													</div>
												</li>
											<% 
												check++;
												if(check == 4)
													{
														check=0;
											%>
											</ul>
											</div>
											<div class="item">
												<ul class="thumbnails">	
														
											<% 													}
												} 
											%>			
											</ul>
										</div>
									</div>							
								</div>
							</div>						
						</div>
						<div class="row feature_box">						
							<div class="span4">
								<div class="service">
									<div class="responsive">	
										<img src="themes/images/feature_img_1.png" alt="" />
										<h4><strong>Offers</strong></h4>
										<p>Delight yourself with crazy offers while you book your tickets. Whether its cashback, freebies or discounts you're after, there's a can't-miss bargain for every single one of you.</p>									
									</div>
								</div>
							</div>
							<div class="span4">	
								<div class="service">
									<div class="customize">			
										<img src="themes/images/feature_img_1.png" alt="" />
										<h4><strong>GIFTS</strong></h4>
										<p>With GiftMyShow cards, you can gift your friends &amp; family movie &amp; play tickets, concert passes, whatever it is they love for their birthdays, anniversaries or simply for no reason other than how you feel about them. Pretty sweet, aint it?.</p>
									</div>
								</div>
							</div>
							<div class="span4">
								<div class="service">
									<div class="support">	
										<img src="themes/images/feature_img_3.png" alt="" />
										<h4>24/7 LIVE <strong>SUPPORT</strong></h4>
										<p>Ph. 022 6144 5050, 022 3989 5050.</p>
									</div>
								</div>
							</div>	
						</div>		
					</div>				
				</div>
			</section>
				<section class="our_client">
				<h4 class="title"><span class="text">Manufactures</span></h4>
				<div class="row">					
					<div class="span2">
						<a href="#"><img alt="" src="themes/images/clients/5.png"></a>
					</div>
					<div class="span2">
						<a href="#"><img alt="" src="themes/images/clients/6.png"></a>
					</div>
					<div class="span2">
						<a href="#"><img alt="" src="themes/images/clients/1.png"></a>
					</div>
					<div class="span2">
						<a href="#"><img alt="" src="themes/images/clients/2.png"></a>
					</div>
					<div class="span2">
						<a href="#"><img alt="" src="themes/images/clients/3.png"></a>
					</div>
					<div class="span2">
						<a href="#"><img alt="" src="themes/images/clients/4.png"></a>
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
		<script src="themes/js/jquery.flexslider-min.js"></script>
		<script type="text/javascript">
			$(function() {
				$(document).ready(function() {
					$('.flexslider').flexslider({
						animation: "fade",
						slideshowSpeed: 4000,
						animationSpeed: 600,
						controlNav: false,
						directionNav: true,
						controlsContainer: ".flex-container" // the container that holds the flexslider
					});
				});
			});
		</script>
    </body>
</html>