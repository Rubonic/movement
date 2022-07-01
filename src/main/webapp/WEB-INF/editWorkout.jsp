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
		<source src="/videos/smoke.mp4" type="video/mp4">
</video>
<div class="container mt-5">
        <h1>MOV3M3NT</h1>
    	<br>
        <form:form action="/workout/edit/${oneWorkout.id}" method="POST" modelAttribute="oneWorkout">
        <div class="form-group">
            <form:label path="title">Name of Workout</form:label>
            <form:errors path="title"></form:errors>
            <form:input type="text" path="title"></form:input>
        </div>
        <br>
        <div class="form-group">
            <form:label path="target">Target Area For Workout:</form:label>
            <form:errors path="target"></form:errors>
            <form:input type="text" path="target"></form:input>
        </div>
        <br>
        <div class="form-group">
            <form:label path="details">Workout Details</form:label>
            <form:errors path="details"></form:errors>
            <form:input type="text" path="details"></form:input>
        </div>
        <br>
        <div class="form-group">
            <form:label path="difficulty">Difficulty</form:label>
            <form:select path="difficulty">
                <option value="beginner">Beginner</option>
                <option value="intermediate">Intermediate</option>
                <option value="hard">Hard</option>
                <option value="advanced">Advanced</option>
            </form:select>
        </div>
        <br>
            <form:input type="hidden" path="trainer" value="${sessionTrainer.id}"></form:input>
            <br>
            
            <input type="submit" class="clickme success" value="Edit Your Workout" />
        <br>
        <br>
        <a href="/trainer/home/${sessionTrainer.id}" class="clickme warning">Back to your Trainer page</a>
        </form:form>
 </div>
        
       

</body>
</html>