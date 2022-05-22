<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
<form action="login" method="post">
User Name <input type="text" name="username"> <br>
Password <input type="text" name="password"> <br>
<input type="submit" name="submit" value="Login">
</form>
</body>
</html>