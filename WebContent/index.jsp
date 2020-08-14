<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Sun Rise Rent-A-Car</title>
<style>

</style>
</head>
<body>
<%
	/* 한글이 깨지는 현상을 없애줌. 메인에 반드시 존재해야 함. */
	request.setCharacterEncoding("utf-8");
	String center = request.getParameter("Center");
//out.print(center);
	//최초 실행시에는 center 값이 null이므로
	if (center == null) {
		center = "center.jsp"; //기본 센터 출력 파일임.
		  
	}
%>
<div id="indextop" align="center" style="margin-top : -25px;">
<!-- top 부분에 파일을 불러와 display함  -->
<jsp:include page="top.jsp"></jsp:include>

<!-- center 부분에 include함  -->
<jsp:include page="<%=center %>"></jsp:include>	

<!-- bottom 부분에 파일을 불러와 display함 -->
<jsp:include page="bottom.jsp"></jsp:include>
</div>
</body>
</html>