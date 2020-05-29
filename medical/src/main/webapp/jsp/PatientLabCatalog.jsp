<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css"/>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<title>Welcome</title>
</head>
<body>
	 <!-- Navigation -->
	<nav class="w3-bar w3-black">
  		<a href="home.jsp" class="w3-button w3-bar-item">Home</a>
  		<a href="doctorlogin.jsp" class="w3-button w3-bar-item">Doctor</a>
  		<a href="patientloginandsignup.jsp" class="w3-button w3-bar-item">Patient</a>
	</nav> 
	<div class="container">Hi ${id }</div>
	<c:if test="${not empty labs}">
    <c:forEach var="lab" items="${labs}" varStatus="status">
        <div class="container">
	        <div>    
	            <div>${lab.id}</div>
	            <div>${lab.name}</div>
	            <div>${lab.type}</div>
	             
        	</div>
			<div>
				<form:form id="booked${status.index }" action="labbookingprocess" method="post" modelAttribute="bookedlabslots" >
					<form:select path="bookedlabslot" >
						<form:options items="${slots[status.index] }" />
					</form:select>
					<form:input type="hidden" path="patientid" value="${id }" />
					<form:input type="hidden" path="id" value="${lab.id }" />
		 			<input type="submit" name="Submit" value="Submit" tabindex="2" />
				</form:form>
			</div>
		</div>
    </c:forEach>
</c:if>
</body>