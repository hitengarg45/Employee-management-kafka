<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Project</title>
<!-- Access the bootstrap css like this, 
        Spring boot will handle the resource mapping automatically -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">

<style type="text/css">
<%@include file="/WEB-INF/css/home.css"%>
</style>
</head>

<body>
	<jsp:include page="Navbar.jsp" />
	<div class="emp-button">
		<a href="http://localhost:8081/employees"><button
				class="btn btn-success">Get all Employees</button></a>
		</p>
	</div>
</body>
</html>