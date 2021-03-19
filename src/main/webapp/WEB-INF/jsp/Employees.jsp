<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Employees Data</title>

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
		<table class="table table-dark">
			<thead>
				<tr>
					<th scope="col">First Name</th>
					<th scope="col">Last Name</th>
					<th scope="col">Job Title</th>
					<th scope="col">Email</th>
					<th scope="col">DOB</th>
					<th scope="col">City</th>
					<th scope="col">Status</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="i" begin="0" end="${Employees.size() - 1}">
					<tr>
						<td>${Employees.get(i).firstName}</td>
						<td>${Employees.get(i).lastName}</td>
						<td>${Employees.get(i).jobTitle}</td>
						<td>${Employees.get(i).email}</td>
						<td>${Employees.get(i).dateOfBirth}</td>
						<td>${Employees.get(i).city}</td>
						<td>${Employees.get(i).status}</td>
						<td><a href="http://localhost:8081/project/employees/${Employees.get(i).id}/update"><button type="button" class="btn btn-primary">Update</button></a></td>
						<td><button type="button" class="btn btn-danger">Delete</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script type="text/javascript"
		src="webjars/bootstrap/4.6.0/js/bootstrap.min.js"></script>
</body>
</html>