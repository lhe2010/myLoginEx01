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
		
		boolean isDeleted = MemberDAO.getInstance().deleteMember(id, passwd);
		
		if(isDeleted) { // 삭제됨
			session.invalidate();
	%>
			<script type="text/javascript">
				alert("BYEBYE");
				location.href="00_main.jsp";
			</script>
	<%
		} else {
	%>
			<script type="text/javascript">
				alert("YOUR INFO IS INVALID");
				history.go(-1);
			</script>
	<%		
		}
	%>

</body>
</html>