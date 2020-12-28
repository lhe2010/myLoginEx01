<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOIN PAGE</title>
</head>
<body>
	<h2>JOIN FORM</h2>
	<form action="02_insertPro.jsp" method="post">
		<fieldset>
			<p><label for="id">ID : </label><input type="text" id="id" name="id" autofocus></p>
			<p><label for="passwd">PASSWORD : </label><input type="password" id="passwd" name="passwd" ></p>
			<p><label for="confirmPasswd">CONFIRM PASSWORD : </label><input type="password" id="confirmPasswd" name="confirmPasswd" ></p>
			<p><label for="name">NAME : </label><input type="text" id="name" name="name" ></p>
			<button type="submit">JOIN</button>
			<button type="reset">RESET</button>
		</fieldset>
	</form>

</body>
</html>