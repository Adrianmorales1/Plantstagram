<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
	<div class = "container my-5">
		<div class = "text-center">
			<h1>Plantstagram</h1>
			<h3>A place for friends to share all their Plants journey</h3>
		</div>
		<div class = "text-center mt-2 mb-3">
			<a href ="/register"><button type="button" class="fs-2 p-2  px-4 btn btn-outline-secondary">Register</button></a>
			<button type="button" class="fs-2 p-2 px-4 btn btn-success " disabled>Login</button>
		</div>
			
			<form:form action = "/login" method = "POST" modelAttribute ="newLogin">
			<div>
				<div class = "row justify-content-center">
					<div class = "col-6 text-center bg-danger text-white rounded">
						<form:errors path = "email"/>
						<form:errors path = "password"/>
					</div>
					
				</div>
			</div>
			
			<div class = "row justify-content-center">
					<form:input path = "email" placeholder = "Enter Email" class = "p-1 border-0 border-bottom border-secondary col-7"/>
					<form:input path = "password" type = "password" placeholder = "Enter Password" class = "p-1 border-0 border-bottom border-secondary col-7"/>
					<div class="d-grid gap-2 d-md-block text-center">
  						<input class = "btn btn-secondary my-5 " type = "submit" value = "Submit"/>	
					</div>
			</div>
			</form:form>

	</div>
</body>
</html>