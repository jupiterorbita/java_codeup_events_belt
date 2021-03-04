<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
<!-- https://emoji-css.afeld.me/ -->
<link href="https://emoji-css.afeld.me/emoji.css" rel="stylesheet">
<style>
.box {
	/* background-color: red; */
	margin-top: 20px;
	padding: 50px;
	/* border: 1px solid gray; */
	border-radius: 10px;
	box-shadow: 2px 2px 20px grey;
	width: 500px;
	/* height: 50vh; */

  position:absolute;
  top: 0; bottom: 0; left: 0; right: 0;
  margin: auto;
  height: 400px; /*requires explicit height*/

}
.red {
	color: red;
}
.flex{
	display: flex;
	align-items: 
	
}
</style>
<meta charset="ISO-8859-1">
<title>EDIT event | ${event.eventName}</title>
</head>
<body>
<div class="container">
		
	<h2>Edit EVENTNAME: "${event.eventName}" ID: ${event.id}</h2>
	
		<a href="/events">back</a>
	
		<div class="container box">
			
			<form:form action="/edit/${event.id}"
				method="post" 
				modelAttribute="event"> 
				
				<input type="hidden" 
					name="_method"
					value="PUT">
					
				<form:input type="hidden" path="host" value="${user.id}"/>
				<form:errors path="host"/>
				
			<p>
				<form:label path="eventName">eventName</form:label>
				<form:input path="eventName"/><br/>
				<form:errors class="alert-danger red" path="eventName"/>
			</p>
			<p>
				<form:label path="eventDate">eventDate</form:label>
				<form:input type="date" path="eventDate"/><br/>
				<form:errors class="red" path="eventDate"/>
			</p>
			<p>
		        <form:label path="eventLocation">eventLocation:</form:label>
		        <form:select path="eventLocation">
	<!--         	<option value="" label="select a location" disabled selected/> -->
	        	<form:option value="A" label="A"/>
	        	<form:option value="B" label="B"/>
	        	<form:option value="C" label="C"/>
	        	</form:select>
			</p>
	        <p>
		       	<form:label path="privateEvent">Is this a Private Event?</form:label><br/>
		       	<form:radiobutton path="privateEvent" value="1"/> Private <i class="em em-dark_sunglasses" aria-role="presentation" aria-label=""></i><br>
		       	<form:radiobutton path="privateEvent" value="0"/> Public <i class="em em-loudspeaker" aria-role="presentation" aria-label="PUBLIC ADDRESS LOUDSPEAKER"></i><br>
        	</p>
			<div class="flex">
				
			<input class="btn btn btn-outline-secondary" type="submit" value="Save"/> <i class="em em-bird" aria-role="presentation" aria-label="BIRD"></i>
			<a class="btn btn btn-outline-danger" href="/events">Cancel</a>
			</div>
			</form:form>
		</div>
	</div>
</body>
</html>