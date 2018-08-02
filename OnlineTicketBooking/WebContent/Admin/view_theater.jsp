<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp"%>

<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="bean.TheatreBean"%>
<%@ page import="daou.TheatreDaou"%>
<section>
	<button class="btn btn-info pull-right" data-toggle="modal"
		data-target="#add_modal">Add Theater</button>
	<h3 class="text-center">Theater Record</h3>
	<!--
	<div style="margin-bottom: 50px;">
		<h2 class="text-center">Theater</h2>
		<button class="btn btn-info pull-left" data-toggle="modal"
			data-target="#add_modal" style="margin: 0px;">Add Theater</button>
		<button class="btn btn-info pull-right" title="search">
			<i class="icon icon-search" style="font-size: 0px"></i>
		</button>
		<input type="search" class="pull-right" style="margin: 0px;">
	</div>
	-->
</section>


<section>
	<div class=row>
		<div class="span12">
			<table cellpadding="0" cellspacing="0" border="0"
			class="table table-striped table-bordered" id="example">
			<thead>
				<tr>
					<th>Id</th>
					<th>Name</th>
					<th>Address</th>
					<th>City</th>
					<th>State</th>
					<th>Contact Person</th>
					<th>Contact Number</th>
					<th>Delete/Update</th>
				</tr>
			</thead>
			<tbody>
				<%
					List<TheatreBean> list = new ArrayList<TheatreBean>();
					TheatreDaou d = new TheatreDaou();
					list = d.getAllTheatreRecords();
					for (TheatreBean b : list) {
				%>
				<tr>
					<td><%=b.getTheatre_id()%></td>
					<td><%=b.getName()%></td>
					<td><%=b.getAddress()%></td>
					<td><%=b.getCity()%></td>
					<td><%=b.getState()%></td>
					<td><%=b.getContact_person()%></td>
					<td><%=b.getContact_number()%></td>
					<td>
						<button title="Delete" class="btn btn-danger delete_theatre"
							data-id="<%=b.getTheatre_id()%>">
							<i class="icon icon-trash" style="font-size: 0px"></i>
						</button>

						<button title="Edit" class="btn btn-primary open-update_modal"
							data-toggle="modal" data-target="#update_modal"
							data-overlay="false" data-id="<%=b.getTheatre_id()%>"
							data-name="<%=b.getName()%>" data-Address="<%=b.getAddress()%>"
							data-city="<%=b.getCity()%>"
							data-state="<%=b.getState()%>"
							data-contact="<%=b.getContact_person()%>"
							data-contact1="<%=b.getContact_number()%>">
							<i class="icon icon-edit" style="font-size: 0px"></i>
						</button>
					</td>
					<!-- trigger modal with a button  with an id -->
				</tr>
				<%
					}
				%>
			<tbody>
			</table>
		</div>
	</div>
</section>

<script>
	$(document).on("click", ".open-update_modal", function() {
		var theatre_id = $(this).data('id');
		$(".modal-body #theatre_id").val(theatre_id);

		var name = $(this).data('name');
		$(".modal-body #name").val(name);

		var address = $(this).data('address');
		$(".modal-body #address").val(address);

		//var city = $(this).data('city');
		//$(".modal-body #listBox1").val(city);

		//var state = $(this).data('state');
		//$(".modal-body #secondlist1").val(state);

		$(".modal-body #contact").val($(this).data('contact'));
		$(".modal-body #contact1").val($(this).data('contact1'));
		 
		// it is superfluous to have to manually call the modal.
		//$('#update_modal').modal('show');
		/*$('#UpdateExistingTheatre').submit(function (e) {
			e.preventDefault();
			var form = $('#UpdateExistingTheatre').serialize();
			//alert($(".modal-body #poster").val());
			$.ajax({
			       type: 'POST',
			       url: '../UpdateExistingTheatre',
			       data: form,
			       success: function(response) {
			    	   alert(response);
			    	   $('#update_modal').modal('hide');
			    	   location.reload();
			       } 
			    });
		});*/
	});
</script>

<!-- Modal -->
<div class="modal fade" id="update_modal" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<!-- Modal Content -->
		<div class="modal-content">
			<div class="modal-header" align="center">
				<span style="font-weight: bold; font-size: 20px;">Update</span>
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
			</div>
			<!-- Modal Body -->
			<div class="modal-body">
				<form action="../UpdateExistingTheatre" method="post"
					id="UpdateExistingTheatre">
					<table>
						<tr>
							<td colspan="2" align="center" style="padding-left: 30px;"><input
								type="text" name="theatre_id" id="theatre_id" class="text-center" readonly/></td>
						</tr>
						<tr>
							<td style="padding-left: 30px;"><label>Name</label><input
								type="text" name="name" id="name" required /></td>
							<td style="padding-left: 50px;"><label>Address</label><input
								type="text" name="address" id="address" required /></td>
						</tr>
						<tr id="selection">
							<td style="padding-left: 30px;"><label>State</label>
								<select name="city" id="listBox1" onchange='selct_district(this.value)' required ></select>
							</td>
							<td style="padding-left: 50px;"><label>City</label>
								<select name="state" id="secondlist1" required ></select>
							</td>
						</tr>
						<tr>
							<td style="padding-left: 30px;"><label>Contact Person</label><input
								type="text" name="contact" id="contact" required /></td>
							<td style="padding-left: 50px;"><label>Contact Number</label><input
								type="text" name="contact1" id="contact1" pattern="[0-9]{10,10}" title="Mobile number should be of 10 digits" required /></td>
						</tr>					
						<tr>
							<td style="padding-left: 30px;"></td>
							<td style="padding-left: 50px; padding-right: 6px;">
								<button type="submit" class="btn btn-info ">Update</button>
								<button class="btn btn-danger pull-right" data-dismiss="modal">Cancel</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<!-- modal footer
			<div class="modal-footer" style="margin-top: -20px;">
				<button class="btn btn-info">update</button>
				<button class="btn btn-danger" data-dismiss="modal">cancel</button>
			</div> -->
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="add_modal" tabindex="-2" role="dialog">
	<div class="modal-dialog">
		<!-- Modal Content -->
		<div class="modal-content">
			<div class="modal-header" align="center">
				<span style="font-weight: bold; font-size: 20px;">Add Theater</span>
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
			</div>
			<!-- Modal Body -->
			<div class="modal-body">
				<form action="../AddNewTheatre" method="post" id="AddNewTheatre">
					<table>
						<tr>
							<td style="padding-left: 30px;"><label>Name</label><input
								type="text" name="name" id="name" required /></td>
							<td style="padding-left: 50px;"><label>Address</label><input
								type="text" name="address" id="address" required /></td>
						</tr>
						<tr id="selection">
							<td style="padding-left: 30px;"><label>State</label>
								<select name="city" id="listBox1" onchange='selct_district(this.value)' required ></select>
							</td>
							<td style="padding-left: 50px;"><label>City</label>
								<select name="state" id="secondlist1" required ></select>
							</td>
						</tr>
						<tr>
							<td style="padding-left: 30px;"><label>Contact Person</label><input
								type="text" name="contact" id="contact" required /></td>
							<td style="padding-left: 50px;"><label>Contact Number</label><input
								type="text" name="contact1" id="contact1" pattern="[0-9]{10,10}" title="Mobile number should be of 10 digits" required /></td>
						</tr>
						<tr>
							<td style="padding-left: 30px;"></td>
							<td style="padding-left: 50px; padding-right: 6px;">
								<button type="submit" class="btn btn-info">Add Theater</button>
								<button class="btn btn-danger pull-right" data-dismiss="modal">Cancel</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<!-- modal footer 
			<div class="modal-footer" style="margin-top: -20px;">
				<button class="btn btn-info">Add</button>
				<button class="btn btn-danger" data-dismiss="modal">Cancel</button>
			</div> -->
		</div>
	</div>
</div>
<section id="footer-bar">
	<div class="row">
		<div class="span3">
			<h4>Navigation</h4>
			<ul class="nav">
				<li><a href="index.jsp">Homepage</a></li>
				<li><a href="view_movie.jsp">Movie</a></li>
				<li><a href="view_theater.jsp">Theater</a></li>
				<li><a href="../Admin_Logout">Logout</a></li>
			</ul>
		</div>
		<div class="span4">
			<h4>My Account</h4>
			<ul class="nav">
				<li><a href="view_show.jsp">Show Details</a></li>
				<li><a href="view_bookings.jsp">Booking History</a></li>
				<li><a href="#">Newsletter</a></li>
			</ul>
		</div>
		<div class="span5">
			<p class="logo">
				<img src="../themes/images/logo.png" class="site_logo" alt="">
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
<script>
/*
$('#AddNewTheatre').submit(function (e) {
	e.preventDefault();
	var form = $('#AddNewTheatre').serialize();
	//alert(form);
	$.ajax({
	       type: 'POST',
	       url: '../AddNewTheatre',
	       data: form,
	       success: function(response) {
	    	   alert(response);
	    	   $('#add_modal').modal('hide');
	    	   location.reload();
	       } 
	    });
});
*/
$('.delete_theatre').click(function (e) {
	e.preventDefault();
	var theatre_id = $(this).data('id');
	//alert(theatre_id);
	var res = confirm('Confirm OK to Delete');
	if (res == true) {
		$.ajax({
		       type: 'POST',
		       url: '../DeleteTheatre',
		       data: { theatre_id: theatre_id },
		       success: function(response) {
		    	   alert(response);
		    	   location.reload();
		       } 
		    });
	} else location.reload();
});
</script>


</body>
</html>