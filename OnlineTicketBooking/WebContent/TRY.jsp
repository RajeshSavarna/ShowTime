<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@include file="header.jsp"%>
<%@ page import="daou.ShowDaou" %>

<script src="themes/js/common.js"></script>
		<script>
			var str,m_id;
			$(function () {
				$('#myTab a:first').tab('show');
				$('#myTab a').click(function (e) {
					
					e.preventDefault();
					$(this).tab('show');
					
					str = $('#myTab li.active').text();
					var m_id = <%= request.getParameter("id") %> ;
					//alert(m_id);
					//alert(str);
					//document.getElementById("abcd").innerHTML = str;
					
					
					//window.location.replace("NewFile1.jsp?ida="+str);
					//var pathname = window.location.pathname;
					//$('.nav > li > a[href = " '+pathname+' "]').parent().addClass('active');
					//AJAX.send("date = "encodeURIComponent(str));
					//$.ajax.send("date = "encodeURIComponent(str));
					/*
					 $.ajax({
					       type: 'POST',
					       url: 'NewFile1.jsp',
					       data: { date : str},
					    }).success(function(response) {
					       //alert(response);
					    });
					*/
					
					$.ajax({
					       type: 'POST',
					       url: 'Timing.jsp',
					       data: { date : str,
					    	   		id : m_id},
					       success: function(response) {
					    	   $('#timing').html(response);
					       }
					       
					    });
					
					//ajaxFunction();
				});
			});
			
			
			function ajaxFunction()
			{
				var xmlHttp;
			try
			  {  // Firefox, Opera 8.0+, Safari 
			   xmlHttp=new XMLHttpRequest();
			  }
			catch (e)
			  {  // Internet Explorer 
			   try
			    {    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");    }
			  catch (e)
			    {    try
			      {      xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");      }
			    catch (e)
			      {      alert("Your browser does not support AJAX!");      return false;      }    }  }
			  xmlHttp.onreadystatechange=function()
			    {
				   //alert("i m  not  in ready state");
				   
				    if(xmlHttp.readyState==0)
			      {
			      //document.myForm.time.value=xmlHttp.responseText;
				   // alert("The request is not initialized");
				  
			      }
				      if(xmlHttp.readyState==1)
			      {
			      //document.myForm.time.value=xmlHttp.responseText;
				   // alert("The request has been set up");
				  
			      }
				  
				        if(xmlHttp.readyState==2)
			      {
			      //document.myForm.time.value=xmlHttp.responseText;
				   // alert("The request has been sent");
				  
				  
			      }
				  
				  	        if(xmlHttp.readyState==3)
			      {
			      //document.myForm.time.value=xmlHttp.responseText;
				  //  alert("The request is in process");
				 
			      }
				   
			    if(xmlHttp.readyState==4)
			      {
			      //document.myForm.time.value=xmlHttp.responseText;
				    //alert("i m in ready state");
				  
				   document.getElementById("theResponse").innerHTML = xmlHttp.responseText;
				   
				  
			      }
			    }
				      var tab= $('#myTab li.active').text();
				      var url="NewFile1.jsp";
			          url=url+"?date="+tab+"&id=1";
			          //url=url+"&sid="+Math.random();
			          alert(url);
				
				  
			         xmlHttp.open("GET",url,true);
			         xmlHttp.send(null); 
			   }
			
		</script>

			<section class="header_text sub">
			<img class="pageBanner" src="themes/images/pageBanner.png" alt="New products" >
				<h4><span>Show Timing Detail</span></h4>
			</section>
			
			<section class="main-content" id="main">
			<div class="row">
							<div class="span9">
								<ul class="nav nav-tabs navbar-nav navbar-center" id="myTab" style="text-align:center;">
								
								<%@ page import="java.util.List" %>
								<%@ page import="java.util.ArrayList" %>
								<%
								//System.out.println(request.getParameter("id"));
								List<String> list = new ArrayList<String>();
								ShowDaou d = new ShowDaou();
								list = d.getShowRecordsByQuery("SELECT DISTINCT TO_CHAR(show_date, 'DD/MON') dt "+
																"FROM SHOW_DETAIL WHERE movie_id ='"+request.getParameter("id")+"' "+
																"order by dt");
								int i =0 ;
								for(String str:list){
								%>
									<li class="" ><a href="#time" class="" ><%= str %></a></li>
								
								<%
								}
								%>
								
								</ul>							 
								<div class="tab-content">
									<div class="tab-pane" id="time">
										<table class="table table-striped shop_attributes" style = "text-align: center">	
											<tbody id="timing" class = "text-center">
											
											</tbody>
										</table>
										
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
		<!-- 
		<script src="themes/js/common.js"></script>
		<script>
			var str;
			$(function () {
				$('#myTab a:first').tab('show');
				$('#myTab a').click(function (e) {
					
					e.preventDefault();
					$(this).tab('show');
					
					var string = $('#myTab li.active').text();
					document.getElementById("abcd").innerHTML = string;
					str=string;
				})
			})
			
		</script>
		 -->
    </body>
</html>