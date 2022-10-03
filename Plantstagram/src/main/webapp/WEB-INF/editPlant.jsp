<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Plant</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
	<header>
		<ul class="nav bg-dark justify-content-end p-4">
		  <li class="nav-item">
		    <a class="nav-link active" href="/dashboard">Home</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="/plant/create">Create a Plant!</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href = "/profile">Profile</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link text-secondary" href = "/logout">Logout</a>
		  </li>
		</ul>
	</header>
	
	<div class="container text-center my-5">
		<h1>Edit your Plant</h1>
		<form:form action = "/plant/edit/${plant.id}" method = "POST" modelAttribute="plant">
			<input type="hidden" name="_method" value = "put"/>
			<div class = "mb-3 row justify-content-center rounded">
				<div class = "col-6 text-center bg-danger text-white rounded">
					<form:errors path = "nameOfPlant"></form:errors>
					<form:errors path = "nicknameOfPlant"></form:errors>
					<form:errors path = "description"></form:errors>
					<form:errors path = "numberDate"></form:errors>
					<form:errors path = "nameDate"></form:errors>
				</div>
			</div>

			<div class = " row mb-3">
				
				<form:input path = "nameOfPlant" class = "form-control col-lg-6" placeholder = "Enter Name of Plant"/>
				<form:input path = "nicknameOfPlant" class = "form-control"  placeholder = "Enter Nickname of Plant"/>
				<form:textarea path = "description" class = "form-control" placeholder = "Enter Description"/>
				<div>
					<form:input path = "numberDate" type = "number"/>
					<form:select path = "nameDate">
						<option value = "Week">Week</option>
						<option value = "Month">Month</option>
					</form:select>
				</div>
			</div>
			<input type="submit" value = "Submit">
		</form:form>
	</div>
</body>
</html>