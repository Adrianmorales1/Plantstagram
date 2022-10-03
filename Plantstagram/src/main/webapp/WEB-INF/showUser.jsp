<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile Page</title>
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
		
		<div class = "container text-center">
			<h1><c:out value = "${user.firstName}"></c:out> <c:out value = "${user.lastName}"></c:out></h1>
			<h1>Plants Created</h1>
			<div class = "row row-cols-1 row-cols-md-3 text-center">
			<c:forEach var = "plant" items = "${user.plants}">
				<div class = "col-xl-3 col-lg-4 col-md-6 mb-4">
					<div class="card ">
						  <img src="https://picsum.photos/id/200/320/200" class="card-img-top" alt="plant">
						  <div class="card-body">
						    <h5 class="card-title"><c:out value = "${plant.nameOfPlant}"></c:out> (<c:out value = "${plant.nicknameOfPlant}"></c:out>)</h5>
						    <p class="card-text"><c:out value = "${plant.description}"></c:out></p>
							<div>
								<a href = "plant/${plant.id}" class = "btn btn-primary">Show Plant</a>
							</div>
						  </div>
						  <div class="card-footer">
						    <a href="/plant/edit/${plant.id}" class = "btn btn-outline-success">Edit Plant</a>
						    <a href="/plant/delete/${plant.id}" class = "btn btn-outline-danger">Delete Plant</a>
						  </div>
					</div>
				</div>
			</c:forEach>
			</div>
		</div>
		
</body>
</html>