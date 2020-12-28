<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		String id = (String)session.getAttribute("id");
	%>

	<h2>DELETE ACCOUNT -<%=id %>-</h2>
	<form action="04_deletePro.jsp" method="post">
		<fieldset>
			<p>ID : <input type="text" id="id" name="id" value="<%=id %>" readonly></p> 
			<p><label for="passwd">PASSWORD : </label><input type="password" id="passwd" name="passwd"></p>
			<button type="submit">DELETE ACCOUNT</button>
			<button type="reset">RESET</button>
		</fieldset>
	
	</form>

</body>
</html>