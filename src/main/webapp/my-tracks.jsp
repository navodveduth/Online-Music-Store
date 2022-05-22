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
<link rel="stylesheet" href="styles/album.css">
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
<title>My Tracks</title>
</head>
<body>
	<div class="body">
		<div class="left_side">
			<jsp:include page="sidebar.jsp"></jsp:include>
		</div>
		<div class="right_side">
			<jsp:include page="header-logged.jsp"></jsp:include>
			<jsp:include page="artist-menu.jsp"></jsp:include>

			<div class="d-flex flex-column">
				<div class="p-2 h4">
					<strong><i class="fa-solid fa-headphones-simple pr-2"></i>Uploaded
						Tracks</strong>
				</div>
				<table class="table table-hover table-dark">
					<thead>
						<tr>
							<th scope="col">Track ID</th>
							<th scope="col">Song Title</th>
							<th scope="col">Genre</th>
							<th scope="col">Release Year</th>
							<th scope="col" class="text-center">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="song" items="${songDetails}">
							<tr>
								<th scope="row"><c:out value="${song.songID}" /></th>
								<td><c:out value="${song.songName}" /></td>
								<td><c:out value="${song.genre}" /></td>
								<td><c:out value="${song.releaseDate}" /></td>
								<td class="text-center"><c:url value="updatetrack"
										var="edit">
										<c:param name="songID" value="${song.songID}" />
										<c:param name="songName" value="${song.songName}" />
										<c:param name="songImage" value="${song.songImage}" />
										<c:param name="artist" value="${song.artist}" />
										<c:param name="description" value="${song.description}" />
										<c:param name="songFile" value="${song.songFile}" />
										<c:param name="genre" value="${song.genre}" />
										<c:param name="releaseDate" value="${song.releaseDate}" />
									</c:url> <a class="btn btn-primary mr-4 pl-4 pr-4" name="edit"
									href="${edit}" role="button">Edit</a> <c:url
										value="deletetrack" var="delete">
										<c:param name="songID" value="${song.songID}" />
									</c:url> <a class="btn btn-primary" name="delete" href="${delete}"
									role="button">Delete</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			
			<div class="d-flex flex-column pt-5">
				<div class="p-2 h4 pt-5">
					<strong><i class="fa-solid fa-list pr-2"></i>Uploaded
						Albums</strong>
				</div>
					<div class="album_container">
					<div class='row'>
						<c:forEach var="album" items="${albumDetails}">
							<div class='column'>
								<div class="box margin_bt" style="width: 200px;">
								<c:url value="updatealbumutil" var="editalbum">
										<c:param name="albumID" value="${album.albumID}" />
										<c:param name="album_title" value="${album.album_title}" />
										<c:param name="artist_name" value="${album.artist_name}" />
										<c:param name="album_description" value="${album.album_description}" />
										<c:param name="album_image" value="${album.album_image}" />
										<c:param name="albumName" value="${album.album_title}" />
									</c:url> 
									<img class="album_img"
										src="songs/<c:out value="${album.album_image}"/>"
										width="200px" height="200px">
									<h6 class="album_name text-center pb-2">
											<i class="fa-solid fa-compact-disc">&ensp;</i><c:out value="${album.album_title}" />
										</h6>
										<div class="pl-4 mb-2"><a class="btn btn-dark mr-4 pl-3 pr-3" style="font-size:15px;" name="edit"
									href="${editalbum}" role="button">Edit</a> <c:url
										value="deletealbum" var="albumdel">
										<c:param name="album_title" value="${album.album_title}" />
									</c:url> <a class="btn btn-dark" style="font-size:15px;" name="delete" href="${albumdel}"
									role="button">Delete</a></div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>