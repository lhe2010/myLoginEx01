<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myLogin mainPage</title>
</head>
<body>
	<%
		String id = (String)session.getAttribute("id");
	
		if (id == null) {
	%>
		<h1>WELCOME TO MAINPAGE!!</h1>
		<p><a href="01_insert.jsp">JOIN US!</a></p>
		<p><a href="07_login.jsp">LOG IN!</a></p>
	<%
		} else {
	%>
		<h1>WELCOME <%=id %> </h1>
		<p><a href="05_update.jsp">UPDATE ACCOUNT</a></p>
		<p><a href="03_delete.jsp">DELETE ACCOUNT</a></p>
		<p><a href="09_logout.jsp">LOGOUT!</a></p>		
	<%
		}
	%>
</body>
</html>