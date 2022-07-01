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
    <div>
        <h1>MOV3M3NT</h1>
        <br>
        <a href="/workout/likeWorkout/${workout.id}" class="clickme primary">Click Here! Like This Workout</a>
		 
        
    </div>
    <br>
    <div>
        <h3>${workout.title} by instructor <a href="/trainer/home/${workout.trainer.id}">${workout.trainer.firstName} ${workout.trainer.lastName}</a></h3>
        <br>
        <h3>Areas Targeted: ${workout.target}</h3>
        <br>
        <h3>Difficulty Level: ${workout.difficulty}</h3>
        <br>
        <h3>Here is the workout:</h3>
        <p>${workout.details}</p>
    </div>
    <br>
   	<c:set var="trainerID" value="${workout.trainer.id}"/>
	<c:set var="sessionTrainerID" value="${sessionTrainer.id}"/>
   	<c:if test= "${trainerID == sessionTrainerID}">
		<a href="/trainer/home/${sessionTrainer.id}" class="clickme info">Back to Your Workouts (Trainer)</a>
		
	</c:if>
	<br>
	<br>
	<c:set var="sessionUserID" value="${user.id}"/>
   	<c:if test= "${sessionUserID != null}">
		<a href="/user/home" class="clickme info">Back to Your Workouts (User)</a>
		
	</c:if>
   	
<!--     <a href="/user/home">Back to Your Workouts</a>
 -->
</div>
</body>
</html>