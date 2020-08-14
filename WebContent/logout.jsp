<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%
//세션 제거 [한번에 지우기 : session.invalidate()]
session.removeAttribute("user_name");
session.removeAttribute("user_id");

//모든 세션 제거
//session.invalidate();
//response.sendRedirect("index.jsp");
%>

//스크립트를 사용하여 수행하는 방법
<script>
	alert("로그아웃하였습니다.");
	location.href="index.jsp";
</script>
</body>
</html>