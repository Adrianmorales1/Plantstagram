<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Journal</title>
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
		<h1>Create your own Journal for <c:out value = "${plant.nicknameOfPlant}"></c:out> the <c:out value = "${plant.nameOfPlant}"></c:out>!</h1>
		<form:form action = "/journal/create/${plant.id}" method = "POST" modelAttribute="journal">
			<div class = "mb-3 row justify-content-center rounded">
				<div class = "col-6 text-center bg-danger text-white rounded">
					<form:errors path = "title"></form:errors>
					<form:errors path = "text"></form:errors>
				</div>
			</div>

			<div class = "mb-3">
				<form:input path = "title" class = "form-control" placeholder = "Enter Title of Journal"/>
				<form:textarea path = "text" class = "form-control" placeholder = "Enter Journal Post"/>
			</div>
			<input type="submit" value = "Submit">
		</form:form>
	</div>
</body>
</html>