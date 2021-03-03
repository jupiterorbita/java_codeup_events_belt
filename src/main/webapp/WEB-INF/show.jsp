<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
<style>
body * {
	margin-left: 10px;
}
thead {
	background-color: rgb(109, 112, 119);
	color: white;  
}
tr, td {
	outline: 1px solid grey;
	padding: 5px 8px;
}
.wall {
	border: 2px solid black;
	width: 60%;
	height: 200px;
	overflow: scroll;
/* 	margin: 0 auto; */
}
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<a href="/events">back</a>
	<h3>event name: ${event.eventName } - id:${event.id }</h3>
	
	-> HOST: ${event.host.firstName }<br>
	-> event Date: <fmt:formatDate pattern = "yyyy-MM-dd" value = "${event.eventDate }" /><br>
	-> attendees (${allEventAttendees.size()}):
	<ul>
		<c:forEach items="${allEventAttendees}" var="a">
			
		<li>->${a.id} - ${a.firstName} </li>
		</c:forEach>
	</ul>
	
<table>
		<thead>
			<tr>
				<td>user id</td>
				<td>First Name</td>
				<td>Location</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${allEventAttendees}" var="a">
				<tr>
					<td> <c:out value="${a.id }" /> </td>
					<td> 
						${a.firstName }
					</td>
					<td> <c:out value="${a.location }" /> </td>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<br>
	
	<!-- MESSAGE WALL -->
	<h4>Event Message Wall</h4>
	<div class="wall">
<%-- 		<c:forEach items="${event.eventMessages }" var="m"> --%>
		<c:forEach items="${messagesTextArr }" var="m">
			
			<fmt:formatDate pattern = "hh:mm:ss" value = "${m.createdAt }" /> - ${m.text } <br>
			----<br>
		</c:forEach>
	</div>
	
	<p>Add comment to event</p>
	<form:form action="/createMessage/${event.id }" 
				method="post"
				modelAttribute="message"
				>
				
		<form:input type="hidden" path="eventMessage" value="${event.id}"/>
		
		<form:label path="text"></form:label>
		<form:errors path="text"/>
		<form:input path="text"/>
<%-- 		<form:textarea path="text"/> --%>
	
	<input type="submit" value="submit"/>
	</form:form>
</body>
</html>