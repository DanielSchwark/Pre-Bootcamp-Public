<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<title>Index</title>
</head>
<body>
	<div class="header">
		<div>
			<h1>Reflections</h1>
		</div>
		<div class="randomimage">
			<img src="https://source.unsplash.com/random" alt="Random Image from Unsplash" width="25%" height="25%">
		</div>
		<div class="navigation">
		<a class="logout" href="/logout">logout</a>
		</div class=navigation>
		
	</div class=header>
	<div class="explained">
		<p>This website is meant for a daily private diary entry.</p>
		<p>No likes no public posts no leaderboard.</p>
		<p>Simply a place for you to take 15 minutes to reflect on your day.</p>
		<p>Refresh the page for a random image to inspire your entry.</p>
	</div>
	<div class="logorreg">
	<div class="log">
		<form:form action="/register" method="post" modelAttribute="newUser">
			<table>
				<thead>
					<tr>
						<td>Register</td>
					</tr>
				</thead>
				<thead>
					<tr>
						<td>User Name:</td>
						<td>
							<form:errors path="userName"/>
							<form:input path="userName"/>
						</td>
					</tr>
					<tr>
						<td>Email:</td>
						<td>
							<form:errors path="email"/>
							<form:input path="email"/>
						</td>
					</tr>
					<tr>
						<td>Password:</td>
						<td>
							<form:errors path="password"/>
							<form:input path="password"/>
						</td>
					</tr>
					<tr>
						<td>Confirm:</td>
						<td>
							<form:errors path="confirm"/>
							<form:input path="confirm"/>
						</td>
					</tr>
					<tr>
						<td><input class="button" type="submit" value="Submit"/></td>
					</tr>
				</thead>
			</table>
		</form:form>
	</div>
	<div class="reg">
		<form:form action="/login" method="post" modelAttribute="newLogin">
			<table>
				<thead>
					<tr>
					<td>Log In</td>
					</tr>
				</thead>

				<thead>
					<tr>
						<td>Email:</td>
						<td>
							<form:errors path="email"/>
							<form:input path="email"/>
						</td>
					</tr>
		
					<tr>
						<td>Password:</td>
						<td>
							<form:errors path="password"/>
							<form:input path="password"/>
					</td>
					</tr>
		
					<tr>
						<td><input class="button" type="submit" value="Submit"/></td>
					</tr>
				</thead>
			</table>
		</form:form>
	</div>
	</div>
	
	<div class="footer">
		<p>Powered by <a href="https://unsplash.com/">Unsplash</a></p>
	</div>
</body>
</html>