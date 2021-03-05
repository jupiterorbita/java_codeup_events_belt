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
<script type="text/javascript" src="js/main.js"></script>


<style>
  /* body * {
    margin-left: 10px;
  } */
   body {
   bkacground-color: rgb(238, 238, 238);
   }
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
/*     width: 50%; */
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
  	margin-top: 20px;
  	border-radius: 15px;
  	
  }
  .fsi {
  display:inline-block;
  vertical-alight: top;
  }
.profile_pic_sm {
	width: 50px;
  border-radius: 50px;
/*   box-shadow: 1px 1px 10px lightgrey; */
/*   border: 2px solid grey; */
  
  }
 td.no-padding {
 	padding: 5px;
 	width:50px;
  }
  
/* body { padding-top: 70px; } */
h2 {
	displa:inline-block;
}
h5 {
	text-align: center;
}
a {
	text-decoration: none;
}
.message {
 	text-align: center;
	background-color: rgb(209, 227, 254);
	color: rgb(74, 69, 163);
	width: 70%;
/* 	display: inline-block; */
	display: block;
	margin: 0 auto;
}
.pad {
	padding: 20px;
  	border-radius: 15px;
}
.search-box {
	display: inline-block;
	vertical-align: top;
	width: 75%;
}
</style>
<meta charset="ISO-8859-1">
<title>CodeUp | Dashboard</title>
</head>
<body>
<%-- user.profilepic.getProfileImagePath() -->  ${user.profilepic.getProfileImagePath()} <br> --%>
<%-- user.profilepic.id ----> ${user.profilepic.id} <br> --%>
<%-- user.getProfilepic() --> ${user.getProfilepic()} <br> --%>
<%-- user.profilepic.getPic() --> ${user.profilepic.getPic()} --%>
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
	<a href="/logout">logout</a> 
				
      <p></p>
      
      	<p></p>
		<form class="form-control-lg fs" action="/search" method="post">
			<input class="form-control fsi search-box" type="text" name="query" placeholder="search events" required="required" pattern="[A-Za-z0-9]{1,20}" />
			<input type="submit" class="btn btn-outline-primary" value="Search Events" />
<!-- 			 &nbsp;&nbsp;&nbsp;  -->
<!-- 			<a class="btn btn-outline-primary" href="/clear">CLEAR</a> -->
		</form>
	<p></p>
      	
      	
      	
      	
      	
      	
    <c:set var="foundEs" value="${foundEvents.size()}" />
      	
      	
      	
      <c:choose>
      	
      <c:when test="${foundEs > 0}">
      	<h4>showing results for "${noEventsFoundByQuery}" <a class="btn btn-outline-warning" href="/clear">clear results</a></h4>
<%--       	<c:forEach items="${foundEvents}" var="es"> --%>
      		
<!--      FOUND EVENTS -=-=-=-=-=-=-=--=--=--=-= -->
      		
      	<table class="table table-hover table-responsive table-bordered">
        <thead class="thead-dark">
          <tr>
            <td></td>
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
              <td> 
              <c:out value="${e.id }" /></td>
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
		<span class="message"><strong> ${message_join } ${message_create } ${deleted } ${message_removed } </strong></span>
      
      <p></p>
      <table class="table table-hover table-responsive table-bordered">
        <thead class="thead-dark">
          <tr>
            <td></td>
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
              <td class="no-padding">
<%--               <c:out value="${e.id }" /> --%>
              
               <c:set var="imgTD" value="${e.host.profilepic.getPic() }"/>
				 <c:choose>
					<c:when test="${imgTD == '' }" > 	
				 		<img class="profile_pic_sm" src="/images/blank.png"> 
				 	</c:when>
				 	<c:otherwise>
						 <img class="profile_pic_sm" src="${e.host.profilepic.getProfileImagePath()}"> 
				 	</c:otherwise>
				 </c:choose>
              
              
              
<!--               <img class="profile_pic_sm" src="/images/blank.png">  -->
              
              
              
              
              
              
              </td>
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

                <c:if test="${e.attendees.size() < 6 }" >
                	
	                <c:if test="${e.attendees.contains(user)}"> (JOINED)&nbsp;&nbsp; <a class="btn btn-sm btn-outline-danger" href="/remove/${e.id}">Cancel</a> </c:if>
	                <c:if test="${e.attendees.contains(user) == false && prive != true}"> <a class="btn btn-sm btn-outline-success" href="/join/${e.id}">Join</a> </c:if>
	                <c:if test="${prive == true && user.id == e.host.id}"> yes</c:if>
                </c:if>
                </div>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
      </c:otherwise>
      </c:choose>
      
      
      
<!--    =====================================================================    -->
<!--       <p></p> -->
<%--       <h5>events at the same location as the user! ${user.id} - ${user.firstName} location = ${user.location}</h5> --%>
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
<%--           <c:forEach items="${sameLocationAsUser}" var="s"> --%>
<!--             <tr> -->
<%--               <td><c:out value="${s.id }" /></td> --%>
<%--               <td><c:out value="${s.eventName }" /></td> --%>
<!--               <td> -->
<%--                 <fmt:formatDate pattern="yyyy-MM-dd" value="${s.eventDate }" /> --%>
<!--               </td> -->
<%--               <td><c:out value="${s.eventLocation }" /></td> --%>
<%--               <td>${s.host.firstName}</td> --%>
<!--               <td><a href="">Join</a> | <a href="">delete</a> | <a href="">Cancel</a></td> -->
<!--             </tr> -->
<%--           </c:forEach> --%>
<!--         </tbody> -->
<!--       </table> -->
<!--       <p></p> -->

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
      
      <div class="fs">
	      <h5>Create an Event</h5>
	      <form:form class="pad" action="/createEvent/" method="post" modelAttribute="event">
	        <form:input type="hidden" path="host" value="${user.id}" />
	        <form:errors path="host" />
	        <p>
	          <form:label path="eventName">eventName</form:label>
	          <form:input path="eventName" />
	          <form:errors path="eventName" class="text-danger"/>
	        </p>
	        <p>
	          <form:label path="eventDate">eventDate</form:label>
	          <form:input type="date" path="eventDate" />
	          <form:errors path="eventDate" class="text-danger"/>
	        </p>
	        <p>
	          <%-- <c:out value="${errorLocation }"></c:out> --%>
	
	          <form:label path="eventLocation">eventLocation:</form:label>
	          <form:select path="eventLocation">
	            <option value="" label="select a location" disabled selected />
	            <form:option value="A" label="A" />
	            <form:option value="B" label="B" />
	            <form:option value="C" label="C" />
	          </form:select>
	          <form:errors path="eventLocation" class="text-danger" />
	        </p>
	        
	        <p>
	        	<form:label path="privateEvent">Is this a Private Event?</form:label><br/>
	        	<form:radiobutton path="privateEvent" value="1"/> Private <i class="em em-dark_sunglasses" aria-role="presentation" aria-label=""></i><br>
	        	<form:radiobutton path="privateEvent" value="0"/> Public <i class="em em-loudspeaker" aria-role="presentation" aria-label="PUBLIC ADDRESS LOUDSPEAKER"></i><br>
	        	
	        </p>
	
	        <input type="submit" value="create Event" />
	      </form:form>
      </div>
      
</div>
</body>
</html>