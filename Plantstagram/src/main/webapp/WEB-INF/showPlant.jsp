<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The <c:out value = "${plant.nameOfPlant}"></c:out></title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
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
	
	<div class = "container mt-4 text-center p-2 border border-dark rounded">
		<div class = "row">
			<div class = "col-xl-4 col-lg-4 col-md-6 col-12">
				<img src="https://picsum.photos/id/200/320/200" class="border border-dark rounded" alt="plant">
			</div>
			<div class = "col-xl-4 col-lg-4 col-md-6 col-12">
				<h1 class = "text-center">Name: <c:out value = "${plant.nameOfPlant}"></c:out></h1>
				<h2 class = "text-center">Nickname: <c:out value = "${plant.nicknameOfPlant}"></c:out></h2>
				<h2 class = "text-center">By: <c:out value = "${plant.user.firstName}"></c:out> </h2>
			</div>
			<div class = "col-xl-4 col-lg-4 col-12">
				<h2>Watering Schedule:</h2>
				<h3><c:out value = "${plant.numberDate}"></c:out> times per <c:out value = "${plant.nameDate}"></c:out></h3>
				<c:if test = "${plant.user.id == userId}">
					<a href = "/journal/create/${plant.id}" class = "btn btn-outline-primary">Post a Journal!</a>
					<div class = "row justify-content-around mt-2">
						<a href = "/plant/edit/${plant.id}" class = "btn btn-outline-success col-4">Edit Plant!</a>
						<a href = "/plant/delete/${plant.id}" class = "btn btn-outline-danger col-4">Delete Plant!</a>
					</div>
					
				</c:if>
			</div>
		</div>
		<div class ="row m-4 p-3">
			<h2 class = "border-bottom"> Description:</h2>
			<p><c:out value = "${plant.description}"></c:out></p>
		</div>
	</div>
	
	<div class = "container mt-4 text-center p-2">
		<h1 class = "border-bottom">Journal</h1>
		
		<div class ="row justify-content-start px-3">
			<c:forEach var = "journal" items = "${plant.journals}">
			<div class="card text-center col-xl-2 col-lg-3  col-md-4 col-sm-6">
			  <div class="card-body">
			  	<h4 class="card-text"><c:out value = "${journal.title}"></c:out></h4>
			    <h5 class="card-title text-muted"><c:out value = "${journal.dayPosted}"></c:out></h5>
			    <a href="/journal/${journal.id}" class="btn btn-primary">Show Journal</a>
			    <c:if test = "${plant.user.id == userId}">
			    	<a href="/journal/delete/${journal.id}" class="btn btn-outline-danger">Delete Journal</a>
			    </c:if>
			  </div>
			 </div>
			</c:forEach>
			 <c:if test = "${plant.journals.size() == 0 }">
			 	<h3 class = "text-muted mt-3">No Journal Entries Posted</h3>
			 </c:if>
		</div>
	</div>
	
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>