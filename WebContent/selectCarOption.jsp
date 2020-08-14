<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<%
	int no = Integer.parseInt(request.getParameter("no")); //자동차 no
	//대여 대수
	int carQty = Integer.parseInt(request.getParameter("carQty"));
	//이미지 정보 파라미터 얻기
	String imgfile = request.getParameter("imgfile");
	
	String name = request.getParameter("name"); //차량명(예약 정보의 한 칼럼으로 저장할 목적임)
	
%>

<div align="center" style="width:1200px;">
<h2> 차량 옵션 선택</h2>
<form action="index.jsp" method="post">
	<input type="hidden" name="Center" value="finalCarReservation.jsp">
<table width="1200">
	<tr>
	<td rowspan="6" style="width:500px;">
	<img src="images/<%=imgfile %>" alt="그림없음" align="center" style="width:470px;">
	</td>
	<td width="200" align="right">차량대여기간 </td>
	<td width="200" align="center">
		<select name="rentDuration">
			<option value="1">1일</option>
			<option value="2">2일</option>
			<option value="3">3일</option>
			<option value="4">4일</option>
			<option value="5">5일</option>
			<option value="6">6일</option>
			<option value="7">7일</option>
		</select>
	</td>
	</tr>
	<tr>
	<td width="200" align="right">Start Day(대여 시작일) </td>
	<td width="200" align="center">
		<input type="date" name="startDay"><td>
	</tr>
	<tr>
	<td width="200" align="right">보험가입 </td>
	<td width="200" align="center">
		<select name="applyInsurance">
			<option value="1">1일[2만원]</option>
			<option value="2">가입하지 않음</option>
		</select>	
	</td>
	</tr>
	<tr>
	<td width="200" align="right">네비게이션 </td>
	<td width="200" align="center">기본장착됨 </td>
	</tr>
	<tr>
	<td width="200" align="right">베이비시트 </td>
	<td width="200" align="center">
		<select name="applyBabySeat">
			<option value="1">1일[1만원]</option>
			<option value="2">필요없음</option>
		</select>	
	</td>
	</tr>
	<tr>
	<td colspan="2" align="center">
		<!-- 아래 2개의 데이터를 넘겨주어야 계산을 할 수 있음. -->
		<input type="hidden" name="no" value="<%=no %>">
		<input type="hidden" name="carQty" value="<%=carQty %>">
		<input type="hidden" name="name" value="<%=name %>"><!-- 차량을 예약정보에 저장하기 위해 -->
		
		<input type="submit"  value="차량 예약하기" style="background:red; color:white;font-weight:bold;">
	 </td>
	</tr>
	
</table>

</form>
</div>
</body>
</html>