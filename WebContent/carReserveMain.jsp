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
<h2 style="color : indigo; ">가장 HOT한 자동차 추천</h2>
<!-- 데이터베이스에 접속하여 4대의 자동차를 display해주는 과정이 필요함 -->
<%
	carDAO cdao = new carDAO();
	//벡터에 carBean 객체의 list들을 저장함.
	Vector<carBean> vec = cdao.getSelect4Car();
%>
<div align="center" style="height:550px; width:1200px">
<table width="1000">
	<tr height="300">
	<%
	for (int i=0; i < vec.size(); i++) {
		carBean bean = vec.get(i);
	%>
	<td width="250" align="center">
	<a href="index.jsp?Center=carReserveInfo.jsp&no=<%=bean.getNo() %>">
	<img src="images/<%=bean.getImgfile() %>" width="240" height="240">
	</a>
	<p>차량명 : <%=bean.getName() %></p> 
	</td>
	
	<% } %>
	</tr>

</table>

<!-- 하단 정보 출력(검색용) -->
<hr color="skyblue" size="3" >
<h2>차량 검색하기</h2>
<!-- Center 파라미터를 hidden 타입으로 선언하여 전송시 보냄.  -->
<form action="index.jsp" method="post">
	<b>차량검색하기 </b>&nbsp;&nbsp;
	<input type="hidden" name="Center" value="carCategoryList.jsp">
	<select name="category">
		<option value="소형">소형</option>
		<option value="중형">중형</option>
		<option value="준대형">준대형</option>
		<option value="suv">SUV</option>	
	</select>&nbsp;&nbsp;
	<input type="submit" value="유형별 검색" style="background : red; color:white; font-weight:bold;"> 
</form>
<br>
<button onclick="location.href='index.jsp?Center=allCarList.jsp'" style="background : red; color:white; font-weight:bold;">모든차량보기</button>
</div>
</body>
</html>