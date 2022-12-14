<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Plant</title>
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
		<h1>Create your own Plant</h1>
		<form:form action = "/plant/create" method = "POST" modelAttribute="plant">
			<div class = "mb-3 row justify-content-center rounded">
				<div class = "col-6 text-center bg-danger text-white rounded">
					<form:errors path = "nameOfPlant"></form:errors>
					<form:errors path = "nicknameOfPlant"></form:errors>
					<form:errors path = "description"></form:errors>
					<form:errors path = "numberDate"></form:errors>
					<form:errors path = "nameDate"></form:errors>
				</div>
			</div>
			<div class = "row mb-3">
				<div class = "col-md-6 p-2">
					<form:input path = "nameOfPlant" class = "form-control" placeholder = "Enter Name of Plant"/>
				</div>
				<div class = "col-md-6 p-2">
					<form:input path = "nicknameOfPlant" class = "form-control" placeholder = "Enter Nickname of Plant"/>
				</div>
				<div class = "col-md-12">
					<form:textarea path = "description" class = "form-control" placeholder = "Enter Description"/>
				</div>
				
				<div class = "row justify-content-center align-items-center mt-2">
					<div class = "col-md-12">
						<form:label path = "numberDate">How many times do you water the Plant?</form:label>
					</div>
					<div class = "col-md-2 col-sm-3 col-3">
						<form:input path = "numberDate" class = " col-xl-6 form-control" type = "number"/>
					</div>
					<div class = "col-md-1 col-sm-1 col-2">
						<form:label path = "nameDate">days a </form:label>
					</div>
					<div class = "col-md-2 col-sm-4 col-4">
						<form:select path = "nameDate" class = " col-xl-6 form-control">
								<option value = "Week">Week</option>
								<option value = "Month">Month</option>
							</form:select>
					</div>
				</div>
			</div>
			<input type="submit" class = "btn btn-outline-primary text-center" value = "Submit">
		</form:form>
	</div>
	
	
</body>
</html>