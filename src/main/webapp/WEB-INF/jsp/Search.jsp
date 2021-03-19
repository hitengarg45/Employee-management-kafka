<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Employee</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
</head>
<body>
	<jsp:include page="Navbar.jsp" />
	<div class="container"></div>
	<form action="http://localhost:8081/project/employees/search"
		method="post">
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="firstName">First Name</label>
				<input type="text" class="form-control" id="firstName"
					name="firstName"/>
			</div>
		</div>
		<button type="submit" class="btn btn-primary">Search Employee</button>
	</form>
</body>
</html>