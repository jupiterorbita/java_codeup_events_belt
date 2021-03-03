<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<style>
.span {
	font-size: 9pt;
	color:red;
}
</style>
<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Create a CodeUp Account</title>
</head>
<body>
	<div class="container">
		
	<a href="/">back</a>
	<h2>Sign up!</h2>
	
	<p><form:errors class="span" path="user.*"/></p>
		
	<form:form method="POST" action="/register" modelAttribute="user">
      		<p>
            <form:label path="firstName">First Name:</form:label>
<%-- 			        <form:errors path="firstName"/> --%>
            <form:input path="firstName"/>
       	</p>
      		<p>
            <form:label path="lastName">Last Name:</form:label>
            <form:input path="lastName"/>
       	</p>
       	<p>
            <form:label path="location">location:</form:label>
            <form:select path="location">
            	<option value="" label="select a location" disabled selected/>
            	<form:option value="A" label="A"/>
            	<form:option value="B" label="B"/>
            	<form:option value="C" label="C"/>
            </form:select>
           </p>
           <p>
           	<form:label path="dob">DOB</form:label>
           	<form:input type="date" path="dob" max="2021-01-01"/><br/>
           	<form:errors class="span" path="dob"/>
<!--            	<span>must be over 18 to join</span> -->
           </p>
           <p>
           	<form:label path="email">email</form:label>
           	<form:input path="email"/>
           </p>
           
              <p>
            <form:label path="password">Password:</form:label>
            <form:password path="password"/>
        </p>
        <p>
            <form:label path="passwordConfirmation">Password Confirm:</form:label>
            <form:password path="passwordConfirmation"/>
        </p>
           
           
       <input type="submit" value="Register!"/>
	</form:form>
	</div>
</body>
</html>