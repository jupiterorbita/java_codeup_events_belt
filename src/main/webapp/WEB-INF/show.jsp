<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
<!-- https://emoji-css.afeld.me/ -->
<link href="https://emoji-css.afeld.me/emoji.css" rel="stylesheet">
<style>
body * {
	margin-left: 10px;
}

table {
   box-shadow: 1px 1px 30px lightgrey;
   width: 80%;
   margin:0 auto;
   }
   thead { 
     background-color: rgb(109, 112, 119); 
     color: white; 
   } 
   tr, 
   td { 
/*      outline: 1px solid grey;  */
   text-align: center;
     padding: 5px 8px; 
/*      padding: 20px; */
}
.wall {
	border: 2px solid black;
	width: 80%;
	height: 200px;
	overflow: auto;
 	margin: 0 auto;
 	overflow-x: hidden;
}
.center {
	width: 50%;
	margin: 0 auto;
}
.profile_pic_sm {
	width: 50px;
  border-radius: 50px;
/*   box-shadow: 1px 1px 10px lightgrey; */
/*   border: 2px solid grey; */
  }
.left {
/* 	background-color: teal; */
	width: 39%;
}
.right {
/* 	background-color: lightblue; */
	width: 60%;
}
.flex {
	display:flex;
	align-items:flex-start;
	justify-content:center;
}
h4 {
	text-align: center;
}
a {
	text-decoration: none;
}
.event-top-details {
	outline: 1px solid grey;
	text-align: center;
	box-shadow: 1px 1px 30px lightgrey;
	width: 90%;
	margin: 0 auto;
	padding: 20px 10px;
	margin-top: 40px;
	margin-bottom: 40px;
}
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
	<a href="/events"><i class="em em-arrow_backward" aria-role="presentation" aria-label="BLACK LEFT-POINTING TRIANGLE"></i> back</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/logout">logout</a>



	<div class="event-top-details">
		<h3>${event.eventName } </h3>
		HOST: ${event.host.firstName }  
		 <c:set var="img" value="${event.host.profilepic.getPic() }"/>
		 <c:choose>
			<c:when test="${img == '' }" > 	
		 		<img class="profile_pic_sm" src="/images/blank.png"> 
		 	</c:when>
		 	<c:otherwise>
				 <img class="profile_pic_sm" src="${event.host.profilepic.getProfileImagePath()}"> 
		 	</c:otherwise>
		 </c:choose>
		
		
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;at <fmt:formatDate pattern = "E M dd yyyy" value = "${event.eventDate }" />
		with (${allEventAttendees.size()}) attendees!
	
        <c:if test="${event.attendees.contains(user)}"> (JOINED)&nbsp;&nbsp; <a class="btn btn-sm btn-danger" href="/show/remove/${event.id}">Cancel</a> </c:if>
        <c:if test="${event.attendees.contains(user) == false && prive != true}"> <a class="btn btn-sm btn-success" href="/show/join/${event.id}">Join</a> </c:if>
	</div>	
	
	
	<div class="flex">
	
		<div class="left" >
			
			<c:set var="attendees" value="${allEventAttendees}"/>
			<c:choose>
			<c:when test="${attendees.size() > 0 }">
			
				
				<h4>Let's see who's attending...</h4>
				<table>
					<thead>
						<tr>
							<td></td>
							<td>First Name</td>
							<td>from</td>
							<td>action</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${allEventAttendees}" var="a">
							<tr>
								<td> 
								
								<img class="profile_pic_sm" src="${a.profilepic.getProfileImagePath()}">  
								
								</td>
								<td> 
									${a.firstName }
								</td>
								<td> <c:out value="${a.location }" /> </td>
								<td> <a href="">add friend</a> </td>
								
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:when>
			<c:otherwise>
				no one is coming...  <i class="em em-cry" aria-role="presentation" aria-label="CRYING FACE"></i>
			</c:otherwise>
			
			</c:choose>
		</div>
		
		<br>
		<br>
		
		<!-- MESSAGE WALL -->
		
		<div class="right">
				
			<h4>Event Message Wall</h4>
			<div class="wall">
		<%-- 		<c:forEach items="${event.eventMessages }" var="m"> --%>
				<c:forEach items="${messagesTextArr }" var="m">
					
					<fmt:formatDate pattern = "hh:mm:ss" value = "${m.createdAt }" /> - ${m.text } <br>
					----<br>
				</c:forEach>
			</div>
			
			<div class="center">
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
			</div>
		</div>
	</div>
</div>
</body>
</html>