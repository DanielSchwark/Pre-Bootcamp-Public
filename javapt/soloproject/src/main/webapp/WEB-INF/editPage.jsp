<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="/style.css">
<title>Edit</title>
</head>

<body>
	<div class="header">
		<div>
			<h1>Reflections</h1>
		</div>
		<div class="navigation">
		<a class="logout" href="/logout">logout</a>
        <a href="/dashboard">Dashboard</a>
		</div class=navigation>
	</div class=header>

<div class="container">

	<h1>Edit Your Entry</h1>


	<div class="container">
		<form:form action="/entries/${entry.id}" modelAttribute="entry" method="post">
			<input type="hidden" name="_method" value="put"/>

			<div>
				<form:errors path="privateentry"/>
				<form:label for="privateentry" path="privateentry">Entry:</form:label>
				<form:textarea cols="80" rows="10" path="privateentry"/>
			</div>
			
			<div>
				<form:errors path="user"/>
				<form:input type="hidden" path="user" value="${user.id}"/>
			</div>
			
			<div>
				<input type="submit" value="Submit"/>
			</div>
			
		</form:form>
	</div>



</div>
	<div class="footer">
		<p>Powered by <a href="https://unsplash.com/">Unsplash</a></p>
	</div>
</body>
</html>