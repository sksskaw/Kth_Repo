<%@page import="model.CarReserveBean"%>
<%@page import="java.util.Vector"%>
<%@page import="model.carDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head></head>
<body>

<%
	String user_id = (String)session.getAttribute("user_id");
	
	if (user_id == null) { %>
	<script>
		alert("로그인 후 사용 가능하여 로그인 페이지로 이동합니다.");
		location.href="index.jsp?Center=loginForm.jsp";
	</script>
	<%}%>
<%
	//로그인되어 있는 아이디를 읽음.(여러개 예약할 수 있음: 예약 정보를 읽어옴)
	carDAO cdao = new carDAO();
	Vector<CarReserveBean> vec = cdao.getAllReservation(user_id);

%>

<!-- 예약 결과를 확인하기 위한 출력 페이지. -->
 <div align="center" style="width:1200px; height:500px;">
 <h2 style="color : indigo; ">차량 예약 결과 확인</h2>
<table style="width:1200px" border="1">
	<tr height="30">
	<td align="center">예약번호</td><td align="center">차량명</td>
	<td align="center">렌트대수</td><td align="center">렌트시작일</td>
	<td align="center">렌트기간</td><td align="center">보험가입유무</td>
	<td align="center">베이비시트유무</td><td align="center">가격</td>
	<td align="center">삭제여부</td>
	</tr>
	<%
		String insurance ="";
		String babyseat="";
		
		for (int i=0; i < vec.size(); i++){
			CarReserveBean bean = vec.get(i);
			if (bean.getApplyInsurance()==1){
				insurance = "Yes";
			} else {
				insurance = "No";
			}
			if (bean.getApplyBabySeat()==1){
				babyseat = "Yes";
			} else {
				babyseat = "No";
			}
	%>
	<tr>		
	<td align="center"><%=bean.getReserveNo() %></td>
	<td align="center"><%=bean.getName() %></td>
	<td align="center"><%=bean.getCarQty() %>대</td>
	<td align="center"><%=bean.getStartDay() %></td>
	<td align="center"><%=bean.getRentDuration() %></td>
	<td align="center"><%=insurance %></td>
	<td align="center"><%=babyseat %></td>
	<td align="center"><%=bean.getTotalPrice() %>원</td>
	<td align="center"><button onclick="location.href='cancelReserve.jsp?reserveNo=<%=bean.getReserveNo() %>'">
		삭제</button></td>
	</tr>	
	<% } %>
</table>
</div>
</body>
</html>