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
    <script defer type="text/javascript" src="/js/main.js"></script>
    <title>Login And Registration</title>
<%--    <script type="text/javascript" src="/js/main.js"></script>--%>
</head>
<body>
<video autoplay muted loop id="myVideo">
		<source src="/videos/ropes.mp4.mp4" type="video/mp4">
</video>

<%--<h1>MOV3M3NT</h1>--%>
<%--<p>Join our growing community.</p>--%>


<%--<form:form action="/trainer/login" method="post" modelAttribute="trainerLogin">--%>

<%--    <table>--%>
<%--        <thead>--%>
<%--        <tr>--%>
<%--            <td colspan="2">Log In Trainer</td>--%>
<%--        </tr>--%>
<%--        </thead>--%>
<%--        <thead>--%>
<%--        <tr>--%>
<%--            <td class="float-left">Email:</td>--%>
<%--            <td class="float-left">--%>
<%--                <form:errors path="email" class="text-danger"></form:errors>--%>
<%--                <form:input class="input" path="email"></form:input>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td class="float-left">Password:</td>--%>
<%--            <td class="float-left">--%>
<%--                <form:errors path="password" class="text-danger"></form:errors>--%>
<%--                <form:input class="input" path="password"></form:input>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td colspan=2><input class="input" class="button" type="submit" value="Login Trainer"/></td>--%>
<%--        </tr>--%>
<%--        </thead>--%>
<%--    </table>--%>
<%--</form:form>--%>


<%--<form:form action="/trainer/register" method="post" modelAttribute="newTrainer" enctype="multipart/form-data">--%>

<%--    <table>--%>
<%--        <thead>--%>
<%--        <tr>--%>
<%--            <td colspan="2">Register as a Trainer</td>--%>
<%--        </tr>--%>
<%--        </thead>--%>
<%--        <thead>--%>
<%--        <tr>--%>
<%--            <td>--%>

<%--               <input id="avatar" type="file" name="file">--%>
<%--                <form:errors path="avatar"></form:errors>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td class="float-left">First Name</td>--%>
<%--            <td class="float-left">--%>
<%--                <form:errors path="firstName" class="text-danger"></form:errors>--%>
<%--                <form:input type="text" class="input" path="FirstName"></form:input>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td class="float-left">Last Name:</td>--%>
<%--            <td class="float-left">--%>
<%--                <form:errors path="lastName" class="text-danger"></form:errors>--%>
<%--                <form:input type="text" class="input" path="lastName"></form:input>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td class="float-left">Email:</td>--%>
<%--            <td class="float-left">--%>
<%--                <form:errors path="email" class="text-danger"></form:errors>--%>
<%--                <form:input type="text" class="input" path="email"></form:input>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td class="float-left">Location:</td>--%>
<%--            <td class="float-left">--%>

<section class="vh-100 gradient-custom">
	<div class="container mt-5">
		<h1>MOV3M3NT</h1>
		<p>Join our growing community of Trainers</p>
		<form:form action="/trainer/login" method="post" modelAttribute="trainerLogin" >

    		<h3>Log In Trainer</h3>
        		<div class="form-group">
					<form:label path="email">Email:</form:label>
					<form:input path="email" class="form-control" ></form:input>
					<form:errors path="email" class="text-danger" ></form:errors>
				</div>
				<br>
				<div class="form-group">
					<label>Password:</label>
					<form:password path="password" class="form-control" ></form:password>
					<form:errors path="password" class="text-danger" ></form:errors>
				</div>
				<br>
            	<input class="btn btn-primary" type="submit" value="Login Trainer"/>
	</form:form>
	
	<form:form action="/trainer/register" method="post" modelAttribute="newTrainer" enctype="multipart/form-data">
	<br>
		<h3>Register as a Trainer</h3>
    	<div class="form-group">
				<form:label path="firstName">First Name:</form:label>
				<form:input path="firstName" class="form-control" ></form:input>
				<form:errors path="firstName" class="text-danger" ></form:errors>
			</div>
			<br>
            <div>
                <input id="avatar" type="file" name="file">
                <form:errors path="avatar"></form:errors>
            </div>
            <br>
			<div class="form-group">
				<form:label path="lastName">Last Name:</form:label>
				<form:input path="lastName" class="form-control" ></form:input>
				<form:errors path="lastName" class="text-danger" ></form:errors>
			</div>
			<br>
			<div class="form-group">
				<form:label path="email">Email:</form:label>
				<form:input path="email" class="form-control" ></form:input>
				<form:errors path="email" class="text-danger" ></form:errors>
			</div>
			<br>
        	<div class="form-group">	
            	<form:label path="location">Location:</form:label>

                <form:errors path="location" class="text-danger"></form:errors>
                <form:input type="text" class="form-control" path="location"></form:input>
            </div>	
            <br>
        	<div class="form-group">	
            	<form:label path="age">Age:</form:label>
                <form:errors path="age" class="text-danger"></form:errors>
                <form:input type="number" class="form-control" path="age"></form:input>
            </div>
            <br>
        	<div class="form-group">	
            	<form:label path="experience">Years of Experience:</form:label>
                <form:errors path="experience" class="text-danger"></form:errors>
                <form:input type="number" class="form-control" path="experience"></form:input>
            </div>
            <br>
            <div class="form-group">
				<form:label path="password">Password:</form:label>
				<form:password path="password" class="form-control"></form:password>
				<form:errors path="password" class="text-danger"></form:errors>
			</div>
			<br>
			<div class="form-group">
				<form:label path="confirm">Confirm Password:</form:label>
				<form:password path="confirm" class="form-control"></form:password>
				<form:errors path="confirm" class="text-danger"></form:errors>
			</div>
			<br>
            <input class="btn btn-primary" type="submit" value="Submit New Trainer"/>
	</form:form>
	<a href="/user"> Not a trainer? Click here</a>
	</div>
</section>



</body>
</html>