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
<meta charset="ISO-8859-1">
<!-- https://emoji-css.afeld.me/ -->
<link href="https://emoji-css.afeld.me/emoji.css" rel="stylesheet">
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
.profile_pic_sm {
	width: 50px;
  border-radius: 50px;
/*   box-shadow: 1px 1px 10px lightgrey; */
/*   border: 2px solid grey; */
  }
.profile_pic_big {
	width: 240px;
  	box-shadow: 2px 2px 20px grey;
  	margin: 10px;
  }
  
a {
  text-decoration: none;
}
.wrap{
/* 	outline: 1px solid grey; */
/* 	background-color: lightgreen; */
	display: flex;
/* 	align-items: flex-start; */
/* 	justify-content: center; */
}
.left {
	
/* 	background-color: lightblue; */
}
.right {
	padding: 20px;
/* 	background-color: orange; */
	font-size: 22pt;
}
.bio {
	outline: 1px solid grey;
	background-color: lightgrey;
}
</style>
<title>${user.firstName}'s Profile!</title>
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
	<a href="/events"><i class="em em-arrow_backward" aria-role="presentation" aria-label="BLACK LEFT-POINTING TRIANGLE"></i> back</a> | <a href="/logout">logout</a>
	<hr/>

		 
	<h1> 		 
	  Profile | <a href="/user/edit/${user.id}">Edit</a>
  	</h1>
  	
  	
  	
  	
	<div class="wrap">
		<div class="left">
		 <c:set var="imgBig" value="${user.profilepic.getPic() }"/>
		 <c:choose>
			<c:when test="${imgBig == '' }" > 	
		 		<img class="profile_pic_big" src="/images/blank.png"> 
		 	</c:when>
		 	<c:otherwise>
				 <img class="profile_pic_big" src="${user.profilepic.getProfileImagePath()}"> 
		 	</c:otherwise>
		 </c:choose>
		</div>
		
		<div class="right">
			<p>First Name: ${user.firstName }</p>
			<p>Last Name: ${user.lastName }</p>
			<p>email: ${user.email }</p>
			<p>location: ${user.location }</p>
		</div>
	</div>
  	
  	<div class="bio">
		<p>your bio: ${user.bio }</p>
  	</div>
  	

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
<%-- 			<c:forEach items="${user.getEvents()}" var="ue"> --%>
			<c:forEach items="${userEvents}" var="ue">
			<tr>
				<td>${ue.id}</td>
				<td>${ue.eventName}</td>
				<td>${ue.eventDate }</td>
				<td>${ue.attendees.size()}</td>
				<td>${ue.eventLocation}</td>
				<td>${ue.host.firstName}</td>
				<td>${ue.privateEvent }</td>
				<td>actions</td>
			</tr>
			</c:forEach>
			
		</tbody>
	</table>
</div>
</body>
</html>