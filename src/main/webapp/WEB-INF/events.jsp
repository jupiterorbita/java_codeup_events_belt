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

<style>
  /* body * {
    margin-left: 10px;
  } */
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
  .b {
    display: inline-block;
    /* 	background-color: red; */
    border: 0;
    outline: 0;
    margin: 0;
    padding: 0;
  }
  .red {
    color: red;
  }
</style>
<meta charset="ISO-8859-1">
<title>CodeUp | Dashboard</title>
</head>
<body>
	<div class="container">		
		<h2>Welcome! <a href="/user/${user.id}"> <c:out value="${user.firstName}"/> </a> </h2>
		<a href="/logout">logout</a>
		

		
		
		
		
		${deleted }
      <h5>all events!</h5>
      <table>
        <thead>
          <tr>
            <td>id</td>
            <td>Event NAME</td>
            <td>date</td>
            <td>attendees</td>
            <td>location</td>
            <td>Host</td>
            <td>Private</td>
            <td>actions</td>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${allEvents}" var="e">
            <tr>
              <td><c:out value="${e.id }" /></td>
              <td>
                <a href="/show/${e.id}"> ${e.eventName } </a>
              </td>
              <td>
                <fmt:formatDate pattern="yyyy-MM-dd" value="${e.eventDate }" />
              </td>

              <td>
                <%--
                <c:if test="${e.attendees.size() >= 4}">
                  --%>
                  <c:set var="attendees_size" value="${e.attendees.size() }" />
                  <c:choose>
                    <c:when test="${ attendees_size >= 4}">
                      <span class="red"><b> ${e.attendees.size() } </b></span>
                    </c:when>
                    <c:otherwise> ${e.attendees.size() } </c:otherwise>
                  </c:choose>

                  <%--
                </c:if>
                --%>
              </td>

              <td><c:out value="${e.eventLocation }" /></td>
              <td>
                
<%--                 ${e.host.getId()} ?? ${user.getId()} --%>
				<c:set var="host_id" value="${e.host.getId() }" />
                <c:choose>
	                <c:when test="${ host_id == user.getId()}">
	                	<b>${user.firstName}</b>
	                </c:when>
	                <c:otherwise>
	                	${e.host.firstName}
	                </c:otherwise>
	            </c:choose>
                
<%--                 ${ e.host.getId() == user.getId() ? "<b>${user.firstName}</b>" : e.host.firstName} <c:set var="hostId" value="${e.host.getId()}" />
                <c:set var="userId" value="${user.id}" /> --%>
<%--                 <c:if test="${e.host.id == user.id}"> YES </c:if> --%>
              </td>
              
              <td>
              YES/NO
              </td>
              
              <td>
                <c:if test="${ user.id == e.host.id }">
                  <a class="btn btn-sm btn-outline-primary" href="/edit/${e.id}"> EDIT</a>&nbsp;| 

                  
<%--                   <form class="" action="/delete/${e.id}" method="post"> --%>
<!-- 					 <input type="hidden" name="_method" value="delete">  -->
<!-- 				    <input class="btn btn-sm btn-ouline-danger" type="submit" value="Delete">  -->
<%--                   </form> --%>
                  

           		<a href="/delete_url/${e.id}" class="btn btn-sm btn-outline-danger">DELETE</a>&nbsp;| 
                </c:if>

                <c:if test="${e.attendees.contains(user)}"> JOINED!!! <a class="btn btn-sm btn-outline-danger" href="/remove/${e.id}">Cancel</a> </c:if>
                <c:if test="${e.attendees.contains(user) == false}"> <a class="btn btn-sm btn-outline-success" href="/join/${e.id}">Join</a> </c:if>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>

      <p></p>
      <h5>events at the same location as the user! ${user.id} - ${user.firstName} location = ${user.location}</h5>
      <table>
        <thead>
          <tr>
            <td>Event id</td>
            <td>Event NAME</td>
            <td>date</td>
            <td>location</td>
            <td>Host</td>
            <td>actions</td>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${sameLocationAsUser}" var="s">
            <tr>
              <td><c:out value="${s.id }" /></td>
              <td><c:out value="${s.eventName }" /></td>
              <td>
                <fmt:formatDate pattern="yyyy-MM-dd" value="${s.eventDate }" />
              </td>
              <td><c:out value="${s.eventLocation }" /></td>
              <td>${s.host.firstName}</td>
              <td><a href="">Join</a> | <a href="">delete</a> | <a href="">Cancel</a></td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
      <p></p>

<%--       <h5>events in OTHER locations (other than ${user.location})</h5> --%>
<!--       <table> -->
<!--         <thead> -->
<!--           <tr> -->
<!--             <td>Event id</td> -->
<!--             <td>Event NAME</td> -->
<!--             <td>date</td> -->
<!--             <td>location</td> -->
<!--             <td>Host</td> -->
<!--             <td>actions</td> -->
<!--           </tr> -->
<!--         </thead> -->
<!--         <tbody> -->
<%--           <c:forEach items="${notSameLocationAsUser}" var="n"> --%>
<!--             <tr> -->
<%--               <td><c:out value="${n.id }" /></td> --%>
<%--               <td><c:out value="${n.eventName }" /></td> --%>
<!--               <td> -->
<%--                 <fmt:formatDate pattern="yyyy-MM-dd" value="${n.eventDate }" /> --%>
<!--               </td> -->
<%--               <td><c:out value="${n.eventLocation }" /></td> --%>
<%--               <td>${n.host.firstName}</td> --%>
<!--               <td><a href="">Join</a> | <a href="">delete</a> | <a href="">Cancel</a></td> -->
<!--             </tr> -->
<%--           </c:forEach> --%>
<!--         </tbody> -->
<!--       </table> -->

      <p></p>
      <h5>Create an Event</h5>
      <form:form action="/createEvent/" method="post" modelAttribute="event">
        <form:input type="hidden" path="host" value="${user.id}" />
        <form:errors path="host" />
        <p>
          <form:label path="eventName">eventName</form:label>
          <form:errors path="eventName" />
          <form:input path="eventName" />
        </p>
        <p>
          <form:label path="eventDate">eventDate</form:label>
          <form:errors path="eventDate" />
          <form:input type="date" path="eventDate" />
        </p>
        <p>
          <%-- <c:out value="${errorLocation }"></c:out> --%>

          <form:label path="eventLocation">eventLocation:</form:label>
          <form:errors path="eventLocation" />
          <form:select path="eventLocation">
            <option value="" label="select a location" disabled selected />
            <form:option value="A" label="A" />
            <form:option value="B" label="B" />
            <form:option value="C" label="C" />
          </form:select>
        </p>

        <input type="submit" value="create Event" />
      </form:form>
		
		
		
	
		
		
		
		
		
	</div>
</body>
</html>