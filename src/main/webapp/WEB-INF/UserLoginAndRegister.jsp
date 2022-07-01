<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">	
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <title>Login And Registration</title>
</head>
<body>

<video autoplay muted loop id="myVideo">
		<source src="/videos/explore.mp4" type="video/mp4">
</video>

	<div class="container mt-5">
		<h1>Welcome to the MOV3M3NT!</h1>
		<p>Quality Training Meets Quality Outcomes</p>
		
		
		<h3>Log In User</h3>
		<form:form action="/user/login" method="post" modelAttribute="userLogin">

    	<div class="form-group">
				<form:label path="email">Email:</form:label>
				<form:input path="email" class="form-control" />
				<form:errors path="email" class="text-danger" />
			</div>
			<div class="form-group">
				<label>Password:</label>
				<form:password path="password" class="form-control" />
				<form:errors path="password" class="text-danger" />
			</div>


			<input type="submit" value="Login" class="btn btn-primary" />
		</form:form>
		<br>
		<h3>Register</h3>
		<form:form action="/user/register" method="post" modelAttribute="newUser">
			<div class="form-group">
				<form:label path="firstName">First Name:</form:label>
				<form:input path="firstName" class="form-control" />
				<form:errors path="firstName" class="text-danger" />
			</div>
			<div class="form-group">
				<form:label path="lastName">Last Name:</form:label>
				<form:input path="lastName" class="form-control" />
				<form:errors path="lastName" class="text-danger" />
			</div>
			<div class="form-group">
				<form:label path="email">Email:</form:label>
				<form:input path="email" class="form-control" />
				<form:errors path="email" class="text-danger" />
			</div>
			<div class="form-group">
				<form:label path="password">Password:</form:label>
				<form:password path="password" class="form-control" />
				<form:errors path="password" class="text-danger" />
			</div>
			<div class="form-group">
				<form:label path="confirm">Confirm Password:</form:label>
				<form:password path="confirm" class="form-control" />
				<form:errors path="confirm" class="text-danger" />
			</div>
			<br>
			<input type="submit" value="Register" class="btn btn-primary" />
		</form:form>
		<a href="/trainer">Access to trainer portal here!</a>
	</div>



</body>
</html>