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
<link rel="stylesheet" href="styles/artist_dashboard.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<!-- Icons -->
<script src="https://kit.fontawesome.com/f994c4283d.js"
	crossorigin="anonymous">
	
</script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<div>
		<nav class="navbar navbar-expand-lg navbar-dark bgc-dark">

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav justify-content-center">
				<c:forEach var="user" items="${userDetails}">
					<c:url value="artist" var="artists">
						<c:param name="userId" value="${user.userID}" />
						<c:param name="userImg" value="${user.profilePic}" />
					</c:url>
					<li class="nav-item font"><a class="nav-link color-me" name="artists"
						href="${artists}">Dashboard<span class="sr-only">(current)</span>
					</a></li>
					
					<c:url value="#" var="profile">
						<c:param name="userId" value="${user.userID}" />
						<c:param name="userImg" value="${user.profilePic}" />
					</c:url>
					<li class="nav-item font"><a class="nav-link" name="profile"
						href="${profile}">Profile Settings<span class="sr-only">(current)</span>
					</a></li>

					<c:url value="mytrack" var="mytracks">
						<c:param name="userId" value="${user.userID}" />
						<c:param name="userImg" value="${user.profilePic}" />
					</c:url>
					<li class="nav-item font"><a class="nav-link" name="mytracks"
						href="${mytracks}">My Tracks<span class="sr-only">(current)</span>
					</a></li>

					<c:url value="createalbumutility" var="cralbum">
						<c:param name="userId" value="${user.userID}" />
						<c:param name="userImg" value="${user.profilePic}" />
					</c:url>
					<li class="nav-item font"><a class="nav-link" name="cralbum"
						href="${cralbum}">Create Album<span class="sr-only">(current)</span>
					</a></li>

					<c:url value="trackuploadutility" var="trackupload">
						<c:param name="userId" value="${user.userID}" />
						<c:param name="userImg" value="${user.profilePic}" />
					</c:url>
					<li class="nav-item font"><a class="nav-link" name="senddt"
						href="${trackupload}">Track Upload<span class="sr-only">(current)</span>
					</a></li>

				</c:forEach>
			</ul>
		</div>
		</nav>
		<br><br>
	</div>
</body>
</html>