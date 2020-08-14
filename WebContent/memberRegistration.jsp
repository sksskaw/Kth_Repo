<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Registration</title>
<link rel="stylesheet" href="css/style.css" />
<style>
#container {
   margin : 0 auto;
   width : 600px;
   background-color : #DEF5FF;
   font-weight : bold;
   padding : 10px;
}
#submit1 {
   text-align : center;
   font-size : 25px;
}
h1 { text-align : center;}

input[type=button] {
	background : red;
	color : white;
	font-weight : bold;
	font-size : 20px;
	padding : 3px 10px;
}

</style>
<script>
	/*간단한게 작성한 폼 유효성 검사 함수[상세한 것은 여러분의 몫으로 ...] */
	function validationCheck() {
		var commonForm = document.regForm;
		
		if (commonForm.user_id.value == "") {
			alert("아이디를 입력해 주세요.");
			commonForm.user_id.focus();
			return false;
		}else if (commonForm.user_password.value == "") {
			alert("비밀번호를 입력해 주세요.");
			commonForm.user_password.focus();
			return false;
		}else if (commonForm.user_password1.value == "") {
			alert("비밀번호를 입력해 주세요.");
			commonForm.user_password1.focus();
			return false;
		} else if (commonForm.user_password.value != commonForm.user_password1.value) {
			alert("패스워드가 맞지 않으니, 다시 확인바랍니다.");
			commonForm.user_password.select();
			return false;
		}
		
		commonForm.submit();
		
		
	}

</script>
</head>
<body>
<div id="container">
<h1>회원가입 사이트</h1>
<br>
<form name="regForm" action="memberRegistrationProc.jsp" method="post">
<table>  <!-- 7행 2열의 가단한 로그인 폼 -->
<tr><td style="text-align:right">아 이 디 :</td><td><input type="text" name="user_id" size="20" autofocus autocomplete="off"></td></tr>
<tr><td style="text-align:right">패스 워드:</td><td><input type="password" name="user_password" size="20"  autocomplete="off"></td></tr>
<tr><td style="text-align:right">패스워드 재입력:</td><td><input type="password" name="user_password1" size="20"  autocomplete="off"></td></tr>
<tr><td style="text-align:right">이&nbsp;&nbsp;&nbsp;름 :</td><td><input type="text" name="user_name" size="20"  autocomplete="off"></td></tr>
<tr><td style="text-align:right">성&nbsp;&nbsp;&nbsp;별 :</td><td><input name="user_gender" type="radio" value="male">남성
         &nbsp;&nbsp;<input name="user_gender" type="radio" value="female">남성</td></tr>
<tr><td style="text-align:right">E-mail:</td><td><input type="email" name="user_email" size="30" maxlength="30"></td></tr>
<tr><td style="text-align:right">전화번호:</td><td><input type="tel" name="user_phone" size="11" maxlength="11">
                         <span style="color:red; font-size:small;">주) - 없이 입력</span></td></tr>
<tr><td style="text-align:right">취&nbsp;&nbsp;&nbsp;미 :</td>
    <td><input type="checkbox" name="user_hobby" value="음악">음악
	    <input type="checkbox" name="user_hobby" value="미술">미술
		<input type="checkbox" name="user_hobby" value="체육">체육
		<input type="checkbox" name="user_hobby" value="독서">독서
		<input type="checkbox" name="user_hobby" value="영화">영화
		<input type="checkbox" name="user_hobby" value="쇼핑">쇼핑</td>
	</tr>
<tr><td style="text-align:right">가입소감:</td><td><textarea name="user_impress" cols="50" rows="4" maxlength="100" placeholder="100자 이내만 입력 가능함."></textarea></td></tr>
</table>

<p id="submit1"><input onclick="validationCheck()" type="button" value="가입하기"></p>
</form>
</div>

</body>
</html>