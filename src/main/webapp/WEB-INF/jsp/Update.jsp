<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Update Employee</title>
<!-- Access the bootstrap css like this, 
        Spring boot will handle the resource mapping automatically -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">

</head>
<body>
	<jsp:include page="Navbar.jsp" />
	<div class="container">
		<form:form action="http://localhost:8081/project/employees/${Employee.id}/update" method="post" modelAttribute="employee">
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="firstName">First Name</label> <form:input type="text"
						class="form-control" id="firstName" value="${Employee.firstName}" path="firstName"/>
				</div>
				<div class="form-group col-md-6">
					<label for="lastName">Last Name</label> <form:input type="text"
						class="form-control" id="lastName" value="${Employee.lastName}" path="lastName"/>
				</div>
			</div>
			<div class="form-group">
				<label for="inputAddress">Job Title</label> <form:input type="text"
					class="form-control" id="jobTitle" value="${Employee.jobTitle}" path="jobTitle"/>
			</div>
			<div class="form-group">
				<label for="email">Email</label> <form:input type="email"
					class="form-control" id="email" value="${Employee.email}" path="email"/>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="dateOfBirth">DOB</label> <form:input type="text"
						class="form-control" id="dateOfBirth" value="${Employee.dateOfBirth}" path="dateOfBirth"/>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="city">City</label> <form:input type="text"
						class="form-control" id="city" value="${Employee.city}" path="city"/>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="status">Status</label> <form:input type="text"
						class="form-control" id="status" value="${Employee.status}" path="status"/>
				</div>
			</div>
			<button type="submit" class="btn btn-primary">Update Employee</button>
		</form:form>
	</div>
</body>
</html>