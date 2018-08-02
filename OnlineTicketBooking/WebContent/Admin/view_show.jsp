<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp"%>

<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="bean.BookingBean"%>
<%@ page import="daou.ShowDaou"%>
<section>
	<button class="btn btn-info pull-right" data-toggle="modal"
		data-target="#add_modal">Add Show</button>
	<h3 class="text-center">Show Record</h3>
	<!-- 
	<div style="margin-bottom: 50px;">
		<h2 class="text-center">Show</h2>
		<button class="btn btn-info pull-left" data-toggle="modal"
			data-target="#add_modal" style="margin: 0px;">Add Show</button>
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
						<th>S.No</th>
						<th>Movie Name</th>
						<th>Theater Name</th>
						<th>Show Date</th>
						<th>Time</th>
						<th>Price</th>
						<th>Tickets Sold</th>
						<th>Delete/Update</th>
					</tr>
				</thead>
				<tbody>
					<%
						List<BookingBean> list = new ArrayList<BookingBean>();
						ShowDaou d = new ShowDaou();
						
						List<BookingBean> list1 = new ArrayList<BookingBean>();
						list1 = d.getAllMovieAndTheatre();
						
						list = d.getCompleteShowRecords();
						for (BookingBean b : list) {
					%>

					<tr>
						<td><%=b.getShow_id()%></td>
						<td><%=b.getMovie_name() /*+ " " + b.getMovie_id()*/%></td>
						<td><%=b.getTheatre_name() /*+ " " + b.getTheatre_id()*/%></td>
						<td><%=b.getShow_date()%></td>
						<td><%=b.getShow_time()%></td>
						<td><%=b.getPrice()%></td>
						<td><%=((b.getSeat_number().split(" ").length) - 1)%></td>
						<td>
							<button title="Delete" class="btn btn-danger delete_show"
								data-id="<%=b.getShow_id()%>">
								<i class="icon icon-trash" style="font-size: 0px"></i>
							</button>

							<button title="Edit" class="btn btn-primary open-update_modal"
								data-toggle="modal" data-target="#update_modal"
								data-overlay="false" data-id="<%=b.getShow_id()%>"
								data-movie_name="<%=b.getMovie_name()%>"
								data-movie_id="<%=b.getMovie_id()%>"
								data-theatre_name="<%=b.getTheatre_name()%>"
								data-theatre_id="<%=b.getTheatre_id()%>"
								data-show_date="<%=b.getShow_date()%>"
								data-show_time="<%=b.getShow_time()%>"
								data-price="<%=b.getPrice()%>">
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
		
		var show_id = $(this).data('id');
		$(".modal-body #show_id").val(show_id);

		//$(".modal-body #movie_id").val($(this).data('movie_name'));
		$(".modal-body #movie_id").val($(this).data('movie_id'));
		//$(".modal-body #theatre_id").txt($(this).data('theatre_name'));
		$(".modal-body #theatre_id").val($(this).data('theatre_id'));
		$(".modal-body #price").val($(this).data('price'));
		
		var show_date = $(this).data('show_date');
		var show_time = $(this).data('show_time');
		var datetime = show_date +' '+ show_time;
		$(".modal-body #show_date").val(datetime);

		// it is superfluous to have to manually call the modal.
		//$('#update_modal').modal('show');
		/*$('#UpdateExistingShow').submit(function (e) {
			e.preventDefault();
			var form = $('#UpdateExistingShow').serialize();
			alert($(".modal-body #poster").val());
			$.ajax({
			       type: 'POST',
			       url: '../UpdateExistingShow',
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
				<div class="row">
					<form class="form-horizontal" action="../UpdateExistingShow"
						method="post" id="UpdateExistingShow">
						<fieldset>
							<div class="control-group">
								<!--<label class="control-label" for="show_id">Show Id</label>-->
								<div class="controls">
									<input type="text" name="show_id" id="show_id" class="input-xlarge"
										placeholder="" readonly />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="movie_name">Movie</label>
								<div class="controls">
									<select class="input-xlarge" name="movie_id" id="movie_id" required>
										<option></option>
										<%
											for (BookingBean b : list1) {
												if (b.getMovie_id().equals("0"))
													continue;
										%>
										<option value="<%=b.getMovie_id() %>">
											<%=b.getMovie_name() %>
										</option>
										<% }%>
									</select>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="theatre_name">Theater</label>
								<div class="controls">
									<select class="input-xlarge" name="theatre_id" id="theatre_id" required>
										<option></option>
										<%
											for (BookingBean b : list1) {
												if (b.getTheatre_id().equals("0"))
													continue;
										%>
										<option value="<%=b.getTheatre_id() %>">
											<%=b.getTheatre_name() %>
										</option>
										<% }%>
									</select>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="price">Price</label>
								<div class="controls">
									<div class="input-prepend">
										<span class="add-on">&#8377;</span> <input type="text"
											name="price" id="price" class="input-medium" pattern="[0-9]{0,10}"
											placeholder="" required title="Price should be number" />
									</div>
								</div>
							</div>

							<div class="control-group">
								<label class="control-label" for="dtp_input1">DateTime
									Picking</label>
								<div class="input-group date form_datetime controls"
									data-date="2018-06-20T05:25:07Z"
									data-date-format="dd MM yyyy HH:ii p"
									data-link-field="dtp_input1">
									<div class="input-append">
										<input class="input-xlarge" type="text" name="show_date"
											id="show_date" value="" readonly> <span
											class="input-group-addon add-on"><span
											class="glyphicon glyphicon-remove"> <i
												class="icon icon-remove" style="font-size: 0px"></i>
										</span></span> <span class="input-group-addon add-on"><span
											class="glyphicon glyphicon-th"> <i
												class="icon icon-calendar" style="font-size: 0px"></i>
										</span></span>
									</div>
								</div>
							</div>

							<div class="control-group">
								<div class="controls">
									<button type="submit" class="btn btn-info">Update</button>
									<button class="btn btn-danger pull-right" data-dismiss="modal">Cancel</button>
								</div>
							</div>
						</fieldset>
					</form>
				</div>
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
				<span style="font-weight: bold; font-size: 20px;">Add Show</span>
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
			</div>
			<!-- Modal Body -->
			<div class="modal-body">
				<div class="row">
					<form class="form-horizontal" action="../AddNewShow" method="post"
						id="AddNewShow">
						<fieldset>
							<div class="control-group">
								<label class="control-label" for="movie_name">Movie</label>
								<div class="controls">
									<select class="input-xlarge" name="movie_id" required>
										<option></option>
										<%
											for (BookingBean b : list1) {
												if (b.getMovie_id().equals("0"))
													continue;
										%>
										<option value="<%=b.getMovie_id() %>">
											<%=b.getMovie_name() %>
										</option>
										<% }%>
									</select>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="theatre_name">Theater</label>
								<div class="controls">
									<select class="input-xlarge" name="theatre_id" required>
										<option></option>
										<%
											for (BookingBean b : list1) {
												if (b.getTheatre_id().equals("0"))
													continue;
										%>
										<option value="<%=b.getTheatre_id() %>">
											<%=b.getTheatre_name() %>
										</option>
										<% }%>
									</select>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="price">Price</label>
								<div class="controls">
									<div class="input-prepend">
										<span class="add-on">&#8377;</span> <input type="text"
											name="price" class="input-medium" pattern="[0-9]{0,10}"
											placeholder="" required title="Price should be number" />
									</div>
								</div>
							</div>

							<div class="control-group">
								<label class="control-label" for="dtp_input1">DateTime
									Picking</label>
								<div class="input-group date form_datetime controls"
									data-date="2018-06-20T05:25:07Z"
									data-date-format="dd MM yyyy HH:ii p"
									data-link-field="dtp_input1">
									<div class="input-append">
										<input class="input-xlarge" type="text" name="show_date"
											value="" readonly> <span
											class="input-group-addon add-on"><span
											class="glyphicon glyphicon-remove"> <i
												class="icon icon-remove" style="font-size: 0px"></i>
										</span></span> <span class="input-group-addon add-on"><span
											class="glyphicon glyphicon-th"> <i
												class="icon icon-calendar" style="font-size: 0px"></i>
										</span></span>
									</div>
								</div>
							</div>

							<div class="control-group">
								<div class="controls">
									<button type="submit" class="btn btn-info">Add Show</button>
									<button class="btn btn-danger pull-right" data-dismiss="modal">Cancel</button>
								</div>
							</div>
						</fieldset>
					</form>
				</div>
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
	 $('#AddNewMovie').submit(function (e) {
	 e.preventDefault();
	 var form = $('#AddNewMovie').serialize();
	 //alert(form);
	 $.ajax({
	 type: 'POST',
	 url: '../AddNewMovie',
	 data: form,
	 success: function(response) {
	 alert(response);
	 $('#add_modal').modal('hide');
	 location.reload();
	 } 
	 });
	 });
	 */
	$('.delete_show').click(function(e) {
		e.preventDefault();
		var show_id = $(this).data('id');
		//alert(show_id);
		var res = confirm('Confirm OK to Delete');
		if (res == true) {
			$.ajax({
				type : 'POST',
				url : '../DeleteShow',
				data : {
					show_id : show_id
				},
				success : function(response) {
					alert(response);
					location.reload();
				}
			});
		} else
			location.reload();
	});
</script>
<script type="text/javascript"
	src="../bootstrap/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript">
    $('.form_datetime').datetimepicker({
        //language:  'En',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1
    });

</script>

</body>
</html>