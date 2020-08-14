<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#loginform {
     width : 360px;
     height : 550px;
     margin : 0 auto;
	 font-weight : bold;
	 font-size : 20px;
	 padding : 10px;
	 margin-top : 100px;
	 }
h1 {color : Blue;	 
input{
    font-size : 18px;
	line-height : 25px;
}
button {
    font-size : 18px;
}
</style>
</head>
<body>
<div id="loginform">
<h2 style="text-align : center">로그인 창</h2>
<br/>
<form action="loginFormProc.jsp" method="post" style="background:lightgreen" >
  <fieldset >  <!-- style="border-color:red"  : 이것은 둘레 선의 색을 지정함-->
    <legend align="center" style="font-size:20px">아이디/비밀번호 로그인</legend>
	<br/>
    <label>- 아이디(ID): <input type="text" style="background-color:lightgray" name="user_id" size="20" autocomplete="off" required></label><br><br/>
    <label>- 비밀 번호 : <input type="password" style="background-color:lightgray" name="user_password" size="20"  autocomplete="off" required><label>
    <br><br>
    <center><button type="submit" ><strong>로그인하기</strong></button>
	<button type="reset" ><strong>초기화</strong></button>
	</center>
  </fieldset>
</form>
</div>
</body>
</html>