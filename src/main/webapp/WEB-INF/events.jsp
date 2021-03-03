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
  /* body * {
    margin-left: 10px;
  } */
   table {
   box-shadow: 1px 1px 30px lightgrey;
   width: 70%;
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
  form {
/*     outline: 1px solid grey; */
    box-shadow: 1px 1px 30px lightgrey;
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
  .fs {
  	border: 0;
/*   	outline: 0; */
  	width: 50%;
  	margin: 0 auto;
  }
  .fsi {
  display:inline-block;
  vertical-alight: top;
  }
  
/* body { padding-top: 70px; } */
</style>
<meta charset="ISO-8859-1">
<title>CodeUp | Dashboard</title>
</head>
<body>
<div class="container">	
		
	<nav class="navbar navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand">{ CodeUp }</a>
    
    <div class="d-flex">
    <div class="collapse navbar-collapse" id="navbarScroll">
      <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Link
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Link</a>
        </li>
      </ul>
    
    
    
    <span class=" me-2">logged in as ${user.firstName}</span>
<!--       <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"> -->
<!--       <button class="btn btn-outline-success" type="submit">Search</button> -->
    </div>
  </div>
</nav>
		
		
			
		<h2>Welcome! <a href="/user/${user.id}"> <c:out value="${user.firstName}"/> </a> </h2>
		<a href="/logout">logout</a>
		

		
		
		
		
		${deleted }
      <p></p>
      
      	<p></p>
		<form class="form-control-lg fs" action="/search" method="post">
			<input class="form-control fsi" type="text" name="query" placeholder="search events" required="required" pattern="[A-Za-z0-9]{1,20}" /><p></p>
			<input type="submit" class="btn btn-outline-primary" value="Search Events" /> &nbsp;&nbsp;&nbsp; <a class="btn btn-outline-primary" href="/clear">CLEAR</a>
		</form>
	<p></p>
      	
      	
      	
      	
      	
      	
    <c:set var="foundEs" value="${foundEvents.size()}" />
      	
      	
      	
      <c:choose>
      	
      <c:when test="${foundEs > 0}">
      	<h4>showing results for "${noEventsFoundByQuery}" <a class="btn btn-outline-secondary" href="/clear">clear results</a></h4>
<%--       	<c:forEach items="${foundEvents}" var="es"> --%>
      		
<!--      FOUND EVENTS -=-=-=-=-=-=-=--=--=--=-= -->
      		
      	<table class="table table-hover table-responsive table-bordered">
        <thead class="thead-dark">
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
          <c:forEach items="${foundEvents}" var="e">
            <tr>
              <td><c:out value="${e.id }" /></td>
              <td>
              <c:set var="prive" value="${e.privateEvent}" />
                <c:choose>
                	<c:when test="${prive == true && user.id != e.host.id}">
                		${e.eventName }
                	</c:when>
                	<c:otherwise>
                		<a href="/show/${e.id}"> ${e.eventName } </a>
                	</c:otherwise>
                </c:choose>
<%--                 <a href="/show/${e.id}"> ${e.eventName } </a> --%>
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
<%--               <c:set var="prive" value="${e.privateEvent}" /> --%>
              <c:choose>
              	<c:when test="${prive == true }">
              		<span class="red">Yes</span>
              	</c:when>
              	<c:otherwise>
              		No
              	</c:otherwise>
              </c:choose>
              </td>
              
              <td>
<!--                 <div class="d-flex justify-content-evenly"> -->
                <div class="d-flex flex-row bd-highlight">
                	
                
                <c:if test="${ user.id == e.host.id }">
                  <
                  	
                  <a class="btn btn-sm btn-outline-primary" href="/edit/${e.id}"> EDIT</a>&nbsp;| 
                  

                  
<%--                   <form class="" action="/delete/${e.id}" method="post"> --%>
<!-- 					 <input type="hidden" name="_method" value="delete">  -->
<!-- 				    <input class="btn btn-sm btn-ouline-danger" type="submit" value="Delete">  -->
<%--                   </form> --%>
                  
				
					
           		<a href="/delete_url/${e.id}" class="btn btn-sm btn-outline-danger">DELETE</a>&nbsp;| 
                </c:if>

                	
                <c:if test="${e.attendees.contains(user)}"> JOINED!!! <a class="btn btn-sm btn-outline-danger" href="/remove/${e.id}">Cancel</a> </c:if>
                
                	
                <c:if test="${e.attendees.contains(user) == false && prive != true}"> <a class="btn btn-sm btn-outline-success" href="/join/${e.id}">Join</a> </c:if>
                <c:if test="${prive == true && user.id == e.host.id}"> yes</c:if>
                
                </div>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
      		
      		
      		
      		
      		
      		
      		
      		
<!--       		/found events -=-==-=-=-=-=-=-=-=-=-=-=-=-=-==--=-=-= -->
      		
      </c:when>
      <c:otherwise>
      	no events found for "${noEventsFoundByQuery}"
<%--       </c:otherwise> --%>
<%--       </c:choose> --%>
      
      
      
<!--       original table  ============  ==================================== -->
      
      <h4>all events!</h4>
      <p></p>
      <table class="table table-hover table-responsive table-bordered">
        <thead class="thead-dark">
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
            <c:set var="joined" value="${e.attendees.contains(user)}"/>
            <c:choose>
            	<c:when test="${joined == true }">
            	
            <tr class="table-success">
            	</c:when>
            	<c:otherwise>
            		<tr>
            	</c:otherwise>
            </c:choose>
              <td><c:out value="${e.id }" /></td>
              <td>
              <c:set var="prive" value="${e.privateEvent}" />
                <c:choose>
                	<c:when test="${prive == true && user.id != e.host.id}">
                		${e.eventName }
                	</c:when>
                	<c:otherwise>
                		<a href="/show/${e.id}"> ${e.eventName } </a>
                	</c:otherwise>
                </c:choose>
<%--                 <a href="/show/${e.id}"> ${e.eventName } </a> --%>
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
<%--               <c:set var="prive" value="${e.privateEvent}" /> --%>
              <c:choose>
              	<c:when test="${prive == true }">
              		<span class="red">Yes</span>
              	</c:when>
              	<c:otherwise>
              		No
              	</c:otherwise>
              </c:choose>
              </td>
              
              <td>
                <div class="d-flex flex-row bd-highlight">
                
                <c:if test="${ user.id == e.host.id }">
                  <a class="btn btn-sm btn-outline-primary" href="/edit/${e.id}"> EDIT</a>&nbsp;&nbsp; 

                  
<%--                   <form class="" action="/delete/${e.id}" method="post"> --%>
<!-- 					 <input type="hidden" name="_method" value="delete">  -->
<!-- 				    <input class="btn btn-sm btn-ouline-danger" type="submit" value="Delete">  -->
<%--                   </form> --%>
                  

           		<a href="/delete_url/${e.id}" class="btn btn-sm btn-outline-danger">DELETE</a>&nbsp;&nbsp;
                </c:if>

                <c:if test="${e.attendees.contains(user)}"> (JOINED)&nbsp;&nbsp; <a class="btn btn-sm btn-outline-danger" href="/remove/${e.id}">Cancel</a> </c:if>
                <c:if test="${e.attendees.contains(user) == false && prive != true}"> <a class="btn btn-sm btn-outline-success" href="/join/${e.id}">Join</a> </c:if>
                <c:if test="${prive == true && user.id == e.host.id}"> yes</c:if>
                </div>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
      </c:otherwise>
      </c:choose>
      
      
      
<!--    =====================================================================    -->
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
        
        <p>
        	<form:label path="privateEvent">Is this a Private Event?</form:label><br/>
        	<form:radiobutton path="privateEvent" value="1"/> Private <i class="em em-dark_sunglasses" aria-role="presentation" aria-label=""></i><br>
        	<form:radiobutton path="privateEvent" value="0"/> Public <i class="em em-loudspeaker" aria-role="presentation" aria-label="PUBLIC ADDRESS LOUDSPEAKER"></i><br>
        	
        </p>

        <input type="submit" value="create Event" />
      </form:form>
		
		
		
	
		
		
		
		
		
	</div>
</body>
</html>