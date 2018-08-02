<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

			<%@ page import="java.util.List"%>
			<%@ page import="java.util.ArrayList"%>
			<%@ page import="bean.MovieBean"%>
			<%@ page import="daou.MovieDaou"%>
<%@include file="header.jsp"%>
<section class="header_text sub">
	<img class="pageBanner" src="themes/images/pageBanner.png"
		alt="New products">
	<h4>
		<span>Movies</span>
	</h4>
</section>
<section>

	<div class="row" style="margin-left:25px">
		<div class="row">
			<table cellpadding="10" cellspacing="10" border="0"
				class="table table-striped table-bordered" id="example">
			<thead><tr><td></td></tr></thead>
			<tbody>
			<%
				List<MovieBean> list = new ArrayList<MovieBean>();
				MovieDaou d = new MovieDaou();
				if (request.getParameter("language") == null || request.getParameter("language").equals(""))
					list = d.getAllMovieRecords();
				else list = d.getMovieRecordsByLanguage(request.getParameter("language"));
				for(MovieBean b:list){
					String picname=b.getImage();
					String newpicadd= picname.substring(picname.lastIndexOf('\\')+1,picname.length());
			%>
				<tr class="col-lg-2 col-md-2 col-sm-12">
					<td class="product-box" style="margin-bottom:15px">
						<a href="movie_detail.jsp?id=<%= b.getMovie_id() %>">
						<img src="${pageContext.request.contextPath}/themes/images/movies/<%=newpicadd %>" alt="" style="height:300px;"/>
						</a><br/> 
						<a href="movie_detail.jsp?id=<%= b.getMovie_id() %>" class="title"><%= b.getTitle() %></a><br />
					</td>
				</tr>
			<% 	
			}
			%>	
			</tbody>
			</table>
			<hr>
			<!-- 
			<div class="pagination pagination-small pagination-centered">
				<ul>
					<li><a href="#">Prev</a></li>
					<li class="active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">Next</a></li>
				</ul>
			</div>
			-->
		</div>
		<!-- <div class="span3 col">
			<div class="block">
				<ul class="nav nav-list">
					<li class="nav-header">SUB CATEGORIES</li>
					<li><a href="products.jsp">Nullam semper elementum</a></li>
					<li class="active"><a href="products.jsp">Phasellus
							ultricies</a></li>
					<li><a href="products.jsp">Donec laoreet dui</a></li>
					<li><a href="products.jsp">Nullam semper elementum</a></li>
					<li><a href="products.jsp">Phasellus ultricies</a></li>
					<li><a href="products.jsp">Donec laoreet dui</a></li>
				</ul>
				<br />
				<ul class="nav nav-list below">
					<li class="nav-header">MANUFACTURES</li>
					<li><a href="products.jsp">Adidas</a></li>
					<li><a href="products.jsp">Nike</a></li>
					<li><a href="products.jsp">Dunlop</a></li>
					<li><a href="products.jsp">Yamaha</a></li>
				</ul>
			</div>
			<div class="block">
				<h4 class="title">
					<span class="pull-left"><span class="text">Randomize</span></span>
					<span class="pull-right"> <a class="left button"
						href="#myCarousel" data-slide="prev"></a><a class="right button"
						href="#myCarousel" data-slide="next"></a>
					</span>
				</h4>
				<div id="myCarousel" class="carousel slide">
					<div class="carousel-inner">
						<div class="active item">
							<ul class="thumbnails listing-products">
								<li class="span3">
									<div class="product-box">
										<span class="sale_tag"></span> <img alt=""
											src="themes/images/ladies/1.jpg"><br /> <a
											href="movie_detail.jsp" class="title">Fusce id molestie
											massa</a><br /> <a href="#" class="category">Suspendisse
											aliquet</a>
										<p class="price">$261</p>
									</div>
								</li>
							</ul>
						</div>
						<div class="item">
							<ul class="thumbnails listing-products">
								<li class="span3">
									<div class="product-box">
										<img alt="" src="themes/images/ladies/2.jpg"><br /> <a
											href="movie_detail.jsp" class="title">Tempor sem sodales</a><br />
										<a href="#" class="category">Urna nec lectus mollis</a>
										<p class="price">$134</p>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="block">
				<h4 class="title">
					<strong>Best</strong> Seller
				</h4>
				<ul class="small-product">
					<li><a href="#" title="Praesent tempor sem sodales"> <img
							src="themes/images/ladies/3.jpg"
							alt="Praesent tempor sem sodales">
					</a> <a href="#">Praesent tempor sem</a></li>
					<li><a href="#" title="Luctus quam ultrices rutrum"> <img
							src="themes/images/ladies/4.jpg"
							alt="Luctus quam ultrices rutrum">
					</a> <a href="#">Luctus quam ultrices rutrum</a></li>
					<li><a href="#" title="Fusce id molestie massa"> <img
							src="themes/images/ladies/5.jpg" alt="Fusce id molestie massa">
					</a> <a href="#">Fusce id molestie massa</a></li>
				</ul>
			</div>
		</div> -->
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
<script src="themes/js/common.js"></script>
</body>
</html>