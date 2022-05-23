<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset="ISO-8859-1">
<link rel="stylesheet" href="styles/artist_home.css">
<link rel="stylesheet" href="styles/upload.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<!-- Icons -->
<script src="https://kit.fontawesome.com/f994c4283d.js"
	crossorigin="anonymous">
	
</script>
<script type="text/javascript">
	
</script>
<title>Upload Song</title>
</head>
<body>

<%
String songID = request.getParameter("songID");
String songName = request.getParameter("songName");
String songImage = request.getParameter("songImage");
String artist = request.getParameter("artist");
String description = request.getParameter("description");
String songFile = request.getParameter("songFile");
String genre = request.getParameter("genre");
String releaseDate = request.getParameter("releaseDate");

%>

	<div class="body">
		<div class="left_side">
			<jsp:include page="sidebar.jsp"></jsp:include>
		</div>
		<div class="right_side">
			<jsp:include page="header-logged.jsp"></jsp:include>
			<jsp:include page="artist-menu.jsp"></jsp:include>
			<form method="post" action="updatesong"
				enctype="multipart/form-data">
				<c:forEach var="user" items="${userDetails}">
					<c:set var="id" value="${user.userID}" />
					<input type="hidden" name="songID" value="<%= songID %>">
					<div class="form-row form_input" style="background-color: #139487;">
						<div class="form-group col-md-4 d-flex justify-content-center">
							<label class="image_upload"><i
								class="fa-solid fa-circle-play"></i>&nbsp; Track Image <input
								type="file" name="image" id="image" onchange="preview()"
								accept="image/*" required /> <br> <br> <img
								id="frame" src="songs/<%= songImage %>" width="250px"
								height="250px" /><br /> </label>
						</div>
						<div class="form-group col-md-7 p-4 form_input">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label>Track Name</label> <input type="text"
										class="form-control" id="track" name="track_name"
										placeholder="Track Name..." value="<%= songName %>" required>
								</div>
								<div class="form-group col-md-6">
									<label>Artist's Name</label> <input type="text"
										class="form-control" id="artist" name="artist_name"
										placeholder="Artist's Name..." value="<%= artist %>" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label>Genre</label> <select id="genre" name="genre_tp"
										class="form-control">
										<option selected>Rock</option>
										<option>Pop</option>
										<option>Jazz</option>
										<option>Hip-hop</option>
										<option>Electronic dance music (EDM)</option>
										<option>Techno</option>
										<option>Rhythm and Blues</option>
									</select>
								</div>
								<div class="form-group col-md-6">
									<label>Release Year</label> <input type="number"
										name="release_date" class="form-control" min="1900" max="2050"
										step="1" value="<%= releaseDate %>" style="text-align: center;" required>
								</div>
							</div>
							<br>
							<div class="form-row d-flex justify-content-center">
								<div class="form-group col-md-8 ">
									<label class="d-flex justify-content-center">Track
										Description</label>
									<textarea class="form-control" name="track_des" rows="2"
										cols="60" placeholder="Track Description..." required><%= description %></textarea>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12 d-flex justify-content-center">
									<label for="song-upload" class="song-file-upload mt-3">
										<i class="fa fa-cloud-upload"></i> Upload Song
									</label> <input id="song-upload" name='song' type="file"
										style="display: none;" accept="audio/*" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12 d-flex justify-content-center">
									<audio id="audio" controls> <source src="songs/<%= songFile %>" id="src" />
									</audio>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6 d-flex justify-content-end">
									<button type="submit" class="btn btn-primary mt-3 mr-3 px-4">Update</button>
								</div>
								<c:url value="artist" var="dashboard">
									<c:param name="userId" value="${user.userID}" />
									<c:param name="userImg" value="${user.profilePic}" />
								</c:url>
								<div class="form-group col-md-6">
									<a name="dashboard" href="${dashboard}"><span
										class="sr-only">(current)</span>
										<button type="button" class="btn btn-primary mt-3 px-3">Cancel</button>
									</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</form>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script type="text/javascript">
		/* ref - https://stackoverflow.com/a/62167551 */
		function preview() {
			frame.src = URL.createObjectURL(event.target.files[0]);
		}

		/* ref - https://stackoverflow.com/a/41543131 */
		$('#song-upload').change(function() {
			var i = $(this).prev('label').clone();
			var file = $('#song-upload')[0].files[0].name;
			$(this).prev('label').text(file);
		});

		/* ref - https://stackoverflow.com/a/43710640 */
		function handleFiles(event) {
			var files = event.target.files;
			$("#src").attr("src", URL.createObjectURL(files[0]));
			document.getElementById("audio").load();
		}

		document.getElementById("song-upload").addEventListener("change",
				handleFiles, false);
	</script>
</body>
</html>