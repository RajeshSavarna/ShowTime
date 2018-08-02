
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@include file="header.jsp"%>
			<section class="header_text sub">
			<!-- <img class="pageBanner" src="themes/images/pageBanner.png" alt="New products" >  -->
				<h4><span>Movie Detail</span></h4>
			</section>
			<section class="main-content">				
				<div class="row">						
					<div class="span9">
						<div class="row" id="main">
							<div class="span4">
								<%@ page import="bean.MovieBean" %>
								<%@ page import="daou.MovieDaou" %>
											
								<%
												MovieBean b = new MovieBean();
												MovieDaou d = new MovieDaou();
												b = d.getMovieRecordsById(request.getParameter("id"));
												String picname=b.getImage();
												String newpicadd= picname.substring(picname.lastIndexOf('\\')+1,picname.length());
					
								%>	
								<a href="<%=b.getImage() %>" class="thumbnail" data-fancybox-group="group1" title="Poster"><img alt="" src="${pageContext.request.contextPath}/themes/images/movies/<%=newpicadd %>"></a>												
								<ul class="thumbnails small">								
									<li class="span1">
										<a href="<%=b.getTrailer_url() %>" class="thumbnail" data-fancybox-group="group1" title="Trailer Link"><img src="themes/images/trailer.jpg" alt=""></a>
									</li>		
									<!-- 						
									<li class="span1">
										<a href="themes/images/ladies/3.jpg" class="thumbnail" data-fancybox-group="group1" title="Description 3"><img src="themes/images/ladies/3.jpg" alt=""></a>
									</li>
									-->	
								</ul>
							</div>
							<div class="span5">
								<address>
									<strong>Movie Name:</strong> <span><%=b.getTitle() %></span><br>
									<strong>Genre:</strong> <span><%=b.getGenre() %></span><br>
									<strong>Language:</strong> <span><%=b.getLanguage() %></span><br>
									<strong>Director:</strong> <span><%=b.getDirector() %></span><br>	
									<strong>Duration:</strong> <span><%=b.getDuration() %></span><br>							
								</address>								
							</div>
							<div class="span5">
								<form class="form-inline" action="cinema.jsp" method="post">
									<p>&nbsp;</p>
									<button class="btn btn-inverse" type="submit" name="id" value="<%=b.getMovie_id()%>" >Book Ticket</button>
								</form>
							</div>							
						</div>
						<div class="row">
							<div class="span9">
								<ul class="nav nav-tabs" id="myTab">
									<li class="active"><a href="#home">Description</a></li>
									<li class=""><a href="#profile">Additional Information</a></li>
								</ul>							 
								<div class="tab-content">
									<div class="tab-pane active" id="home"><%=b.getDescription() %></div>
									<div class="tab-pane" id="profile">
										<table class="table table-striped shop_attributes">	
											<tbody>
												<tr class="">
													<th>Cast</th>
													<td><%=b.getCast() %></td>
												</tr>		
												<tr class="alt">
													<th>Certificate</th>
													<td><%=b.getCertificate() %></td>
												</tr>
												<tr class="alt">
													<th>Rating</th>
													<td><%=b.getRating() %></td>
												</tr>
												<tr class="alt">
													<th>Release Date</th>
													
													<td><%=b.getRelease_date() %></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>							
							</div>						
							<div class="span9">	
								<br>
								<h4 class="title">
									<span class="pull-left"><span class="text"><strong>PEOPLE</strong> WHO VIEWED THIS ALSO VIEWED</span></span>
									<span class="pull-right">
										<a class="left button" href="#myCarousel-1" data-slide="prev"></a><a class="right button" href="#myCarousel-1" data-slide="next"></a>
									</span>
								</h4>
								<div id="myCarousel-1" class="carousel slide">
									<div class="carousel-inner">
										<div class="active item">
											<ul class="thumbnails listing-products">
											
											<%@ page import="java.util.List" %>
											<%@ page import="java.util.ArrayList" %>
											<%
												List<MovieBean> list = new ArrayList<MovieBean>();
												list = d.getAllMovieRecords();
												int check = 0;
												for(MovieBean a:list){
													if (a.getMovie_id().equals(b.getMovie_id()))
														continue;
													picname=a.getImage();
													newpicadd= picname.substring(picname.lastIndexOf('\\')+1,picname.length());
											%>	
												<li class="span3">
													<div class="product-box">
														<span class="sale_tag"></span>												
														<a href="movie_detail.jsp?id=<%= a.getMovie_id() %>"><img src="${pageContext.request.contextPath}/themes/images/movies/<%=newpicadd %>" alt="" /></a><br/>
														<a href="movie_detail.jsp?id=<%= a.getMovie_id() %>" class="title"><%= a.getTitle() %></a><br/>
													</div>
												</li>
											<% 
												check++;
												if(check == 3)
													{
														check=0;
											%>
											</ul>
											</div>
											<div class="item">
											<ul class="thumbnails listing-products">
											<% 
													}
												}
											%>
											
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					
					<div class="span3 col">
						<div class="block">	
							<ul class="nav nav-list">
								<li class="nav-header">Movies in Your Region</li>
								<li><a href="products.jsp">Avengers</a></li>
								<li class="active"><a href="products.jsp">DeadPool</a></li>
							</ul>
							<br/>
							<ul class="nav nav-list below">
								<li class="nav-header">Theater in Your Region</li>
								<li><a href="products.jsp">Cinepolis</a></li>
								<li><a href="products.jsp">Carnival</a></li>
							</ul>
						</div>
						
						<div class="block">
							<h4 class="title">
								<span class="pull-left"><span class="text">Offers</span></span>
								<span class="pull-right">
									<a class="left button" href="#myCarousel" data-slide="prev"></a><a class="right button" href="#myCarousel" data-slide="next"></a>
								</span>
							</h4>
							<div id="myCarousel" class="carousel slide">
								<div class="carousel-inner">
									<div class="active item">
										<ul class="thumbnails listing-products">
											<li class="span3">
												<div class="product-box">
													<span class="sale_tag"></span>												
													<img alt="" src="themes/images/offer.jpg"><br/>
													<p class="title">50% CashBack</p><br/>
													<p class="category">Payments via PhonePay</p>
													<p class="price">maxcashBack 125rs</p>
												</div>
											</li>
										</ul>
									</div>
									<div class="item">
										<ul class="thumbnails listing-products">
											<li class="span3">
												<div class="product-box">												
													<img alt="" src="themes/images/offer1.jpg"><br/>
													<p class="title">Get Rs50 Cashback</p><br/>
													<p class="category">on 1st UPI transactions</p>
												</div>
											</li>
										</ul>
									</div>
									<div class="item">
										<ul class="thumbnails listing-products">
											<li class="span3">
												<div class="product-box">												
													<img alt="" src="themes/images/offer.png"><br/>
													<p class="title">Flat Rs150 CashBack</p><br/>
													<p class="category">&amp; a chance to meet Salman Khan</p>
													<p class="price">minimum 2 tickets</p>
												</div>
											</li>
										</ul>
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
		<script src="themes/js/common.js"></script>
		<script>
			$(function () {
				$('#myTab a:first').tab('show');
				$('#myTab a').click(function (e) {
					e.preventDefault();
					$(this).tab('show');
				})
			})
			$(document).ready(function() {
				$('.thumbnail').fancybox({
					openEffect  : 'none',
					closeEffect : 'none'
				});
				
				$('#myCarousel-2').carousel({
                    interval: 2500
                });								
			});
		</script>
    </body>
</html>