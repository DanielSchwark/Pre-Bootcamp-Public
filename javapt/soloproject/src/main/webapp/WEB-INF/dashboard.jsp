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
<title>Dashboard</title>
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

<div class="container">
<p>Welcome <c:out value="${user.userName}"></c:out>!</p>

<div class="newentry">
    <h1>Write a new entry</h1>
    <form:form action="/entries" modelAttribute="entry" method="post">
        <div>
            <form:errors path="privateentry" class="error"/>
            <form:label path="privateentry" for="privateentry">Entry</form:label>
            <form:textarea cols="80" rows="10" path="privateentry"/>
        </div>
        <div>
            <form:errors path="user" class="error"/>
            <form:input type="hidden" path="user" value="${user.id}" class="form-control"/>
        </div>
        <div>
            <input class="button" type="submit" value="Submit"/>
        </div>
    </form:form>

<%
        Date date = new Date();
        out.print( "<p align = \"center\">" +date.toString()+"</p>");
%>

</div>

<div class="recententries">
    <h1>Recent entries</h1>
    <c:forEach var="entry" items="${entries}">
        <div class="singleentry">
				<div class="datentime">
					<td>Written On:<c:out value="${entry.createdAt}"/></td>
                    
                    <td>Editted On:<c:out value="${entry.updatedAt}"/></td>
                </div>
                <div>

					<td>

                            <c:out value="${entry.privateentry}"/>

                    </td>

                </div>
                <div class="editdelete">
                <div>
                    <button><a href="/entries/${entry.id}/edit">edit</a></button>
                </div>
                <div>
                    <form action="/entries/${entry.id}" method="post">
                        <input type="hidden" name="_method" value="delete">
                        <input type="submit" value="Delete">
                    </form>
                </div>
                </div>
        </div>
	</c:forEach>
</div>

</div class="container">

<div class="footer">
    <p>Powered by <a href="https://unsplash.com/">Unsplash</a></p>
</div>
</body>
</html>