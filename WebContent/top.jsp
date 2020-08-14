<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
div.top {
	width : 1200px;
	height : 170px;
	background : mistyrose;
	position : relative;
}
table.nav {
	width : 1200px;
	height : 25px;
	font-weight : bold;
	font-size : 20px;
	margin-top : 5px;	
}
.nav td {
	text-align : center;
	height : 25px;
	padding : 4px 0px;
	background : red;
	border-left : 1px solid white;
}


.nav td:hover {
 	background : green;
 }
.nav a {
	text-decoration : none;
	color : white;
	font-weight : bold;
}
.log {
	text-decoration : none;
	color : indigo;
}
.log:hover{
	color : olivedrab;
}
#topIcon {
	position : absolute;
	left : 350px;
	top : 28px;
}

</style>
</head>
<body>
<%
  //세션을 이용한 로그인 처리
  String id = (String)session.getAttribute("user_name");
  //로그인이 되어있지 않다면,...
  if (id==null) {
	  id ="GUEST";
  }
%>
<div class="top">
 <a href="index.jsp" id="topIcon" ><img src="images/sunrise.png" style="width:40px"></a>
 <h1 style="font-size:2.5em; text-align:center; padding-top : 20px;">Sun Rise Rent-A-Car</h1>
 <div style="text-align:right; margin-right : 15px;">
 <span style="color:red;"><%=id %>님! </span>&nbsp;&nbsp;
 <%
 	if (id.equals("GUEST")) { %>
 		<button onclick="location.href='index.jsp?Center=loginForm.jsp'">로그인 </button>
 		| <button onclick="location.href='index.jsp?Center=memberRegistration.jsp'">회원가입 </button>
 <% }
	 else { %>
  		<button onclick="location.href='logout.jsp'">로그아웃 </button> |
		<button onclick="location.href='index.jsp?Center=modifyMemberInfo.jsp'">회원정보수정 </button>
	<% } %>
</div>	
 <table class="nav">
 <tr><td><a href="index.jsp?Center=carReserveMain.jsp">예 약 하 기</a></td>
 <td><a href="index.jsp?Center=carReserveCheck.jsp">예 약 확 인</a></td>
 <td><a href="#">자유게시판</a></td>
<!-- 아래는 차량 업로드를 연습하기 위해 추가한 것임. 원래는 이벤트 메뉴를 사용하였음. -->
 <td>
 	<a href="index.jsp?Center=carUploadForm.jsp">차량등록하기</a>
 </td>
 <td>
 <a href="#">고객센터</a></td></tr>
 </table>

</div>
</body>
</html>