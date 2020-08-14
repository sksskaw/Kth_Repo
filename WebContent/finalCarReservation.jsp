<%@page import="model.carBean"%>
<%@page import="model.carDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

%>
<!-- reserveNo와 user_id는 selectCarOption.jsp에 넘지받지 못함.  -->
<!-- 저장을 위해서는 위의 값을 설정하여 저장해야 함 -->
<!-- reserveNo는 auto_increment 방식을 사용할 예정임. -->
<jsp:useBean id="ReserveBean" class="model.CarReserveBean" >
	<jsp:setProperty  name="ReserveBean" property="*" />
</jsp:useBean> 
<%
	String id = (String)session.getAttribute("user_name");
   

	if (id == null) { //로그인되지 않았다면...
%>
	<script>
		alert("로그인 후 예약이 가능하므로 로그인을 진행합니다.");
		location.href="index.jsp?Center=loginForm.jsp";
	</script>

<%		
	}
	
	//날짜 비교하는 코딩 수행[현재 날짜보다 앞서면 예약 불가능하도록 해야 함]
	//오늘날짜와 선택한 날짜를 비교함.
	Date d1= new Date(); //java.util.Date를 import 할 것.
	Date d2=new Date();
	//날짜를 2019-5-5 포맷해주는 클래스 선언(java.text.SimpleDateFormat 임포트함)
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	d1 = sdf.parse(ReserveBean.getStartDay());//렌트 시작일
	d2 = sdf.parse(sdf.format(d2)); //d2가 현재 날짜를 의미함.
	
	//날짜비교 메소드 사용
	int compare = d1.compareTo(d2); //0,1,2를 리턴함.
	//예약하려는 날짜보다 현재 날짜가 크다면 -1 리턴
	//예약일=현재일 이면   0리턴
	//예약하려는 날짜가 더  크다면 1리턴(따라서 값이 1을 리턴해야 정상임.)
	if (compare < 0 ) {//오늘부터 예약 가능하다고 가정함
	%>
		<script>
			alert("오늘 날짜보다 이전 날짜를 선택하였습니다. 확인바랍니다.");
			history.go(-1); //이전 단계로 이동
		</script>
	<%}
	
	//모든 절차가 완료되었으면 예약 정보 저장 후 예약 내용을 화면에 보여기
 	//예약자의 id(로그인용 id)를 설정해줌
 	String user_id = (String)session.getAttribute("user_id");
 	ReserveBean.setUser_id(user_id); 
 	
 	//데이터베이스에 해당 빈 클래스를 저장하여 예약을 완료함.
 	 carDAO cdao = new carDAO();
 	 
 	//해당 차량 정보 읽어오기[carBean getOneCarData(int no)]
 	carBean cbean = cdao.getOneCarData(ReserveBean.getNo());
 	
 	//차량 대여비용
 	int carCost = cbean.getPrice()*ReserveBean.getCarQty()*ReserveBean.getRentDuration();
 	
 	//옵션 비용 계산을 위한 준비
 	int insuranceFee = 0;//보험료(금액은 추후 수정할 것)
 	if (ReserveBean.getApplyInsurance()==1) insuranceFee=2000;
 	
 	int babyseatFee = 0;//베이비시트(금액은 추후 수정할 것)
 	if (ReserveBean.getApplyBabySeat()==1) babyseatFee=1000;
 	
 	//옵션 금액(대여기간*수량)
 	int optionCost = ReserveBean.getCarQty()*ReserveBean.getRentDuration()*(insuranceFee+babyseatFee);
 	
 	//totalPrice설정
 	int totalPrice = carCost + optionCost;
 	ReserveBean.setTotalPrice(totalPrice);
 	//예약 정보 carReserveTable 테이블에 등록
 	cdao.insertCarReservation(ReserveBean);
 %>
 
 <!-- 예약 결과를 출력해 줌. -->
 <div align="center" style="width:1200px;">
 <h2 style="color : indigo; ">차량 예약 결과</h2>
<table style="width:1200px">
	<tr>
		<td align="center">
		<img src="images/<%=cbean.getImgfile() %>" alt="그림없음" width="450">
		</td>
	</tr> 
	<tr>
		<th align="center">
		<!-- 차량비용 : 하루렌트비 * 렌트차량수 * 대여일수 -->
		렌트 차량 비용 : <%=carCost %>원
		</th>
	</tr> 
	<tr>
		<th align="center">
		<!-- 위에서 미리 계산하였음. 항목 비용은 추후에 수정 필요 -->
		차량 옵션 비용 : <%=optionCost %>원
		</th>
	</tr>
	<tr>
		<th align="center" style="color : red;">
		총 렌트 비용 : <%=totalPrice %>원
		</th>
	</tr>

</table>
 </div>
</body>
</html>