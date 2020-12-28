<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN PAGE</title>
</head>
<body>
	<h2>LOGIN PAGE</h2>
	<form action="08_loginPro.jsp" method="post">
		<fieldset>
			<p><label for="id">ID : </label><input type="text" id="id" name="id" autofocus></p>
			<p><label for="passwd">PASSWORD : </label><input type="password" id="passwd" name="passwd" ></p>
			<button type="submit">LOGIN</button>
			<button type="reset">RESET</button>
		</fieldset>
	</form>

</body>
</html>