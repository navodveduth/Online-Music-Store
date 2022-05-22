<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="styles/header.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

</head>
<%
String Username = (String) session.getAttribute("uname");
String Userimg = (String) session.getAttribute("userImg");
%>
<body>
	<div class="header">
		<div>
			<form action="searchresult" class="searchbar">
				<input type="text" placeholder="Search for Songs..." name="keyword"
					size="50" required>
				<button type="submit" name="srchbtn">
					<i class="fa fa-search" aria-hidden="true"></i>
				</button>
			</form>
		</div>
		<div class="avatar_img">
			<img class="avatar" src="images/user/<%=Userimg%>"
				onerror="this.src='images/user/user.png'">
			<h5 class="user_name">
				<%=Username%>
			</h5>

		</div>
	</div>
</body>
</html>