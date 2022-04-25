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

<style type="text/css">
body {
	background-image:
		url("https://www.pinclipart.com/picdir/big/354-3541550_are-your-employees-really-present-mentorship-clipart.png");
	background-repeat: no-repeat;
	background-position: 400px 100px;
	background-size: 1000px;
}
div.container{
	position:absolute;
	top:100px;
	margin-left:350px;
}
</style>

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
					<th scope="col">State</th>
					<th scope="col">Status</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="employee" items="${Employees}">
					<c:if test="${employee.status == 'active'}">
						<tr>
							<td>${employee.firstName}</td>
							<td>${employee.lastName}</td>
							<td>${employee.jobTitle}</td>
							<td>${employee.email}</td>
							<td>${employee.dateOfBirth}</td>
							<td>${employee.city}</td>
							<td>${employee.state}</td>
							<td>${employee.status}</td>
							<td><a
								href="http://localhost:8081/employees/${employee.id}/update"><button
										type="button" class="btn btn-primary">Update</button></a></td>
							<td><a
								href="http://localhost:8081/employees/${employee.id}/delete">
									<button type="button" class="btn btn-danger">Delete</button>
							</a></td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script type="text/javascript"
		src="webjars/bootstrap/4.6.0/js/bootstrap.min.js"></script>
</body>
</html>