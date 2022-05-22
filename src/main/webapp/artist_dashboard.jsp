<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page
	import="java.util.Locale,java.text.SimpleDateFormat,java.util.Calendar"%>
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
<title>Dashboard</title>
<%
String Username = (String) session.getAttribute("uname");
String Userimg = (String) session.getAttribute("userImg");
String userId = (String) session.getAttribute("userId");
String time = new SimpleDateFormat("hh : mm a", Locale.getDefault()).format(Calendar.getInstance().getTime())
		.toLowerCase();
%>

</head>
<body>
	<div class="body">
		<div class="left_side">
			<jsp:include page="sidebar.jsp"></jsp:include>
		</div>

		<div class="right_side">
			<jsp:include page="header-logged.jsp"></jsp:include>
			<jsp:include page="artist-menu.jsp"></jsp:include>

			<style>
.card {
	background: #1f2335;
	border-radius: 10px;
}

.ml-auto, .mx-auto {
	margin-left: 12rem !important;
}
</style>
			<div>
				<div style="display: flex;">
					<img class="mx-auto d-block" src="images/user/<%=Userimg%>"
						onerror="this.src='images/user/default-user.jpg'"
						style="border-radius: 50px; width: 200px; height: 200px;">

					<h2
						style="padding-right: 20rem; margin-top: 60px; text-transform: capitalize;"><%=Username%></h2>
				</div>
				<br> <br>
				<div>
					<div class="card-deck">
						<div class="card h-25 d-inline-block">
							<div class="card-body text-center">
								<h5 class="card-title text-warning h4">Total Tracks</h5>
								<br>
								<h4 class="card-text text-warning">
									<strong><c:out value="${totalsongs}" /></strong>
								</h4>
							</div>
							<br>
							<div class="card-footer">
								&emsp; &emsp; <small class="text-light h6">Last updated:
									&emsp; <%=time%></small>
							</div>
						</div>
						<div class="card h-25 d-inline-block">
							<div class="card-body text-center">
								<h5 class="card-title text-warning h4">Total Albums</h5>
								<br>
								<h4 class="card-text text-warning">
									<strong><c:out value="${totalalbums}" /></strong>
								</h4>
							</div>
							<br>
							<div class="card-footer">
								&emsp; &emsp; <small class="text-light h6">Last updated:
									&emsp; <%=time%></small>
							</div>
						</div>
						<div class="card h-25 d-inline-block">
							<div class="card-body text-center">
								<h5 class="card-title text-warning h4">Liked Songs</h5>
								<br>
								<h4 class="card-text text-warning">
									<strong>1</strong>
								</h4>
							</div>
							<br>
							<div class="card-footer">
								&emsp; &emsp; <small class="text-light h6">Last updated:
									&emsp; <%=time%></small>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>