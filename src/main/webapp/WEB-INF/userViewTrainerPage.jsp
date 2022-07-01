<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <title></title>
</head>
<body>

	<h1>Trainer ${trainer.firstName} ${trainer.lastName}</h1>
	<p>Take a look at the workouts below</p>
	
	<h3>${trainer.firstName}'s Bio:</h3>
	<table>
		<tr>
			<th>Location:</th>
			<td>${trainer.location}</td>
		</tr>
		<tr>
			<th>Age:</th>
			<td>${trainer.age}</td>
		</tr>
		<tr>
			<th>Years of Training Experience</th>
			<td>${trainer.experience}</td>
		</tr>
	</table>
	
	<h3>${trainer.firstName}'s workouts</h3>
	<table>
		<c:forEach var="workout" items="${trainer.workouts}">
			<tr>
					<td><a href="/workout/${workout.id}">${workout.title}</a></td>
			</tr>
		</c:forEach>
	</table>
	
	<a href="/workout/showAll">See all workouts</a>
	
	<a href="/trainer/logout">Logout</a>

	
	
	
</body>
</html>