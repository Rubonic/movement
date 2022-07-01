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
<video autoplay muted loop id="myVideo">
		<source src="/videos/video.mp4" type="video/mp4">
</video>
<div class="container mt-5">
	<h1>Welcome, Trainer ${trainer.firstName} ${trainer.lastName}</h1>
	<br>
	<h3>Take a look at the workouts below</h3>
	<br>
	<img src="/images/${trainer.avatar}" alt="" height="130">
	<p>${trainer.avatar}</p>
	
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
	<br>
	<h3>${trainer.firstName}'s Workouts</h3>
	<br>
	<table>
		<c:forEach var="workout" items="${trainer.workouts}">
			<tr>
				<c:set var="trainerID" value="${trainer.id}"/>
				<c:set var="sessionTrainerID" value="${sessionTrainer.id}"/>
				<c:if test= "${trainerID == sessionTrainerID}">
					<td><a href="/workout/${workout.id}">${workout.title}</a></td>
					<td><a href="/workout/edit/${workout.id}" class="clickme success">Edit this Workout</a></td>
					<td>
						<form action="/workout/delete/${workout.id}" method="post">
						    <input type="hidden" name="_method" class="btn btn-danger" value="delete">
						    <input type="submit" class="btn btn-danger" value="Delete">
						</form>
					</td>
					
				</c:if>
			</tr>
		</c:forEach>
	</table>
	
	<c:set var="trainerID1" value="${trainer.id}"/>
	<c:set var="sessionTrainerID1" value="${sessionTrainer.id}"/>
	<c:if test= "${trainerID1 == sessionTrainerID1}">
	<br>
		<a href="/workout/new/${trainer.id}" class="clickme warning">Add a new Workout</a>
	</c:if>
	<br>
	<br>
	<a href="/trainer/logout" class="clickme danger">Logout</a>
	
	
</div>	
</body>
</html>