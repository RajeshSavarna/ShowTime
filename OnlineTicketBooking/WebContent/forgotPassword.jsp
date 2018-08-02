<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@include file="header.jsp"%>
<%@ page import="daou.UserDaou"%>
<%@ page import="bean.UserBean"%>
<%
	if (session.getAttribute("user") != null) {
		response.sendRedirect("index.jsp");
	}
%>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
body {
	background-color: #f1f1f1;
}

#regForm {
	background-color: #ffffff;
	margin: 0px auto;
	padding: 40px;
	width: 70%;
	min-width: 300px;
}

.i1 {
	padding: 0px;
	width: 40%;
	min-height: 30px;
	font-size: 17px;
	border: 1px solid #aaaaaa;
	text-align: center;
	margin-left: 30%;
	margin-right: 30%;
	font-size: 17px;
}

/* Mark input boxes that gets an error on validation: */
input.invalid {
	background-color: #ffdddd;
}

/* Hide all steps by default: */
.tab {
	display: none;
}

button {
	background-color: #4CAF50;
	color: #ffffff;
	border: none;
	padding: 10px 20px;
	font-size: 17px;
	cursor: pointer;
}

button:hover {
	opacity: 0.8;
}

#prevBtn {
	background-color: #bbbbbb;
}

/* Make circles that indicate the steps of the form: */
.step {
	height: 15px;
	width: 15px;
	margin: 0 2px;
	background-color: #bbbbbb;
	border: none;
	border-radius: 50%;
	display: inline-block;
	opacity: 0.5;
}

.step.active {
	opacity: 1;
}

/* Mark the steps that are finished and valid: */
.step.finish {
	background-color: #4CAF50;
}
</style>
<body>

	<form id="regForm" action="">
		<h3 class="center">Recover Your Password:</h3>
		<!-- One "tab" for each step in the form: -->
		<div class="tab">
			<!-- <p class="center">${param.response} </p>  -->
			<p>
				<input type="email" placeholder="Enter Your E-mail..." name="email"
					class="i1" required>
			</p>
		</div>
		<div class="tab">
			<p>
				<input type="text" placeholder="Verify Your Name..." name="name"
					class="i1" required>
			</p>
			<p>
				<input type="text" placeholder="Verify Your Phone..." name="phone"
					class="i1" required>
			</p>
		</div>
		<div class="tab" id="selection">
			<p class="center">Enter Your City And State Name For Final
				Verification</p>
			<p>
				<select id="listBox1" onchange='selct_district(this.value)'
					name="city" class="i1 center" required></select>
			</p>
			<p>
				<select id='secondlist1' name="state" class="i1 center" required></select>
			</p>
		</div>
		<div class="tab">
			<p>
				<input placeholder="New Password..." name="password" type="password"
					class="i1" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
					id="passw" required
					title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
			</p>
			<p>
				<input placeholder="Confirm Password..." name="pass" type="password"
					class="i1" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
					id="pass" required
					title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
			</p>
			<p class="center" id="pwdMsg" style="color: red;"> </p>
		</div>
		<div style="overflow: auto;">
			<div class="center">
				<button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
				<button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
			</div>
		</div>
		<!-- Circles which indicates the steps of the form: -->
		<div style="text-align: center; margin-top: 40px;">
			<span class="step"></span> <span class="step"></span> <span
				class="step"></span> <span class="step"></span>
		</div>
	</form>

	<script>
		var email = ""; 
		var name = "";
		//name = name.substring(name.indexOf(" ")+1);
		//name = name.split(" ").pop();
		var ph = "";
		var city = "";
		var state = "";
		var pass = "";
		var password = "";
		var currentTab = 0; // Current tab is set to be the first tab (0)
		showTab(currentTab); // Display the crurrent tab
		
		
			$('#regForm').submit(function (e) {
				e.preventDefault();
				//var form = $('#form1').serialize();
				pass = document.getElementById("pass").value;
				password = document.getElementById("passw").value;
				//alert("pass = "+pass+" password = "+password);
				if (pass == password){
				$.ajax({
				       type: 'POST',
				       url: 'ForgotPassword',
				       //data: form,
				       data : {
							pass : pass, tab : '3'
						},
				       success: function(response) {
				    	   alert(response);
				    	   if (response != "Password Updated") {
								//valid = false;
								//alert("Something went wrong!!!!!");
								document.location.href = "forgotPassword.jsp";
							}
							else {
								document.location.href = "index.jsp";
								//$('#myModal').modal('show');
							}
				       } 
				    });
				}
				else document.getElementById("pwdMsg").innerHTML = "Password Does Not Matched";
				//alert("Password Does Not Matched");
			});
		
		
		function showTab(n) {
			// This function will display the specified tab of the form...
			var x = document.getElementsByClassName("tab");
			x[n].style.display = "block";
			//... and fix the Previous/Next buttons:
			if (n == 0) {
				document.getElementById("prevBtn").style.display = "none";
			} else {
				document.getElementById("prevBtn").style.display = "inline";
			}
			if (n == (x.length - 1)) {
				document.getElementById("nextBtn").innerHTML = "Submit";
				document.getElementById("nextBtn").type = "Submit";
				//document.getElementById("nextBtn").disabled = "true";
				$("#nextBtn").prop('onclick',null);
				/*document.getElementById("nextBtn").addEventListener('blur', function(){
					pass = document.getElementById("pass").value;
					password = document.getElementById("password").value;
					if (pass == password){
						return true;
					}
					alert("Password Does Not Matched");
					return false;
				});*/
			} else {
				document.getElementById("nextBtn").innerHTML = "Next";
			}
			//... and run a function that will display the correct step indicator:
			fixStepIndicator(n)
		}

		function nextPrev(n) {
			// This function will figure out which tab to display
			var x = document.getElementsByClassName("tab");
			// Exit the function if any field in the current tab is invalid:
			if (n == 1 && !validateForm())
				return false;
			// Hide the current tab:
			x[currentTab].style.display = "none";
			// Increase or decrease the current tab by 1:
			currentTab = currentTab + n;
			// if you have reached the end of the form...
			if (currentTab >= x.length) {
				// ... the form gets submitted:
				//document.getElementById("regForm").submit();
				return false;
			}
			// Otherwise, display the correct tab:
			showTab(currentTab);
		}

		function validateForm() {
			// This function deals with validation of the form fields
			var x, y, i, valid = true;
			x = document.getElementsByClassName("tab");
			y = x[currentTab].querySelectorAll("input, select");
			// A loop that checks every input field in the current tab:
			for (i = 0; i < y.length; i++) {
				// If a field is empty...
				if (y[i].value == "") {
					// add an "invalid" class to the field:
					y[i].className += " invalid";
					// and set the current valid status to false
					valid = false;
				}
			}

			// If the valid status is true, mark the step as finished and valid:
			if (valid) {

				// For Database Management
				if (currentTab == 0) {
					email = y[0].value;
					$.ajax({
						type : 'POST',
						url : 'ForgotPassword',
						async : false,
						data : {
							email : email, tab : '0'
						},
						success : function(response) {
							//alert(response);
							if (jQuery.trim(response) !== "E-mail found") {
								alert(response);
								//$.redirect("forgotPassword.jsp",{response : response});
								//document.location.href = "forgotPassword.jsp";
								valid = false;
								$('input').val("");
								//$('input').attr("value", "");
							}
						}
					});
				}
				if (currentTab == 1) {
					name = y[0].value;
					ph = y[1].value;
					$.ajax({
						type : 'POST',
						url : 'ForgotPassword',
						async : false,
						data : {
							name : name, ph : ph, tab : '1'
						},
						success : function(response) {
							//alert(response);
							if (jQuery.trim(response) !== "Details Matched") {
								//alert(response);
								valid = false;
								alert("Verification fails data intered by you is not correct ");
								document.location.href = "forgotPassword.jsp";
								//$('input').val("");
								//$('input').attr("value", "");
							}
						}
					});
					//valid = false;
					//alert("Verification fails data intered by you is not correct "+name+ph);
					//document.location.href = "forgotPassword.jsp";
				}
				if (currentTab == 2) {
					state = y[0].value;
					city = y[1].value;
					$.ajax({
						type : 'POST',
						url : 'ForgotPassword',
						async : false,
						data : {
							state : state, city : city, tab : '2'
						},
						success : function(response) {
							//alert(response);
							if (jQuery.trim(response) !== "Details Matched") {
								//alert(response);
								valid = false;
								alert("Verification fails data intered by you is not correct ");
								document.location.href = "forgotPassword.jsp";
								//$('input').val("");
								//$('input').attr("value", "");
							}
						}
					});
				}
				/*if (currentTab == 3) {
					pass = y[0].value;
					password = y[1].value;
					$.ajax({
						type : 'POST',
						url : 'ForgotPassword',
						async : false,
						data : {
							pass : pass, tab : '3'
						},
						success : function(response) {
							if (jQuery.trim(response) !== "Password Updated") {
								//alert(response);
								valid = false;
								alert("Something went wrong!!!!!");
								document.location.href = "forgotPassword.jsp";
							}
							else {
								alert(response);
								$('#myModal').modal('show');
							}
								
						}
					});
				}*/
				

				if (valid)
					document.getElementsByClassName("step")[currentTab].className += " finish";
			}
			return valid; // return the valid status
		}

		function fixStepIndicator(n) {
			// This function removes the "active" class of all steps...
			var i, x = document.getElementsByClassName("step");
			for (i = 0; i < x.length; i++) {
				x[i].className = x[i].className.replace(" active", "");
			}
			//... and adds the "active" class on the current step:
			x[n].className += " active";
		}
	</script>

</body>
</html>
<section id="footer-bar">
	<div class="row">
		<div class="span3">
			<h4>Navigation</h4>
			<ul class="nav">
				<li><a href="./index.jsp">Homepage</a></li>
				<li><a href="./about.jsp">About Us</a></li>
				<li><a href="./contact.jsp">Contact Us</a></li>
				<%
					if (session.getAttribute("user") == null || session.getAttribute("user") == "") {
				%>
				<li><a href="#myModal" data-toggle="modal"
					data-target="#myModal">Login</a></li>
				<%
					} else {
				%>
				<li><a href="UlogOut" id="LogOut">LogOut</a></li>
				<%
					}
				%>
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
</body>
</html>