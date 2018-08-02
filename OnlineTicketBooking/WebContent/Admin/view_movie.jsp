<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp"%>

<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="bean.MovieBean"%>
<%@ page import="daou.MovieDaou"%>
<section>
	<button class="btn btn-info pull-right" data-toggle="modal"
		data-target="#add_modal">Add Movie</button>
	<h3 class="text-center">Movies Record</h3>
	<!--
	<div style="margin-bottom: 50px;">
		<h2 class="text-center">Movies</h2>		 
		<button class="btn btn-info pull-right" data-toggle="modal"
			data-target="#add_modal" style="margin: 0px;">Add Movie</button>
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
						<th>Title</th>
						<th>Genre</th>
						<th>Language</th>
						<th>Cast</th>
						<th>Director</th>
						<th>Trailer URL</th>
						<th>Release Date</th>
						<th>Rating</th>
						<th>Delete/Update</th>
					</tr>
				</thead>
				<tbody>
					<%
						List<MovieBean> list = new ArrayList<MovieBean>();
						MovieDaou d = new MovieDaou();
						list = d.getAllMovieRecords();
						for (MovieBean b : list) {
					%>

					<tr>
						<td><%=b.getMovie_id()%></td>
						<td><%=b.getTitle()%></td>
						<td><%=b.getGenre()%></td>
						<td><%=b.getLanguage()%></td>
						<td><%=b.getCast()%></td>
						<td><%=b.getDirector()%></td>
						<td><%=b.getTrailer_url()%></td>
						<td><%=b.getRelease_date()%></td>
						<td><%=b.getRating()%></td>
						<td>
							<button title="Delete" class="btn btn-danger delete_movie"
								data-id="<%=b.getMovie_id()%>">
								<i class="icon icon-trash" style="font-size: 0px"></i>
							</button>

							<button title="Edit" class="btn btn-primary open-update_modal"
								data-toggle="modal" data-target="#update_modal"
								data-overlay="false" data-id="<%=b.getMovie_id()%>"
								data-title="<%=b.getTitle()%>" data-image="<%=b.getImage()%>"
								data-genre="<%=b.getGenre()%>"
								data-language="<%=b.getLanguage()%>"
								data-certificate="<%=b.getCertificate()%>"
								data-duration="<%=b.getDuration()%>"
								data-cast="<%=b.getCast()%>"
								data-director="<%=b.getDirector()%>"
								data-trailer="<%=b.getTrailer_url()%>"
								data-description="<%=b.getDescription()%>"
								data-release="<%=b.getRelease_date()%>"
								data-rating="<%=b.getRating()%>">
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
		var movie_id = $(this).data('id');
		$(".modal-body #movie_id").val(movie_id);

		var title = $(this).data('title');
		$(".modal-body #name").val(title);

		var image = $(this).data('image');
		$(".modal-body #image").val(image);

		var genre = $(this).data('genre');
		$(".modal-body #genre").val(genre);

		var language = $(this).data('language');
		$(".modal-body #language").val(language);

		$(".modal-body #certificate").val($(this).data('certificate'));
		$(".modal-body #duration").val($(this).data('duration'));
		$(".modal-body #cast").val($(this).data('cast'));
		$(".modal-body #director").val($(this).data('director'));
		$(".modal-body #trailer").val($(this).data('trailer'));
		$(".modal-body #description").val($(this).data('description'));
		$(".modal-body #release").val($(this).data('release'));
		$(".modal-body #rating").val($(this).data('rating'));

		// it is superfluous to have to manually call the modal.
		//$('#update_modal').modal('show');
		/*$('#UpdateExistingMovie').submit(function (e) {
			e.preventDefault();
			var form = $('#UpdateExistingMovie').serialize();
			alert($(".modal-body #poster").val());
			$.ajax({
			       type: 'POST',
			       url: '../UpdateExistingMovie',
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
				<form action="../UpdateExistingMovie" method="post"
					id="UpdateExistingMovie">
					<table>
						<tr>
							<td colspan="2" align="center" style="padding-left: 30px;"><input
								type="text" name="movie_id" id="movie_id" class="text-center"
								readonly /></td>
						</tr>
						<tr>
							<td style="padding-left: 30px;"><label>Name</label><input
								type="text" name="name" id="name" required /></td>
							<td style="padding-left: 50px;"><label>Poster</label><input
								type="file" name="poster" id="poster" /></td>
							<td class="hidden"><input type="text" name="image"
								id="image" required /></td>
						</tr>
						<tr>
							<td style="padding-left: 30px;"><label>Genre</label><input
								type="text" name="genre" id="genre" required /></td>
							<td style="padding-left: 50px;"><label>Language</label><input
								type="text" name="language" id="language" required /></td>
						</tr>
						<tr>
							<td style="padding-left: 30px;"><label>Certificate</label><input
								type="text" name="certificate" id="certificate" required /></td>
							<td style="padding-left: 50px;"><label>Duration</label><input
								type="text" name="duration" id="duration" required /></td>
						</tr>
						<tr>
							<td style="padding-left: 30px;"><label>Cast</label><input
								type="text" name="cast" id="cast" required /></td>
							<td style="padding-left: 50px;"><label>Director</label><input
								type="text" name="director" id="director" required /></td>
						</tr>
						<tr>
							<td style="padding-left: 30px;"><label>Trailer</label><input
								type="text" name="trailer" id="trailer" required /></td>
							<td style="padding-left: 50px;"><label>Description</label><input
								type="text" name="description" id="description" required /></td>
						</tr>
						<tr>
							<td style="padding-left: 30px;"><label>Release Date</label><input
								type="date" name="release" id="release" required /></td>
							<td style="padding-left: 50px;"><label>Rating</label><input
								type="text" name="rating" id="rating" required /></td>
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
				<span style="font-weight: bold; font-size: 20px;">Add Movie</span>
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
			</div>
			<!-- Modal Body -->
			<div class="modal-body">
				<form action="../AddNewMovie" method="post" id="AddNewMovie">
					<table>
						<tr>
							<td style="padding-left: 30px;"><label>Name</label><input
								type="text" name="name" required /></td>
							<td style="padding-left: 50px;"><label>Poster</label><input
								type="file" name="poster" required /></td>
						</tr>
						<tr>
							<td style="padding-left: 30px;"><label>Genre</label><input
								type="text" name="genre" required /></td>
							<td style="padding-left: 50px;"><label>Language</label><input
								type="text" name="language" required /></td>
						</tr>
						<tr>
							<td style="padding-left: 30px;"><label>Certificate</label><input
								type="text" name="certificate" required /></td>
							<td style="padding-left: 50px;"><label>Duration</label><input
								type="text" name="duration" required /></td>
						</tr>
						<tr>
							<td style="padding-left: 30px;"><label>Cast</label><input
								type="text" name="cast" required /></td>
							<td style="padding-left: 50px;"><label>Director</label><input
								type="text" name="director" required /></td>
						</tr>
						<tr>
							<td style="padding-left: 30px;"><label>Trailer</label><input
								type="text" name="trailer" required /></td>
							<td style="padding-left: 50px;"><label>Description</label><input
								type="text" name="description" required /></td>
						</tr>
						<tr>
							<td style="padding-left: 30px;"><label>Release Date</label><input
								type="date" name="release" required /></td>
							<td style="padding-left: 50px;"><label>Rating</label><input
								type="text" name="rating" required /></td>
						</tr>
						<tr>
							<td style="padding-left: 30px;"></td>
							<td style="padding-left: 50px; padding-right: 6px;">
								<button type="submit" class="btn btn-info">Add Movie</button>
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
	$('.delete_movie').click(function(e) {
		e.preventDefault();
		var movie_id = $(this).data('id');
		//alert(movie_id);
		var res = confirm('Confirm OK to Delete');
		if (res == true) {
			$.ajax({
				type : 'POST',
				url : '../DeleteMovie',
				data : {
					movie_id : movie_id
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


</body>
</html>