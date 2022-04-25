<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Employee</title>
<style type="text/css">

</style>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<script type="text/javascript">
<%@include file="/WEB-INF/js/jquery.js"%>
</script>
<script type="text/javascript">
<%@include file="/WEB-INF/js/state.js"%>
</script>
</head>
<body>
	<jsp:include page="Navbar.jsp" />
	<div class="container">
		<form id="search-form" action="http://localhost:8081/employees/search"
			method="post">
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="firstName">First Name</label> <input type="text"
						class="form-control" id="firstName" name="firstName" />
				</div>
				<div class="form-group col-md-6">
					<label for="lastName">Last Name</label> <input type="text"
						class="form-control" id="lastName" name="lastName" />
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="jobTitle">Job Title</label> <input type="text"
						class="form-control" id="jobTitle" name="jobTitle" />
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
						<label for="state">State</label> 
						<select class="form-control" name="state" id="state" form="search-form" onchange='selct_district(this.value)'></select>
				</div>
				<div class="form-group col-md-6">
					<label for="city">City</label> 
					<select class="form-control" name="city" id="city" form="search-form"></select>
				</div>
			</div>
			<button type="submit" class="btn btn-primary">Search
				Employee</button>
		</form>
	</div>
</body>
</html>