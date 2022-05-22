<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="styles/playlist.css">
<link rel="stylesheet" href="styles/home.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<!-- Icons -->
<script src="https://kit.fontawesome.com/f994c4283d.js"
	crossorigin="anonymous"></script>

<sql:setDataSource var="musicDS" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/music" user="root" password="root123" />
</head>
<body>
	<div class="body">
		<div class="left_side">
			<jsp:include page="sidebar.jsp"></jsp:include>
		</div>
		<div class="right_side">
			<jsp:include page="header.jsp"></jsp:include>

			<div class='banner_body'>

				<img src="images/album.jpg" alt='' />

				<div class="banner_des">
					<h2>Discover Weekly</h2>
					<p>
						Your weekly update of the most played tracks right now. <br>
						<br> Lorem ipsum dolor sit amet, consectetur adipiscing elit,
						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
						nisi ut aliquip ex ea commodo consequat.
					</p>
					<div class="listen_btn">
						<button class="ln_btn" type="submit">Listen Now</button>
					</div>
				</div>
			</div>
			<div class="songs">
				<div class="song_container">
					<div class='row'>
						<sql:query var="songDetails" dataSource="${musicDS}">select * from song</sql:query>
						<c:forEach var="song" items="${songDetails.rows}">
							<div class='column'>
								<div class="box margin_bt" style="width: 190px;">
									<a href="#"> <img class="song_img"
										src="songs/<c:out value="${song.SongImage}" />" width="190px"
										height="200px">
									</a> <a class="track_name" href="#"><h6 class="track_lb">
											<c:out value="${song.SongName}" />
										</h6></a> <a class="box_md track_name" href="#">
										<h6 class="artist_lb">
											<i class="fa-solid fa-music">&nbsp&nbsp</i>
											<c:out value="${song.ArtistName}" />
										</h6>
									</a>

								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="player.jsp"></jsp:include>
	</div>
</body>
</html>
