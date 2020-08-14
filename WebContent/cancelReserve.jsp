<%@page import="model.carDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<%
	String reserveNo = request.getParameter("reserveNo");
	
	carDAO cdao = new carDAO();
	//예약 취소(삭제) METHOD를 수행
	int r_no = Integer.parseInt(reserveNo);//예약번호는 숫자이므로
	cdao.carReserveCancel(r_no);
	
	response.sendRedirect("index.jsp?Center=carReserveCheck.jsp");
%>

</body>
</html>