<%@page import="model.carBean"%>
<%@page import="java.util.Vector"%>
<%@page import="model.carDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<div align="center" style="width:1200px;">
<%
	request.setCharacterEncoding("utf-8"); 
	//카테고리 분류값을 받음.(소형, 중형, 준대형, suv, 전기)
	String category1 = request.getParameter("category");
%>
<h2 style="color : indigo; ">렌트중인 <%=category1 %> 차량 살펴보기</h2>
<table style="width:1200px">
<%
	carDAO cdao = new carDAO();
	//DB로부터 읽어와 넘겨받음.
	Vector<carBean> vec = cdao.getCarCategory(category1);
	
	//한 행당 4개씩 출력하도록 테이블 코딩
	int j=0;
	for (int i=0; i < vec.size(); i++) {
		carBean bean = vec.get(i); 
		if (j%4 == 0) {
%>
	<tr height="300">
<% } %>	
	<td width="250" align="center">
	<a href="index.jsp?Center=carReserveInfo.jsp&no=<%= bean.getNo()%>">
	<img src="images/<%=bean.getImgfile() %>" width="240" height="240">
	</a>
	<p>차량명 : <%=bean.getName() %> <br>차량가격 : <%=bean.getPrice() %>만원</p>  
	</td>
	
<% 
	j = j+1;
	} %>

</table>
</div>
</body>
</html>