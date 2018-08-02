<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	if (session.getAttribute("admin") == null) {
		response.sendRedirect("admin_login.jsp");
		/*RequestDispatcher rd=request.getRequestDispatcher("admin_login.jsp");
		rd.include(request,response);*/
		out.println("Sorry you need to login first");

	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Showtime</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<!--[if ie]><meta content='IE=8' http-equiv='X-UA-Compatible'/><![endif]-->
<!-- icon -->
<link rel="shortcut icon" href="../themes/images/icon.png">
<!-- bootstrap -->
<link href="../bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="../bootstrap/css/bootstrap-responsive.min.css"
	rel="stylesheet">

<link href="../themes/css/bootstrappage.css" rel="stylesheet" />

<link href="../themes/css/copy.css" rel="stylesheet">
<link href="../themes/css/icomoon.css" rel="stylesheet">

<!-- global styles -->
<link href="../themes/css/flexslider.css" rel="stylesheet" />
<link href="../themes/css/main.css" rel="stylesheet" />
<link href="../themes/css/style1.css" rel="stylesheet" type="text/css"
	media="all" />

<!-- scripts -->
<script src="../themes/js/jquery-1.7.2.min.js"></script>
<script src="../bootstrap/js/bootstrap.min.js"></script>
<script src="../themes/js/superfish.js"></script>
<script src="../themes/js/jquery.scrolltotop.js"></script>
<script src="../themes/js/jquery.redirect.js"></script>
<script src='../themes/js/state.js'></script>

<!-- datatable -->
<link rel="stylesheet" type="text/css"
	href="../bootstrap/dt/DT_bootstrap.css">
<script type="text/javascript" charset="utf-8"
	src="../bootstrap/dt/jquery.dataTables.js"></script>
<script type="text/javascript" charset="utf-8"
	src="../bootstrap/dt/DT_bootstrap.js"></script>

<!-- datatime -->
<link href="../bootstrap/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" media="screen">
<!--[if lt IE 9]>			
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
			<script src="js/respond.min.js"></script>
		<![endif]-->
</head>
<body>

	<div id="wrapper" class="container">
		<section class="navbar main-menu">
			<div class="navbar-inner main-menu">
				<a href="index.jsp" class="logo pull-left"><img
					src="../themes/images/logo.png" class="site_logo" alt="ShowTime"></a>
				<nav id="menu" class="pull-right">
					<ul>
						<li><a href="view_movie.jsp">Movies</a></li>
						<li><a href="view_theater.jsp">Theater</a></li>
						<li><a href="view_show.jsp">Show</a></li>
						<li><a href="view_bookings.jsp">Bookings</a></li>
						<li><a href="view_customer.jsp">Customer</a></li>
						<li><a href="../Admin_Logout">Logout</a></li>
					</ul>
				</nav>
			</div>
		</section>