<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<style>
thead {
  background-color: rgb(109, 112, 119);
  color: white;
}
tr,
td {
  outline: 1px solid grey;
  padding: 5px 8px;
}
form {
  outline: 1px solid grey;
  padding: 5px;
  width: 50%;
}
</style>
<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>${user.firstName}'s Profile!</title>
</head>
<body>
	<div class="container">
		

	<a href="/events">back</a> | <a href="/logout">logout</a>
	<h1> <c:out value="${user.firstName}"/> | Profile </h1>
	<hr/>
	<p>your bio:</p>
	<p>First Name: </p>
	<p>Last Name: </p>
	<p>email:</p>
	<p>location: </p>
	<p></p>
	
	<h3>events i'm going to:</h3>
	<table>
		<thead>
			<tr>
				<td>event id</td>
				<td>event name</td>
				<td>date</td>
				<td>attendees</td>
				<td>location</td>
				<td>Host</td>
				<td>PRIVATE?</td>
				<td>actions</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>event id</td>
				<td>event name</td>
				<td>date</td>
				<td>attendees</td>
				<td>location</td>
				<td>Host</td>
				<td>PRIVATE?</td>
				<td>actions</td>
			</tr>
			
		</tbody>
	</table>
</div>
</body>
</html>