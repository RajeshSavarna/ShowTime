<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
	<head>
		<title>Perspective Seat Preview | Codrops</title>
		<link rel="shortcut icon" href="favicon.ico">
		<link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<script src="js/modernizr-custom.js"></script>
		<script src="js/jquery-1.7.2.min.js"></script>
	</head>
	<body>
	
		<%@ page import="daou.ShowDaou" %>
		<%@ page import="bean.ShowBean"%>
		<% 
		ShowDaou d = new ShowDaou();
		ShowBean  b = new ShowBean();
		b = d.getShowRecordById(request.getParameter("show_id"));
		%>
		
		<header class="header">
			<div class="codrops-links">
				<a class="codrops-icon codrops-icon--prev" href="javascript:history.back()" title="Previous Page"><span>Previous Demo</span></a>
				<a class="codrops-icon codrops-icon--drop" href="../index.jsp" title="HomePage"><span>Back to the ShowTime HomePage</span></a>
			</div>
			<h1 class="header__title">Cinema Seat Preview</h1>
			<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
			
			<table class="header__title" align="center">
			<tr class="codrops-links"><td></td></tr> <tr class="codrops-links"><td></td></tr>
			
			<tr class="codrops-links">
				<td><b><% out.print(b.getShow_date());%></b></td>
			</tr>

			<tr class="codrops-links">
				<td><b>Price: <% out.print(b.getPrice());%></b></td>
			</tr>
			</table>
			
			<p class="note note--screen">Please view on a larger screen</p>
			<p class="note note--support">Sorry, but your browser doesn't support preserve-3d!</p>
		</header>
		
		
		<div class="container">
			<div class="cube">
				<div class="cube__side cube__side--front"></div>
				<div class="cube__side cube__side--back">
					<div class="screen">
						<div class="video">
							<video class="video-player" src="media/sintel.mp4" preload="auto" poster="media/sintel.jpg">
								<source src="media/sintel.ogg" type='video/ogg; codecs="theora, vorbis"'>
								<source src="media/sintel.mp4" type='video/mp4; codecs="avc1.4D401E, mp4a.40.2"'>
								<p>Sorry, but your browser does not support this video format.</p>
							</video>
							<button class="action action--play action--shown" aria-label="Play Video"></button>
						</div>
						<div class="intro intro--shown">
							<div class="intro__side">
								<h2 class="intro__title">
									<span class="intro__up">The ShowTime <em>presents 3D SeatView</em></span>
									<span class="intro__down"><span class="intro__partial"><em>of </em></span> Theatre Seats </span>
								</h2>
							</div>
							<div class="intro__side">
								<button class="action action--seats">Select your seats</button>
							</div>
						</div>
					</div>
				</div>
				<div class="cube__side cube__side--left"></div>
				<div class="cube__side cube__side--right"></div>
				<div class="cube__side cube__side--top"></div>
				<div class="rows rows--large">
					  <% 
				      for(char i='A'; i<='R'; i++){ 
				    	  %> <div class="row"> <% 
				    	  for(int j=1; j<=18; j++){ 
				    		  %> <div data-seat="<%= i+""+j %>" class="row__seat"></div> <%
				          }
				    	  %> </div> <%
				      } 
					  %>
				</div> <!-- /rows -->
			</div> <!-- /cube -->
		</div> <!-- /container -->
		<div class="plan">
			<h3 class="plan__title">Seating Plan</h3>
			<div class="rows rows--mini">
				
				<%
				String booked_seat = b.getBooked_seat();
				String seatNumber = "";
				for(char i='A'; i<='R'; i++){
					%> <div class="row"> <% 
				    for(int j=1; j<=18; j++){
				    	seatNumber = i+""+j+" ";
				    	if (!booked_seat.contains(seatNumber)){
				    		%> <div class="row__seat tooltip" data-tooltip="<%= seatNumber %>" value="<%= seatNumber %>"></div> <%
				    	}//add class="row__seat--selected" after selection
				    	else %> <div class="row__seat row__seat--reserved"></div> <%
				    }
				    %> </div> <%
				} 
				%>
			</div> <!-- /rows -->
			<ul class="legend">
				<li class="legend__item legend__item--free">Free</li>
				<li class="legend__item legend__item--reserved">Reserved</li>
				<li class="legend__item legend__item--selected">Selected</li>
			</ul>
			<button class="action action--buy" id="btn">Buy tickets</button>
		</div><!-- /plan -->
		<button class="action action--lookaround action--disabled" arial-label="Unlook View"></button>
		<script src="js/classie.js"></script>
		<script src="js/main.js"></script>
		<script src="js/jquery.redirect.js"></script>
		<script>
		$(function(){
			$('#btn').click(function(){
				var selected_seat = '';
				var show_id = <%=  request.getParameter("show_id") %>;
				/*var selected_seats = $(".row__seat--reserved");
				for ( var i=0; i<selected_seats; i++){
					alert($(selected_seats[i]).val());
				};*/
				/*var ar = $('.row__seat--reserved').map(function(){
					return this.value;
				}).get();*/
				
				$('.row__seat--selected').each(function(i){
					var sv = $(this).attr('value');
					selected_seat += sv;
				});
				if(selected_seat != '') {
					alert(selected_seat+'seats selected proceed to pay');
			    	$.redirect("../payment.jsp",{ show_id : show_id, selected_seat : selected_seat});
				}
				else alert('select atleast 1 seat to proceed');
			});
		});
		</script>
	</body>
</html>