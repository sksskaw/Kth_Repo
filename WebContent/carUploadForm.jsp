<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>

table {
	border-collapse: collapse;
	background : lightgray;
	}
td.td1 {text-align : right;
	}
td.td2 {text-align : left; }
.buttonSize {font-size : 18px;
	font-weight : bold;
	color : white;
	background : darkblue;
}
td {height : 40px;}
input {font-size : 18px;}

</style>
</head>
<body>
<%
	String user_id = (String)session.getAttribute("user_id");
	
	if (user_id == null) { %>
	<script>
		alert("로그인 후 사용 가능하여 로그인 페이지로 이동합니다.");
		location.href="index.jsp?Center=loginForm.jsp";
	</script>	
	<%}
	
	//admin(관리자)만이 차량 등록이 가능하다고 가정하자.
	else if (!user_id.equals("admin")) { %>
	  <script>
	  alert("시스템 관리자만이 차량 등록을 할 수 있습니다.");
	  location.href="index.jsp";
	  </script>
	  
<% }
	%>


	
<div  align="center" style="width:1200px; height:650px;">	
<h1>신규 차량 정보 업로드</h1>
<form action="carUploadProc.jsp" method="post" enctype="multipart/form-data">
<table border="1" style="border-color : blue;">
<tr>
  <td class="td1">자동차이름 : &nbsp;</td><td class="td2"> &nbsp;<input type="text" name="name" size="25"></td>
</tr> 
<tr>
  <td class="td1">자동차제작사 : &nbsp;</td><td class="td2" style="font-size:18px;"> &nbsp;
  <select name="company">
		<option value="현대자동차">현대자동차</option>
		<option value="기아자동차">기아자동차</option>
		<option value="쉐보레자동차">쉐보레자동차</option>
		<option value="르노자동차">르노자동차</option>	
		<option value="쌍용자동차">쌍용자동차</option>
	</select> 
</tr> 
<tr>
  <td class="td1">자동차구분 : &nbsp;</td><td class="td2"> &nbsp;
	<select name="category">
		<option value="소형">소형</option>
		<option value="중형">중형</option>
		<option value="준대형">준대형</option>
		<option value="suv">SUV</option>	
	</select> 
  </td>
</tr>
<tr>
  <td class="td1">탑승인원 : &nbsp;</td><td class="td2"> &nbsp;
  <input type="text" name="passengers" size="5">&nbsp;명</td>
</tr>
<tr>
  <td class="td1">사용 연료 : &nbsp;</td><td class="td2" > &nbsp;
	<select name="fuel">
		<option value="가솔린">가솔린</option>
		<option value="경유">경유</option>
		<option value="lpg">LPG</option>
		<option value="전기">전기</option>	
		<option value="hybrid">하이브리드</option>
	</select> 
</tr>
<tr>
  <td class="td1">배기량 : &nbsp;</td><td class="td2"> &nbsp;<input type="text" name="cc" size="5">&nbsp;CC</td>
</tr>   
<tr>
  <td class="td1">차량렌트비 : &nbsp;</td><td class="td2"> &nbsp;<input type="text" name="price" size="8">&nbsp;원/1일</td>
</tr> 
<tr>
  <td class="td1">차량특징설명 : &nbsp;</td><td class="td2"> &nbsp;<textarea rows="7" cols="50" name="info"></textarea></td>
</tr> 
<tr>
<!-- 이지지파일[단, 가급적이면 파일이름과 자동차이름을 동일하게 맵핑할 것] -->
  <td class="td1">차량이미지 : &nbsp;</td><td class="td2"> &nbsp;<input type="file" name="imgfile" ></td>
</tr>
<tr>
  <td colspan="2" align="center"><input class="buttonSize" type="submit" value="신규자동차등록하기" ></td>
</tr>
</table>
</form>
</div>
</body>
</html>