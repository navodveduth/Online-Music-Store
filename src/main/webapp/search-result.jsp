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
<title>Search Result</title>
</head>

<%
String keyword = (String) session.getAttribute("keyword");
%>
<body>
	<div class="body">
		<div class="left_side">
			<jsp:include page="sidebar.jsp"></jsp:include>
		</div>
		<div class="right_side">
			<jsp:include page="header-logged.jsp"></jsp:include>
			<jsp:include page="artist-menu.jsp"></jsp:include>

			<div class="d-flex flex-column pt-5">
				<div class="p-2 h4">
					<strong><i class="fa-solid fa-circle-play pr-2"></i>SEARCH
						RESULT FOR : </strong><%= keyword %>
				</div>
				<div class="album_container">
					<div class='row'>
						<c:forEach var="song" items="${searchResult}">
							<div class='column'>
								<div class="box margin_bt" style="width: 200px;">
									<img class="album_img"
										src="songs/<c:out value="${song.songImage}"/>" width="200px"
										height="200px">
									<h6 class="album_name text-center pb-2 pt-2">
										<i class="fa-solid fa-circle-play"></i>
										<c:out value="${song.songName}" />
									</h6>
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