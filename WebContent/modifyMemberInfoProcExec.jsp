<%@page import="model.MemberDAO1"%>
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
	//한글 깨짐 방지
	request.setCharacterEncoding("utf-8");
	//user_hobby는 String[]이므로 별도로 처리필요
	String [] user_hobby = request.getParameterValues("user_hobby");
	String hobby=""; //체크박스 내용을 문자열로 저장
	
	try{
		for (int i=0; i < user_hobby.length; i++){
			hobby += user_hobby[i] + " ";
		}
	} catch(NullPointerException e) {
	%>
		<script type="text/javascript">
		alert("취미를 한가지 이상 선택해 주세요");
        history.go(-1);
        </script>
	<% } %>
	
%>

<!-- 파라미터의 갯수가 다를 경우에는 동일한 이름의 bean 객체 변수에 전달됨.  나머지는 버려짐-->
<!-- 여기서는 MemberBean 객체명으로 bean을 사용함. -->
<jsp:useBean id="bean" class="model.MemberBean"  />
<jsp:setProperty property="*" name="bean"/>

<!-- 패스워드(널을입력하지 않는다 가정), 이메일, 전화번호 및 취미의 재설정만 가능하다고 가정하였다.. -->
<!-- 유효성 체크를 생략하기 위해 널을 입력하지 않는다고 가정하였다..  -->
<%
	//bean.setUser_hobby() 설정
	bean.setUser_hobby(hobby);
	//회원 가입 정보를 DB에 저장
	MemberDAO1 dao = new MemberDAO1();
	dao.modifyOneMember(bean);

%>

<script>
	alert("회원님의 정보를 수정하였습니다.");
	location.href = "index.jsp";
</script>

</body>
</html>