<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Showtime</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<!--[if ie]><meta content='IE=8' http-equiv='X-UA-Compatible'/><![endif]-->
<!-- icon -->
<link rel="shortcut icon" href="themes/images/icon.png">
<!-- bootstrap -->
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">

<link href="themes/css/bootstrappage.css" rel="stylesheet" />

<link href="themes/css/copy.css" rel="stylesheet">
<link href="themes/css/icomoon.css" rel="stylesheet">

<!-- global styles -->
<link href="themes/css/flexslider.css" rel="stylesheet" />
<link href="themes/css/main.css" rel="stylesheet" />
<link href="themes/css/style1.css" rel="stylesheet" type="text/css"
	media="all" />

<!-- scripts -->
<script src="themes/js/jquery-1.7.2.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="themes/js/superfish.js"></script>
<script src="themes/js/jquery.scrolltotop.js"></script>
<script src="themes/js/jquery.redirect.js"></script>
<script src='themes/js/state.js'></script>

<!-- datatable -->
<link rel="stylesheet" type="text/css"
	href="./bootstrap/dt/DT_bootstrap.css">
<script type="text/javascript" charset="utf-8"
	src="./bootstrap/dt/jquery.dataTables.js"></script>
<script type="text/javascript" charset="utf-8"
	src="./bootstrap/dt/DT_bootstrap.js"></script>

<!--[if lt IE 9]>			
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
			<script src="js/respond.min.js"></script>
		<![endif]-->
<script type="text/javascript">
function myAccountPage(){
	<% if(session.getAttribute("user")==null || session.getAttribute("user")==""){ %>
	alert("Login First To View Your Account Details");
	$('#myModal').modal('show');
	<% } else{ %>
	document.location.href = "myAccount.jsp";
	<% } %>
}
</script>
</head>
<body>
	<div id="top-bar" class="container">
		<div class="row">
			<div class="span4">
				<form method="POST" class="search_form">
					<input type="text" class="input-block-level search-query"
						Placeholder="eg. Avengers">
				</form>
			</div>
			<div class="span8">
				<div class="account pull-right">
					<ul class="user-menu">
						<li><a href="mailto:info@showtime.com">info@showtime.com</a></li>
						
						<% if(session.getAttribute("city")==null || session.getAttribute("city")==""){ %>
						<li><i class="icon icon-map-marker" style="font-size:0px"></i>
						<a href="#myModal1" data-toggle="modal"
							data-target="#myModal1" id="region"> Select Your Region</a></li>
						<% } else{ %>
						<li><i class="icon icon-map-marker" style="font-size:0px"></i>
						<a href="#myModal1" data-toggle="modal"
							data-target="#myModal1" id="region"> <%= session.getAttribute("city") %></a></li>
						<% } %>
							
						<li><a href="javascript:myAccountPage()">Your Account</a></li>
						<% if(session.getAttribute("user")==null || session.getAttribute("user")==""){ %>
						<li><a href="#myModal" data-toggle="modal"
							data-target="#myModal">Login</a></li>
						<% } else{ %>
						<li><a href="" id="LogOut">LogOut</a></li>
						<% } %>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="myModal1" tabindex="-2" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<!-- 
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title text-center" id="myModalLabel1">Select Your Region</h4>
				</div>
				 -->
				<div class="modal-body">
					<div class='resp_code frms'>
						<div style="margin-bottom:10px;">
						<h5 align='center'>
							<font style='font: 1em/1.3em Tahoma, Geneva, sans-serif;'>
								<b>Select Your Region</b>
							</font>
						</h5>
						</div>
						<div id="selection">
							<select id="listBox1" onchange='selct_district(this.value)'></select>
							<select id='secondlist1'></select>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$('#secondlist1').change(function() {
			//alert(location.hostname+' asked to \nPress ok if '+this.value+' is Your Selected Region');
			var res = confirm(this.value + ' is Your Selected Region');
			if (res == true) {
				txt = $('#myModal1').modal('hide');
				$('#region').text(this.value);
				//$.redirect("SetSession",{city : this.value},"GET");
				$.ajax({
				       url: 'SetSession',
				       data: {city : this.value},
				       success: function(response) {
				    	   //location.reload(true);
				    	   //alert("Hello "+this.value+" is updated");
				       } 
				    });
			}
		});
	</script>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title text-center" id="myModalLabel">Don't
						Wait, Login now!</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-8"
							style="border-right: 1px dotted #C2C2C2; padding-right: 20px; padding-left: 30px;">
							<!-- Nav tabs -->
							<ul class="nav nav-tabs">
								<li class="active"><a  id="loginTab" href="#Login" data-toggle="tab">Login</a></li>
								<li><a href="#Registration" data-toggle="tab">Registration</a></li>
							</ul>
							<!-- Tab panes -->
							<div class="tab-content">
								<div class="tab-pane active" id="Login">
									<div class="row">
										<form class="form-horizontal" id="formLogin">
											<fieldset>
												<div class="control-group">
													<label class="control-label" for="username">Email</label>
													<div class="controls">
														<input type="email" name="username"
															placeholder="" class="input-xlarge" required>
													</div>
												</div>
												<div class="control-group">
													<label class="control-label" for="password">Password</label>
													<div class="controls">
														<input type="password" name="password"
															placeholder="" class="input-xlarge" required>
													</div>
												</div>
												<div class="control-group">
													<div class="controls">
														<button class="btn btn-success" id="loginButton">Login</button>
													 
														<a class="btn btn-success" href="forgotPassword.jsp">Forgot Password</a>
													</div>
												</div>
											</fieldset>
										</form>
									</div>
								</div>
								<div class="tab-pane" id="Registration">
									<div class="row">
										<form class="form-horizontal" id="form1">
											<fieldset>

												<div class="control-group">
													<label class="control-label" for="Name">Name</label>
													<div class="controls">
														<select class="input-mini" name="title">
															<option>Mr.</option>
															<option>Ms.</option>
															<option>Mrs.</option>
														</select> <input type="text" name="name" pattern="[A-Za-z ]{3,}"
															class="input-large" placeholder="Name" required
															title="Name should contains only text and minimum character should be 3" />
													</div>
												</div>

												<div class="control-group">
													<label class="control-label" for="Gender">Gender</label>
													<div class="controls">
														<select class="input-xlarge" name="gender">
															<option>Male</option>
															<option>Female</option>
															<option>Others</option>
														</select>
													</div>
												</div>

												<div class="control-group">
													<label class="control-label" for="Email">Email</label>
													<div class="controls">
														<div class="input-prepend">
															<span class="add-on"><i class="icon-envelope" style="font-size:0px"></i></span>
															<input type="email" class="input-xlarge" name="email" pattern="[a-zA-Z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" placeholder="Email" required />
														</div>
													</div>
												</div>

												<div class="control-group">
													<label class="control-label" for="password">Password</label>
													<div class="controls">
														<input type="password" name="password"
															pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
															class="input-xlarge" id="password" placeholder="Password" required
															title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" />
													</div>
												</div>

												<div class="control-group">
													<label class="control-label" for="number">Number</label>
													<div class="controls">
														<div class="input-prepend">
															<span class="add-on">+91</span> <input type="text" name="mobile"
																class="input-large" pattern="[0-9]{10,10}"
																placeholder="Mobile" required
																title="Mobile number should be of 10 digits" />
														</div>
													</div>
												</div>

												<div class="control-group">
													<label class="control-label" for="Address">Address</label>
													<div class="controls">
														<input type="text" class="input-xlarge" name="address"
															placeholder="eg: h.no: B4, street: rahul nagar" required />
													</div>
												</div>

												<div class="control-group">
													<div class="controls">
														<div id="selection">
															<select class="input-medium" id="listBox" name="state"
																onchange='selct_district(this.value)' required></select>
															<select class="input-medium" id='secondlist' name="city" required></select>
														</div>
													</div>
												</div>

												<div class="control-group">
													<div class="controls">
														<button type='submit' class="btn btn-success" id="register">Register</button>
													</div>
												</div>

											</fieldset>
										</form>
									</div>
								</div>
							</div>
							<div id="OR" class="hidden-xs"></div>
						</div>
						<div class="col-md-2" style="padding-left: 50px;">
							<div class="row text-center sign-with">
								<div class="col-md-12">
									<h3 class="other-nw">Sign in with</h3>
								</div>
								<div class="col-md-12">
									<div class="btn-group btn-group-justified">
										<a href="#" class="btn btn-primary">Facebook</a> <a href="#"
											class="btn btn-danger"> Google +</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		//$('#myModal').modal('show');
		$(function () {
				$('#form1').submit(function (e) {
					e.preventDefault();
					var form = $('#form1').serialize();
					
					$.ajax({
					       type: 'POST',
					       url: 'RegisterUser',
					       data: form,
					       success: function(response) {
					    	   alert(response);
					    	   $('#loginTab').click();
					       } 
					    });
					
				});
				
				
				$('#formLogin').submit(function (e) {
					e.preventDefault();
					var form = $('#formLogin').serialize();
					$.ajax({
					       type: 'POST',
					       url: 'AuthenticateUser',
					       data: form,
					       success: function(response) {
					    	   alert(response);
					    	   $('#myModal').modal('hide');
					    	   location.reload();
					       } 
					    });
				});
				
				$('#LogOut').click(function (e) {
					e.preventDefault();
					<% /*
					response.setHeader("Cache-Control", "no-cache, no-store");
				    response.setHeader("Pragma", "no-cache");

					session.removeAttribute("user");
					session.invalidate(); */
					%>
					//location.reload(true);
					//$.redirect("LogOut","","GET");
					$.ajax({
						type: 'GET',
					       url: 'LogOut',
					       success: function(response) {
					    	   alert(response);
					    	   location.reload(true);
					       } 
					    });
				});
			});
	</script>
	
	<div id="wrapper" class="container">
		<section class="navbar main-menu">
			<div class="navbar-inner main-menu">
				<a href="index.jsp" class="logo pull-left"><img
					src="themes/images/logo.png" class="site_logo" alt="ShowTime"></a>
				<nav id="menu" class="pull-right">
					<ul>
						<li><a href="./products.jsp">Movies</a>
							<ul>
								<li><a href="./products.jsp?language=English">English</a></li>
								<li><a href="./products.jsp?language=Hindi">Hindi</a></li>
							</ul></li>
						<li><a href="#">Sport</a>
							<ul>
								<li><a href="#">Cricket</a></li>
								<li><a href="#">Football</a></li>
								<li><a href="#">Hockey</a></li>
							</ul></li>
						<li><a href="#">Events</a></li>
						<li><a href="#">Offers</a></li>
						<li><a href="#">Parks</a></li>
					</ul>
				</nav>
			</div>
		</section>