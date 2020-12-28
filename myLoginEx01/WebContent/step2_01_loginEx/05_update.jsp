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
	
	<h2>UPDATE ACCOUNT -<%=id %>-</h2>
		<form action="06_updatePro.jsp" method="post">
			<fieldset>
				<p><label for="id">ID : </label><input type="text" id="id" name="id" value="<%=id %>" readonly></p>
				<p><label for="passwd">PASSWORD : </label><input type="password" id="passwd" name="passwd" autofocus ></p>
				<p><label for="name">NEW NAME : </label><input type="text" id="name" name="name" ></p>
				<button type="submit">UPDATE</button>
				<button type="reset">RESET</button>
			</fieldset>
		</form>
</body>
</html>