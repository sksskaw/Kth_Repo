<%@page import="model.MemberBean"%>
<%@page import="model.MemberDAO1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<%
	//한글 깨지 방지
	request.setCharacterEncoding("utf-8");

	//form으로부터 파라미터 수신하여 저장하기
	String user_id = request.getParameter("user_id");
	String user_password = request.getParameter("user_password");
	
	//로그인을 위한 아이디와 패스워드 테스트
	MemberDAO1 dao = new MemberDAO1(); 
	MemberBean bean = dao.loginQuery(user_id);
	
	//패스워드의 일치 여부 확인
	if (user_password.equals(bean.getUser_password())){
		//세션을 설정해줌.
		session.setAttribute("user_name", bean.getUser_name());
		session.setAttribute("user_id", bean.getUser_id());
	%>
		//response.sendRedirect("index.jsp"); //메인 홈으로 이동함.
		<script>
			location.href="index.jsp";
		</script>
	<%
	} else { %>
	   
		//out.print("<script>confirm('패스워드가 일치하지 않습니다.')</script>");
		//여기는 확인해보고 필요하면 location.href의 javascript 사용할 것.
		//response.sendRedirect("index.jsp?Center=loginForm.jsp");
		<script>
			alert('패스워드가 일치하지 않습니다.');
			location.href="index.jsp?Center=loginForm.jsp";
		</script>
	<%} %>
	
	
	

%>
</body>
</html>