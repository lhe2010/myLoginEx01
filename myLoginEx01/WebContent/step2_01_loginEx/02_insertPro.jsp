<%@page import="step2_00_loginEx.MemberDTO"%>
<%@page import="step2_00_loginEx.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		
		boolean isFirstMember = MemberDAO.getInstance().insertMember(new MemberDTO(id,passwd,name));		
		
		if (isFirstMember) {
	%> 
			<script type="text/javascript">
				alert("WELCOME~");
				location.href = "00_main.jsp";
			</script>
	<%
		} else {
			%>
			<script type="text/javascript">
				alert("이미 사용된 ID입니다.");
				history.go(-1);
			</script>
	<%
		}
	%>

</body>
</html>