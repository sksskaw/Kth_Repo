<%@page import="model.carBean"%>
<%@page import="model.carDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	//DB에 접근하여 해당 데이터 가져오기
	carDAO  cdao = new carDAO();
	//선택된 렌트카 하나의 정보를 읽어옴
	carBean bean = cdao.getOneCarData(no);
	
%>

<div align="center" style="width:1200px;">
<h2><%=bean.getName() %> 차량으로 예약하기</h2>
<form action="index.jsp" method="post">
	<input type="hidden" name="Center" value="selectCarOption.jsp">
<table width="1200">
	<tr>
	<td rowspan="9" style="width:500px;">
	<img src="images/<%=bean.getImgfile() %>" alt="그림없음" align="center" style="width:470px;">
	</td>
	<td width="200" align="center">차량명 </td>
	<td width="200" align="center"><%=bean.getName() %></td>
	</tr>
	<tr>
	<td width="200" align="center">렌트차량 수 </td>
	<td width="200" align="center">
		<select name="carQty">
			<option value="1">1
			<option value="2">2
			<option value="3">3
		</select></td>
	</tr>
	<tr>
	<td width="200" align="center">차량종류 </td>
	<td width="200" align="center"><%=bean.getCategory() %></td>
	</tr>
	<tr>
	<td width="200" align="center">배기량(cc) </td>
	<td width="200" align="center"><%=bean.getCc() %></td>
	</tr>
	<tr>
	<td width="200" align="center">탑승인원 </td>
	<td width="200" align="center"><%=bean.getPassengers() %></td>
	</tr>
	<td width="200" align="center">사용 연료 </td>
	<td width="200" align="center"><%=bean.getFuel() %></td>
	</tr>
	<tr>
	<td width="200" align="center">대여가격 </td>
	<td width="200" align="center"><%=bean.getPrice() %>원</td>
	</tr>
	<tr>
	<td width="200" align="center">제조사 </td>
	<td width="200" align="center"><%=bean.getCompany() %></td>
	</tr>
	<tr>
	<td colspan="2" align="center">
		<input type="hidden" name="no" value="<%=bean.getNo()%>">
		<input type="hidden" name="imgfile" value="<%=bean.getImgfile()%>">
		<input type="hidden" name="name" value="<%=bean.getName() %>">
		
		<input type="submit"  value="옵션 선택 후 렌트 진행하기" style="background:red; color:white;font-weight:bold;">
	 </td>
	</tr>
	
</table>

</form>
<!-- 여기에 차량 상세보기 넣은 것도 좋을 듯함. -->
<h3 style="color:pink">차량 상세 설명</h3>
<p style="color:darkblue;font-weight:bold;"><%=bean.getInfo() %>
</p>
</div>
</body>
</html>