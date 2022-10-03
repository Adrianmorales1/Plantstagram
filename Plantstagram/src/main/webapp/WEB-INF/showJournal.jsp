<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Journal Entry</title>
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
	
	<div class = "container text-center mt-5">
		<div class = "row justify-content-center">
			<div class = "col-xl-8 col-lg-7 col-md-12 border">
				<div class="jumbotron">
				  <h1 class="display-4"><c:out value = "${plant.nameOfPlant}"></c:out></h1>
				  <p class="lead">Journal Entry</p>
				  <hr class="my-4">
				  <p><c:out value = "${journal.text}"></c:out></p>
				 </div>
				 <a href = "/plant/${plant.id}" class = "btn btn-outline-success mb-4">Back to Plant</a>
			</div>
			<div class = "col-xl-4 col-lg-7 col-md-12 border">
				<img src="https://picsum.photos/id/200/320/200" class = "p-2" alt="plant">
			</div>
		</div>
	</div>
	
</body>
</html>