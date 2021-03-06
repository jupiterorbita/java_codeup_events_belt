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
.profile_pic_sm {
	width: 50px;
  border-radius: 50px;
/*   box-shadow: 1px 1px 10px lightgrey; */
/*   border: 2px solid grey; */
  }
  a {
  	text-decoration: none;
  }
</style>
<meta charset="ISO-8859-1">
<title>edit your Profile | ${user.firstName}</title>
</head>
<body>
<div class="container">
	
	<h2> 
	<a href="/user/${user.id}"> <c:out value="${user.firstName}"/> 
	 <c:set var="img" value="${user.profilepic.getPic() }"/>
	 <c:choose>
		<c:when test="${img == '' }" > 	
	 		<img class="profile_pic_sm" src="/images/blank.png"> 
	 	</c:when>
	 	<c:otherwise>
			 <img class="profile_pic_sm" src="${user.profilepic.getProfileImagePath()}"> 
	 	</c:otherwise>
	 </c:choose>
	</a> 
	</h2>
		<a href="/user/${user.id}"><i class="em em-arrow_backward" aria-role="presentation" aria-label="BLACK LEFT-POINTING TRIANGLE"></i> back</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/logout">logout</a>
	
	<h1>edit your profile</h1>
	
	<p><form:errors class="span" path="user.*"/></p>
		
	<form:form method="POST" action="/editUser/${user.id}" modelAttribute="user">
      	<input type="hidden" name="_method" value="PUT">
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
           	<form:label path="bio">Bio: </form:label>
           	<form:textarea path="bio" cols="40" rows="4"/>
           </p>
           
<!--               <p> -->
<%--             <form:label path="password">Password:</form:label> --%>
<%--             <form:password path="password"/> --%>
<!--         </p> -->
<!--         <p> -->
<%--             <form:label path="passwordConfirmation">Password Confirm:</form:label> --%>
<%--             <form:password path="passwordConfirmation"/> --%>
<!--         </p> -->
           
           
       <input type="submit" value="Update!"/>
	</form:form>
</div>
</body>
</html>