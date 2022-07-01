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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    
</head>
<body>
    <div class="contianer" style="padding-left: 5%; padding-right: 5%">
	    <h1>MOV3M3NT</h1>
	
	    
	    <div>
	        <h3>Here are some awesome workouts to try:</h3>
	        <table class="table table-dark">
	            <tr>
	                <th>Workout Title</th>
	                <th>Targeted Area</th>
	                <th>Instructor</th>
	                <th>Workout Likes</th>
	            </tr>
	            <c:forEach var="workout" items="${workout}">
	                <tr>
	                    <td><a href="/workout/${workout.id}">${workout.title}</a></td>
	                    <td style="color: white;">${workout.target}</td>
	                    <td><a href="/user/viewInstructor/${workout.trainer.id}">${workout.trainer.firstName}</a></td>
	                    <td style="color: white">${workout.getUserLikes()}</td>
	                 </tr>
	            </c:forEach>
	        </table>
	    </div>
	    <div style="display: flex; flex-direction: column;">
		    <a href="/user/home">Your Workouts</a>
		    <a href="/user/logout">Logout</a>
	    
	    </div>
	</div>
</body>
</html>