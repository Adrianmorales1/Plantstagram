<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
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
	
	<div class = "container text-center mt-3">
		<h1>Hello, <c:out value = "${user.firstName}"></c:out> <c:out value = "${user.lastName}"></c:out></h1>
		
		<c:forEach var = "journal" items = "${allJournals}">
			<div class ="row justify-content-center my-3">
				<div class="card col-xl-5 col-lg-7 col-md-8 col-sm-10">
				  <img class="card-img-top" src="https://picsum.photos/id/200/320/200" alt="Card image cap">
				  <div class="card-body">
				    <h5 class="card-title"><c:out value = "${journal.title}"></c:out></h5>
				    <p class="card-text"><c:out value = "${journal.text}"></c:out></p>
				    <ul class="list-group list-group-flush">
					    <li class="list-group-item"><c:out value = "${journal.plant.nameOfPlant}"></c:out></li>
					    <li class="list-group-item text-muted">By: <c:out value = "${journal.plant.user.firstName}"></c:out> <c:out value = "${journal.plant.user.lastName}"></c:out></li>
					    <li class = "list-group-item mt-3"> <a href="/plant/${journal.plant.id}" class="btn btn-success">Check Out the Plant!</a></li>
					</ul>
				    </div>
				</div>
			</div>
		</c:forEach>
	</div>
	
</body>
</html>